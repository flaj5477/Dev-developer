package com.dd.devdeveloper.wiki.service.impl;

import java.io.FileInputStream;
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
	
	@Override
	public WikiVO getWiki(WikiVO vo) {
		String contents;
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
		System.out.println(manualContents + "=============");
		return manualContents;
	}

}
