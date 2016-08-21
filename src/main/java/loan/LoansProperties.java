package loan;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.postgresql.ds.PGPoolingDataSource;

public class LoansProperties {
	private static final Properties prop = init();
	public static final String REQUESTS_PER_SEC = "loans.persec";

	public static String getProperty(String key) {
		return prop.getProperty(key);
	}

	private static Properties init() {
		Properties ret = new Properties();
		InputStream input = null;
		try {
			input = new FileInputStream("loans.properties");
			ret.load(input);
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
