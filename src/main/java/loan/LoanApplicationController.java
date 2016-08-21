package loan;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import loan.data.LoanApplication;

@RestController
public class LoanApplicationController {

	@RequestMapping(path = "/loan", method = RequestMethod.POST)
	public LoanApplication requestLoan(@RequestParam(value = "amount") Double amount,
			@RequestParam(value = "term") Integer term, @RequestParam(value = "name") String name,
			@RequestParam(value = "surname") String surname, @RequestParam(value = "personalID") String personalID,
			HttpServletRequest request) {
		return Loans.createLoanApplication(amount, term, name, surname, personalID, request.getRemoteAddr());
	}

	@RequestMapping(path = "/loan", method = RequestMethod.GET)
	public List<LoanApplication> listLoanApplications(
			@RequestParam(value = "personalID", defaultValue = "") String personalID) {
		return Loans.getApplications(personalID);
	}

	@RequestMapping(path = "/addTest", method = RequestMethod.GET)
	public LoanApplication addTest(HttpServletRequest request) {
		return Loans.createLoanApplication(
				((double) Math.round(new Random().nextDouble() * Math.pow(10, new Random().nextInt(6)))) / 100,
				new Random().nextInt(59) + 1, "TestName", "TestSurname", "111111-11111", request.getRemoteAddr());
	}

}
