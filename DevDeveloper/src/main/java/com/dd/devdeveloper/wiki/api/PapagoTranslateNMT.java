package com.dd.devdeveloper.wiki.api;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class PapagoTranslateNMT {
	
	public static String papago(String oriContents){
		String clientId = "oJq6FT1wVv_7Zrsi3wZw";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "XtVDgKI4pZ";//애플리케이션 클라이언트 시크릿값";
        String transText = null;	//번역한 text
        String entransText = null;
        try {
            String text = URLEncoder.encode(oriContents, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source=en&target=ko&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));	//인코딩 안한상태로 학원 서버로 올리니 한글깨짐
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"utf-8"));
            }
            String inputLine;
            
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            transText = response.toString();
            
        } catch (Exception e) {
            System.out.println(e);
        }
		return transText;
	}
}
