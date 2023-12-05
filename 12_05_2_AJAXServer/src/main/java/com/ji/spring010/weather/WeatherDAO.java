package com.ji.spring010.weather;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

@Service
public class WeatherDAO {

	// https://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1150064000
	public String getWeather(HttpServletRequest req) {
		
		try {
			String url = "https://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1150064000";
			URL u = new URL(url);
			
			HttpsURLConnection huc = (HttpsURLConnection) u.openConnection();
			InputStream is = huc.getInputStream();		
			BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			
			// 나오는 것들을 한 덩어리로 만들기
			StringBuffer sb = new StringBuffer();
			
			String line = null;
			while((line = br.readLine()) != null) {
				// 받아온 데이터들의 엔터를 없애고 한 덩어리로 뭉치기.
				sb.append(line.replace("\r\n", ""));
			}
			return sb.toString();
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
}
