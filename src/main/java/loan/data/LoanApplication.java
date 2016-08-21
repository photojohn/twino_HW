package loan.data;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class LoanApplication {
	/** Loan ID */
	private long id;
	/** Amount in EUR */
	private double amount;
	/** Term in months */
	private int term;
	/** Name */
	private String name;
	/** Surname */
	private String surname;
	/** Personal ID number */
	private String personalID;
	/** Date application was received */
	private Calendar applicationDate;
	/** Application status */
	private boolean approved = false;
	/** IP geolocation 8 */
	private String country;

	public LoanApplication(double amount, int term, String name, String surname, String personalID) {
		this(0, amount, term, name, surname, personalID, GregorianCalendar.getInstance(), false, null);
	}

	public LoanApplication(long id, double amount, int term, String name, String surname, String personalID, Calendar applicationDate, boolean approved, String country) {
		this.id = id;
		this.amount = amount;
		this.term = term;
		this.name = name;
		this.surname = surname;
		this.personalID = personalID;
		this.applicationDate = applicationDate;
		this.approved = approved;
		this.country = country;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public double getAmount() {
		return amount;
	}

	public int getTerm() {
		return term;
	}

	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}

	public String getPersonalID() {
		return personalID;
	}

	public Calendar getApplicationDate() {
		return applicationDate;
	}

	public boolean isApproved() {
		return approved;
	}
	
	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
