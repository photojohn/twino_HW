package tools.IPGeolocation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class GeoData {
	private static final Logger log = LoggerFactory.getLogger(GeoData.class);
	private String status;
	private String country;
	private String countryCode;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public static String getCountryCodeByIP(String ip, String defaultCode) {
		try {
			RestTemplate restTemplate = new RestTemplate();
			GeoData resp = restTemplate.getForObject("http://ip-api.com/json/" + ip, GeoData.class);
			if (!resp.getStatus().equals("success")) {
				log.warn("IP-API returned status=[" + resp.getStatus() + "] for [" + ip
						+ "]. Returning default country code");
				return defaultCode;
			}
			return resp.getCountryCode();
		} catch (Exception e) {
			log.warn("Could not get country code for IP [" + ip + "]. Returning default country code", e);
			return defaultCode;
		}
	}

}
