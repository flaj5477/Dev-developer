package com.dd.devdeveloper.wiki.textFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class textToFile {
	SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");
	Date time = new Date();		
	String today = format1.format(time);
	
	/*
	 * 20191022
	 * 곽동우
	 * 메뉴얼 등록시 contents와 tag받아서 text파일로 저장
	 */
	public String textSave(String contents, String tag, String title) throws IOException {
		BufferedOutputStream bs = null;
		String fixTitle = today+StringReplace(title);	//제목에서 특수문자 제거
		String path = checkFolder(tag) +"\\"+fixTitle+".txt";	//	태그폴더 안에 제목.txt 로 파일경로지정
		
		File file = new File(path);	
		
		//파일이름 중복체크
//		int i=1;
//		while(file.exists()) {	//해당경로 같은파일명 있으면 뒤에 숫자달아준다
//			if(i==1) path = path.substring(0, path.length()-4);
//			else path = path.substring(0, path.length()-5);
//			path = path+i+".txt";
//			file = new File(path);
//			i++;
//		}
				
		file = rename(file);	//파일이름 중복체크
		path = file.getPath();
		
		try {
			bs = new BufferedOutputStream(new FileOutputStream(file));
			
			String str = contents;
			bs.write(str.getBytes()); //Byte형으로만 넣을 수 있음
	
		} catch (Exception e) {
	                e.getStackTrace();
	                System.out.println("파일등록아뇜");
			// TODO: handle exception
		}finally {
			bs.close(); //반드시 닫는다.
		} 
		
		return path;
	}
	
	
	/*
	 * 20191022
	 * 곽동우
	 * 폴더있는지 확인?
	 */
	public String checkFolder(String tag) {
		String sliceTag = null;
		if(tag == "" ) tag = "기타";
		
		//tag 잘라서 하나만 sliceTag에넣는다
		/*
			자르는코드추가
		*/
		sliceTag = tag;
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy");
		Date time = new Date();		
		String year = format2.format(time);
		
		String path = "C:\\Users\\User\\Desktop\\textTest"+"\\"+year+"\\"+sliceTag; //폴더 경로
		
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdirs(); //폴더 생성합니다.	mkdir경로없으면 안만듬  mkdirs경로끝까지생성
			    System.out.println(sliceTag+" 폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println(sliceTag+" 이미 폴더가 생성되어 있습니다.");
		}
		return path;
	}
	
	
	
	/*
	 * 20191022
	 * 곽동우
	 * 문자열 특수문자제거
	 */
	public String StringReplace(String str){
	        String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
	        str =str.replaceAll(match, "");
	        return str;
	}
	
	
	/*
	 * 20191024
	 * 곽동우
	 * 파일이름 중복확인
	 */
	public File rename(File f) { // File f는 원본 파일
		if (createNewFile(f))
			return f; // 생성된 f가

		// 확장자가 없는 파일 일때 처리
		String name = f.getName();
		String body = null;
		String ext = null;

		int dot = name.lastIndexOf(".");
		if (dot != -1) { // 확장자가 있을때
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else { // 확장자가 없을때
			body = name;
			ext = "";
		}

		int count = 0;
		// 중복된 파일이 있을때
		while (!createNewFile(f) && count < 9999) {
			count++;
			String newName = body + count + ext;
			f = new File(f.getParent(), newName);
		}
		return f;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile(); // 존재하는 파일이 아니면
		} catch (IOException ignored) {
			return false;
		}
	}
	
}
