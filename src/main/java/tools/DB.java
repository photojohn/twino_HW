package tools;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.postgresql.ds.PGPoolingDataSource;

public class DB {
	private static Properties prop = new Properties();
	public static final PGPoolingDataSource source = init();

	private static PGPoolingDataSource init() {
		InputStream input = null;
		try {
			input = new FileInputStream("db.properties");
			prop.load(input);
			PGPoolingDataSource ret = new PGPoolingDataSource();
			ret.setDataSourceName("twino");
			ret.setServerName(prop.getProperty("db.server"));
			ret.setPortNumber(Integer.parseInt(prop.getProperty("db.port")));
			ret.setDatabaseName(prop.getProperty("db.name"));
			ret.setUser(prop.getProperty("db.user"));
			ret.setPassword(prop.getProperty("db.pass"));
			ret.setMaxConnections(10);
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
