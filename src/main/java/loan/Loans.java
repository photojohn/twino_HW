package loan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import loan.data.LoanApplication;
import tools.DB;
import tools.IPGeolocation.GeoData;

public class Loans {
	private static final Logger log = LoggerFactory.getLogger(Loans.class);
	/** Date, when last application was received */
	static Hashtable<String, Calendar> lastReceived = new Hashtable<String, Calendar>();
	/** milliseconds between application requests */

	public static LoanApplication createLoanApplication(double amount, int term, String name, String surname,
			String personalID, String ip) {
		LoanApplication application = new LoanApplication(amount, term, name, surname, personalID);
		if (validate(application, ip)) {
			storeApplication(application);
		}
		return application;
	}

	private static boolean validate(LoanApplication appl, String ip) {
		String country = GeoData.getCountryCodeByIP(ip, "LV");
		try {
			appl.setCountry(country);
			if (lastReceived.containsKey(country)) {
				if (appl.getApplicationDate().getTimeInMillis() - lastReceived.get(country).getTimeInMillis() < (1000/Integer.parseInt(LoansProperties.getProperty(LoansProperties.REQUESTS_PER_SEC)))) {
					log.debug("Too many requests per seccond");
					return false;
				}
			}
			if (isBlackListed(appl.getPersonalID())) {
				log.debug("Caught blacklisted [" + appl.getPersonalID() + "]");
				return false;
			}
		} finally {
			lastReceived.put(country, appl.getApplicationDate());
		}
		return true;
	}

	public static boolean isBlackListed(String personalID) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DB.source.getConnection();
			ps = conn.prepareStatement("select * from blacklist where personalid = ?");
			ps.setString(1, personalID);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			log.error("Can't check against blacklist [" + personalID + "]", e);
			return true;
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}
	}

	static void blockUser(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DB.source.getConnection();
			ps = conn.prepareStatement("insert into blacklist (personalid) values (?)");
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			log.error("Can't insert in blacklist blacklist [" + id + "]", e);
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}

	}

	static void unblockUser(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DB.source.getConnection();
			ps = conn.prepareStatement("delete from blacklist where personalid = ?");
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			log.error("Can't remove from blacklist blacklist [" + id + "]", e);
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}

	}

	private static void storeApplication(LoanApplication appl) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DB.source.getConnection();
			ps = conn.prepareStatement("select nextval('loans_id_seq')");
			ResultSet rs = ps.executeQuery();
			rs.next();
			appl.setId(rs.getLong(1));
			ps.close();
			ps = conn.prepareStatement(
					"INSERT INTO loans (id, amount, term, name, surname, personalid, applicationdate, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setLong(1, appl.getId());
			ps.setDouble(2, appl.getAmount());
			ps.setInt(3, appl.getTerm());
			ps.setString(4, appl.getName());
			ps.setString(5, appl.getSurname());
			ps.setString(6, appl.getPersonalID());
			ps.setTimestamp(7, new java.sql.Timestamp(appl.getApplicationDate().getTimeInMillis()));
			ps.setString(8, appl.getCountry());
			appl.setApproved(ps.executeUpdate() > 0);
			ps.close();
		} catch (SQLException e) {
			log.error("Can't store application", e);
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}

	}

	public static List<LoanApplication> getApplications(String personalID) {
		Connection conn = null;
		PreparedStatement ps = null;
		List<LoanApplication> ret = new LinkedList<>();
		try {
			conn = DB.source.getConnection();
			if (personalID == null || personalID.isEmpty()) {
				ps = conn.prepareStatement("select * from loans");
			} else {
				ps = conn.prepareStatement("select * from loans where personalid = ?");
				ps.setString(1, personalID);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Calendar date = Calendar.getInstance();
				date.setTimeInMillis(rs.getTimestamp("applicationdate").getTime());
				ret.add(new LoanApplication(rs.getLong("id"), rs.getDouble("amount"), rs.getInt("term"),
						rs.getString("name"), rs.getString("surname"), rs.getString("personalID"), date, true,
						rs.getString("country")));
			}
			ps.close();
		} catch (SQLException e) {
			log.error("Can't get applications", e);
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}
		return ret;
	}

	public static LoanApplication getApplication(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		LoanApplication appl = null;
		try {
			conn = DB.source.getConnection();
			ps = conn.prepareStatement("select * from loans where id = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Calendar date = Calendar.getInstance();
				date.setTimeInMillis(rs.getTimestamp("applicationdate").getTime());
				appl = new LoanApplication(rs.getLong("id"), rs.getDouble("amount"), rs.getInt("term"),
						rs.getString("name"), rs.getString("surname"), rs.getString("personalID"), date, true,
						rs.getString("country"));
			}
			ps.close();
		} catch (SQLException e) {
			log.error("Can't get single application", e);
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}
		return appl;
	}

	 static LoanApplication deleteApplication(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		LoanApplication appl = null;
		try {
			conn = DB.source.getConnection();
			ps = conn.prepareStatement("delete from loans where id = ?");
			ps.setLong(1, id);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			log.error("Can't delete single application", e);
		} finally {
			try {
				ps.close();
			} catch (Throwable ignore) {
			}
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}
		return appl;
	}

}
