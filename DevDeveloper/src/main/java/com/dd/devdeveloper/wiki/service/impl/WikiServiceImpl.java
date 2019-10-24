package com.dd.devdeveloper.wiki.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.service.WikiService;
import com.dd.devdeveloper.wiki.textFile.textToFile;

@Service
public class WikiServiceImpl implements WikiService{

	@Autowired WikiDAO wikiDAO;
	
	//단건조회
	@Override
	public String getWikiContentsPath(WikiVO vo) {
		String path = null;
		
		path = wikiDAO.getWikiContentsPath(vo);
		
		return path;
	}
		
		
	//단건조회
	@Override
	public WikiVO getWiki(WikiVO vo) {
		String contents = null;
		WikiVO wiki = wikiDAO.getWiki(vo);
		
		contents = readText(wiki.getManualContentsPath());
		
		wiki.setManualContents(contents);
		
		return wiki;
	}

	//20191021 곽동우	//위키리스트조회
	@Override
	public List<Map<String, Object>> getWikiMap() {
		List<Map<String, Object>> wikiList= wikiDAO.getWikiMap();
		
		
		for(int i=0; i<wikiList.size(); i++) {
			String res = (String)wikiList.get(i).get("manualTitle");
			
			res = removeTag(res);
			wikiList.get(i).put("manualTitle",res);
		}
		
		return wikiList;
	}

	//위키등록
	@Override
	public int insertWiki(WikiVO vo) {
		String path = null;
		
		textToFile ttf = new textToFile();
		try {
			path = ttf.textSave(vo.getManualContents(), vo.getManualTags(), vo.getManualTitle());	//txt파일로떨군다
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setManualContentsPath(path);
		
		return wikiDAO.insertWiki(vo);
	}
	
	//위키수정
	@Override
	public void updateWiki(WikiVO vo) {
		
		String path = getWikiContentsPath(vo);

		String contents = vo.getManualContents();
	
		try {
			textSave(contents,path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		wikiDAO.updateWiki(vo);
	}

	
	
	
	//파일수정
	public void textSave(String contents, String path) throws IOException {
		BufferedOutputStream bs = null;
		//String fixTitle = today+StringReplace(title);	//제목에서 특수문자 제거
		//String path = checkFolder(tag) +"\\"+fixTitle+".txt";	//	태그폴더 안에 제목.txt 로 파일경로지정
		
		File file = new File(path);
		
		try {
			bs = new BufferedOutputStream(new FileOutputStream(file));
			
			String str = contents;
			bs.write(str.getBytes()); //Byte형으로만 넣을 수 있음
	
		} catch (Exception e) {
	                e.getStackTrace();
			// TODO: handle exception
		}finally {
			bs.close(); //반드시 닫는다.
		} 
	}
	
	
	
	
	//태그제거
	public String removeTag(String html){
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
	//저장된 txt파일읽기
	public String readText(String path) {
		String manualContents = null;
		try {
		   // 바이트 단위로 파일읽기
	        String filePath = path; // 대상 파일
	        FileInputStream fileStream = null; // 파일 스트림
	        
	        fileStream = new FileInputStream( filePath );// 파일 스트림 생성
	        //버퍼 선언
	        byte[ ] readBuffer = new byte[fileStream.available()];
	        while (fileStream.read( readBuffer ) != -1){}
	        
	        manualContents = new String(readBuffer); //출력
	
	        fileStream.close(); //스트림 닫기
	    } catch (Exception e) {
		e.getStackTrace();
		System.out.println("파일읽기오류!!!!!!!!!!!!!");
	    }
		return manualContents;
	}

	

}
