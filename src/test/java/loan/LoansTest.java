package loan;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Random;

import org.junit.BeforeClass;
import org.junit.Test;

import loan.data.LoanApplication;
import tools.DB;

public class LoansTest {

	@BeforeClass
	public static void testDB() {
		Connection conn = null;
		try {
			conn = DB.source.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			assertTrue("Get connection", conn != null);
			try {
				conn.close();
			} catch (Throwable ignore) {
			}
		}
	}

	@Test
	public void testApplicationCreation() {
		Loans.lastReceived.clear();
		assertTrue("New application - simple",
				Loans.createLoanApplication(200, 12, "TestName1", "TestSurname1", "111111-11111", "172.156.25.47")
						.isApproved());
		int totalCnt = Loans.getApplications("").size();
		int sameCnt = Loans.getApplications("222222-22222").size();
		Loans.createLoanApplication(400, 6, "TestName2", "TestSurname2", "222222-22222", "10.116.25.47");
		assertTrue("Count applications in DB", totalCnt + 1 == Loans.getApplications("").size());
		assertTrue("Count applications in DB for user", sameCnt + 1 == Loans.getApplications("222222-22222").size());
	}

	@Test
	public void testApplicationOverLoad() {
		Loans.lastReceived.clear();
		Loans.createLoanApplication(200, 12, "TestName11", "TestSurname11", "333333-33333", "217.23.10.111");
		int totalCnt = Loans.getApplications("").size();
		int sameCnt = Loans.getApplications("333333-33333").size();
		try {
			Thread.sleep(500 / Integer.parseInt(LoansProperties.getProperty(LoansProperties.REQUESTS_PER_SEC)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertFalse("New application - simple",
				Loans.createLoanApplication(200, 12, "TestName11", "TestSurname11", "333333-33333", "217.23.10.111")
						.isApproved());
		assertTrue("Count applications in DB", totalCnt == Loans.getApplications("").size());
		assertTrue("Count applications in DB for user", sameCnt == Loans.getApplications("333333-33333").size());
		try {
			Thread.sleep(1000 / Integer.parseInt(LoansProperties.getProperty(LoansProperties.REQUESTS_PER_SEC)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		assertTrue("New application - simple",
				Loans.createLoanApplication(200, 12, "TestName11", "TestSurname11", "333333-33333", "217.23.10.111")
						.isApproved());
		assertTrue("Count applications in DB", totalCnt + 1 == Loans.getApplications("").size());
		assertTrue("Count applications in DB for user", sameCnt + 1 == Loans.getApplications("333333-33333").size());
	}

	@Test
	public void testApplicationBlacklist() {
		Loans.lastReceived.clear();
		String id = "" + new Random().nextInt(999999999);
		boolean wasBlocked = Loans.isBlackListed(id);
		if (!wasBlocked) {
			Loans.blockUser(id);
		}
		int totalCnt = Loans.getApplications("").size();
		int sameCnt = Loans.getApplications(id).size();
		assertFalse("New application - simple",
				Loans.createLoanApplication(200, 12, "TestName22", "TestSurname22", id, "123.156.48.65").isApproved());
		assertTrue("Count applications in DB", totalCnt == Loans.getApplications("").size());
		assertTrue("Count applications in DB for user", sameCnt == Loans.getApplications("444444-44444").size());
		if (!wasBlocked) {
			Loans.unblockUser(id);
		}
	}

	@Test
	public void testValuesInDB() {
		Loans.lastReceived.clear();
		LoanApplication a = Loans.createLoanApplication(333, 12, "TestName22", "TestSurname22", "111111-11111",
				"123.156.48.65");
		LoanApplication b = Loans.getApplication(a.getId());
		assertTrue("Application shoult be in DB with ID=" + a.getId(), b != null);
		assertEquals("Compare amount", a.getAmount(), b.getAmount(), 0);
		assertEquals("Compare term", a.getTerm(), b.getTerm());
		assertEquals("Compare name", a.getName(), b.getName());
		assertEquals("Compare surname", a.getSurname(), b.getSurname());
		assertEquals("Compare personalid", a.getPersonalID(), b.getPersonalID());
		assertEquals("Compare applicationdate", a.getApplicationDate(), b.getApplicationDate());
		assertEquals("Compare country", a.getCountry(), b.getCountry());
	}
}
