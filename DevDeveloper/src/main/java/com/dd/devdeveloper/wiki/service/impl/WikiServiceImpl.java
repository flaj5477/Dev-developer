package com.dd.devdeveloper.wiki.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.tags.service.TagsService;
import com.dd.devdeveloper.wiki.WikiRecVO;
import com.dd.devdeveloper.wiki.WikiTransVO;
import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.service.WikiService;
import com.dd.devdeveloper.wiki.textFile.textToFile;

//위키 서비스 구현
@Service
public class WikiServiceImpl implements WikiService {

	@Autowired
	WikiDAO wikiDAO;
	@Autowired TagsService tagsService;
	
	private static final Logger logger = LoggerFactory.getLogger(WikiServiceImpl.class);	//로그
	
	// 경로조회
	@Override
	public String getWikiContentsPath(WikiVO vo) {
		String path = null;

		path = wikiDAO.getWikiContentsPath(vo).getManualContentsPath();

		return path;
	}

	// 단건조회 위키 보기
	@Override
	public WikiVO getWiki(WikiVO vo) {
		String contents = null;
		WikiVO wiki = wikiDAO.getWiki(vo);	//위키정보가져옴
		String manualTags = wiki.getManualTags();
		
		contents = readText(wiki.getManualContentsPath());
		
		//텍스트파일 비었는지 확인
		if(contents.isEmpty()) {
			wiki.setManualContentsCheck(0);
		}
		else {
			wiki.setManualContentsCheck(1);
		}
		
		wiki.setManualContents(contents);	//내용
		
		wiki.setDivTagList(tagsService.divTag(manualTags));	//태그리스트
		

		return wiki;
	}

	// 20191021 곽동우 //위키리스트조회
	@Override
	public List<Map<String, Object>> getWikiMap(Paging paging, WikiVO vo) {

		////////////////// 페이징 설정
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(5); // 게시글 몇개뿌릴지?
		paging.setPageSize(5); // 하단 페이지목록 개수

		// 전체 건수
		paging.setTotalRecord(wikiDAO.getCountWiki(vo)); // 전체건수 가져와서 set

		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		//////////////////// 페이징설정 끝

		List<Map<String, Object>> wikiList = wikiDAO.getWikiMap(vo);

		// 제목에 태그제거하기
		for (int i = 0; i < wikiList.size(); i++) {
			String res = (String) wikiList.get(i).get("manualTitle");
			
			
			
			res = removeTag(res);
			wikiList.get(i).put("manualTitle", res);
			
			////////////////////////////////////////////태그나누기태그나누기태그나누기태그나누기태그나누기태그나누기
			String manualTags = (String) wikiList.get(i).get("manualTags");
			if(manualTags != null)
				wikiList.get(i).put("divTagList", tagsService.divTag(manualTags));	//태그리스트 , 기준으로 나눠담는다
			
			//////////////////////태그나누기태그나누기태그나누기태그나누기
			
			////번역률계산
			if(wikiList.get(i).containsKey("manualTotalline")) {
				int totalLine = Integer.parseInt( String.valueOf( wikiList.get(i).get("manualTotalline") ) );
				int manualNo = Integer.parseInt( String.valueOf( wikiList.get(i).get("manualNo") ) ) ;
				
				int transCount = wikiDAO.getTransCount(manualNo);
				
				int transPercent = (int) ((double)transCount/(totalLine)*100);
				wikiList.get(i).put("manualTransPercent", transPercent);
				
				System.out.println(transPercent+"-========================================");
			}
			
		}

		return wikiList;
	}

	// 위키등록
	@Override
	public int insertWiki(WikiVO vo) {
		String path = null;

		textToFile ttf = new textToFile();
		try {
			path = ttf.textSave(vo.getManualContents(), vo.getManualTags(), vo.getManualTitle()); // txt파일로떨군다
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		vo.setManualContentsPath(path);
		
		/////////////////////////////////////////
		//위키 총 라인등록
		String contents = vo.getManualContents();
		
		int start;
		int line = 0;
		
		Map<Integer, Object> lineMap = new HashMap<Integer, Object>();
		
		do {
			start = contents.indexOf("<");
			int end = contents.indexOf(">");
			
			if(start != -1) {
				
				String sTag = contents.substring(start, end+1);
				String eTag =  "</"+contents.substring(start+1, end)+">";
				int eTagLength = eTag.length();
				
				
				int idx = contents.indexOf(eTag);
				
				lineMap.put(line, contents.substring(0, idx+eTagLength));
				//data.add(text.substring(0, idx+4));
				contents = contents.substring(idx+eTagLength);
				line++;
			}
		}while(start != -1);
		/////////////////////////////////////////////////////////
		vo.setManualTotalline(line);	// 총 메뉴얼라인 등록
		
		vo.setManualTags(tagsService.checkTag(vo.getManualTags()));	//태그가 하나면 , 을 끝에 붙여준다
		
		return wikiDAO.insertWiki(vo);
	}

	// 위키수정
	@Override
	public void updateWiki(WikiVO vo) {

		String path = getWikiContentsPath(vo);	//경로
		
		String oriContent = readText(path);
		String updateContent = vo.getManualContents();	//수정내용
		
		List<List<Integer>> updateInfo = getUpdateInfo(oriContent, updateContent);		//수정할 라인정보 가져오기

		//System.out.println(updateInfo.toString());
		
		vo.setUpdateInfo(updateInfo); 		//vo에 담아준다
		
		// 기존파일삭제
		delFile(path);

		// 새로받은 태그폴더에 저장
		textToFile ttf = new textToFile();
		try {
			path = ttf.textSave(updateContent, vo.getManualTags(), vo.getManualTitle()); // txt파일로떨군다
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		vo.setManualContentsPath(path);
//		try {
//			textSave(contents,path);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		vo.setManualTags(tagsService.checkTag(vo.getManualTags()));	//태그가 끝에 , 없으면 ,붙여줌
		
		
		wikiDAO.updateWiki(vo);		//위키원본 수정
		wikiDAO.updateWikiTransInfo(vo);	// 위키 번역 수정라인정보 등록
		wikiDAO.updateWikiTrans(vo);	// 위키 번역라인 수정적용
		wikiDAO.deleteWikiTransInfo(vo);	// 위키 번역 수정라인정보 삭제
		
		
	}

	/*
	 * 곽동우 20191028 위키삭제
	 */
	@Override
	public void deleteWiki(WikiVO vo) {
		String oriPath = getWikiContentsPath(vo);	//경로받아오기
		String copyPath = "C:\\Users\\User\\Desktop\\textTest" + "\\" + "trash"; //휴지통
		fileCopy(oriPath, copyPath);
		delFile(oriPath);
		wikiDAO.deleteWiki(vo);
	}

	/*
	 * 곽동우
	 * 20191029
	 * 위키번역폼
	 */
	@Override
	public Map<Integer, Object> getTransWikiForm(WikiVO vo) {
		//일단 테스트용
		
		String path = vo.getManualContentsPath();
		
		String contents = readText(path);
		
		int start;
		int line = 0;
		
		Map<Integer, Object> lineMap = new HashMap<Integer, Object>();
		
		do {
			start = contents.indexOf("<");
			int end = contents.indexOf(">");
			
			if(start != -1) {
				
				String sTag = contents.substring(start, end+1);
				String eTag =  "</"+contents.substring(start+1, end)+">";
				int eTagLength = eTag.length();
				
				int idx = contents.indexOf(eTag);
				String lineContents = contents.substring(0, idx+eTagLength);
				
				//정규식으로 뺄놈들 설정
				Pattern p = Pattern.compile("(^<figure|figure>$|^<table|<p>&nbsp;</p>)");
				Matcher m = p.matcher(lineContents);
				
				if(m.find()) {
					lineContents = "";
				}
				
//				a뭐지???
//				if(sTag.equals("<")) {					
//				}
				
				lineMap.put(line, lineContents);
				//data.add(text.substring(0, idx+4));
				contents = contents.substring(idx+eTagLength);
				line++;
			}
		}while(start != -1);
							
							//		위에껄로바꿈
							//		
							//		String sTag = "<p>";
							//		String eTag = "</p>";
							//
							//		//contents.indexof()
							//		
							//		/////////////////태그잘라서 map에담기
							//		String date[] = contents.split(sTag);
							//		
							//		Map<Integer, Object> lineMap = new HashMap<Integer, Object>();
							//		int lineNum = 0;	//
							//		
							//		for (int i = 0; i < date.length; i++) {
							//			date[i] = date[i].split(eTag)[0];
							//			if (!date[i].isEmpty()) {
							//				lineMap.put(lineNum++, date[i]);
							//			}
							//		}
							//		
							//		////////////////////////////////

		/*
		 * for(Integer key : lineMap.keySet()){
		 * 
		 * String value = (String) lineMap.get(key);
		 * 
		 * System.out.println(key+" : "+value);
		 * 
		 * }
		 */
		 
		
		return lineMap;
	}
	
	/*
	 * 20191107
	 * 곽동우
	 * 게시글 번역들고옴
	 */
//	@Override
//	public Map<Integer, Object> getTransWiki(WikiVO vo) {
//		
//	}
//	
	
	/*
	 * 20191031
	 * 곽동우
	 * 위키번역등록
	 */
	@Override
	public Map<Integer, Object> insertWikiTrans(WikiTransVO vo){
		wikiDAO.insertWikiTrans(vo);
		return null;
	}
	
	
	
	/*
		곽동우
		20191101
		위키번역 목록(라인) 조회 요청
	*/
	@Override
	public List<Map<String, Object>> getWikiTransLine(WikiTransVO vo) {
		return wikiDAO.getWikiTransLine(vo);
	}

	/*
	 * 곽동우
	 * 20191105
	 * 위키번역된문서 뿌려주기
	 */
	@Override
	public List<Map<Integer, Object>> getWikiTrans(WikiVO vo) {
		
		String path = vo.getManualContentsPath();
		
		String contents = readText(path);	//원본 파일 읽어온다
		
		
		int start;
		int lineNum = 0;
		
		Map<Integer, Object> lineMap = new HashMap<Integer, Object>();			//원본 라인별로 담는다
		Map<Integer, Object> transLineMap = new HashMap<Integer, Object>(); 	//라인별로 번역된거만 담음
		
		do {
			start = contents.indexOf("<");
			int end = contents.indexOf(">");
			
			if(start != -1) {
				
				String sTag = contents.substring(start, end+1);
				String eTag =  "</"+contents.substring(start+1, end)+">";
				int eTagLength = eTag.length();
				
				
				int idx = contents.indexOf(eTag);
				
				lineMap.put(lineNum, contents.substring(0, idx+eTagLength));		//태그잘라서 라인별로 담는다
				transLineMap.put(lineNum, null);	//본문 라인길이만큼 만들어준다
				//data.add(text.substring(0, idx+4));
				contents = contents.substring(idx+eTagLength);		//라인에 담은 태그는 잘라버림
				lineNum++;
			}
		}while(start != -1);
		
		
		
		
		
		/*
//		////////////////////////getTransWikiForm(WikiVO vo) 랑 비슷한 처리 나중에 합쳐?
//		Map<Integer, String> oriLineMap = new HashMap<Integer, String>();		//원본 라인별분리
//		
//		int idx;
//		int line = 0;
//		
//		do {
//			idx = contents.indexOf(eTag);	//p 닫는태그 위치
//			
//			if(idx != -1) {	//</p>가 있으면
//				oriLineMap.put(line, contents.substring(0, idx+4));	// 0 ~ </P> 까지 맵에담는다
//				contents = contents.substring(idx+4);				// 담은거 잘라낸다
//				line++;												//라인수 +1
//			}
//		}while(idx != -1);	// </p>가 있으면 반복
//		//////////////////////////////
		*/
		
		/////////////////태그잘라서 map에담기
		
//		String date[] = contents.split(sTag);
//		
//		Map<Integer, Object> lineMap = new HashMap<Integer, Object>();
//		Map<Integer, Object> transLineMap = new HashMap<Integer, Object>();	//라인별로 번역된거만 담음
//		int lineNum = 0;	//
//		
//		for (int i = 0; i < date.length; i++) {
//			date[i] = date[i].split(eTag)[0];
//			if (!date[i].isEmpty()) {
//				lineMap.put(lineNum++, date[i]);
//				transLineMap.put(lineNum, null);	//본문 라인길이만큼 만들어준다
//			}
//		}
		
		////////////////////////////////
		if(vo.getOrderby() == null) {	//따로 정렬안하면 추천순으로 정렬
			vo.setOrderby("rec");
		}
		List<Map<String, Object>> transList = wikiDAO.getWikiTrans(vo);
		
		for(int i = 0; i < transList.size(); i++) {
			int transline = Integer.parseInt( String.valueOf( transList.get(i).get("manualLine") ) );	// java.math.BigDecimal cannot be cast to java.lang.Integer 에러 자바 //		오라클 NUMBER 형 컬럼의 데이터를 HashMap 타입으로 받아 java에서 사용하려고 하니 발생
			String transContents = (String) transList.get(i).get("manualAfter");						
			
			lineMap.put(transline, transContents);
			transLineMap.put(transline, transContents);	// 번역된거 해당라인에 넣음
		}
		
		List<Map<Integer, Object>> transInfoList = new ArrayList<Map<Integer,Object>>(); 
		transInfoList.add(lineMap);
		transInfoList.add(transLineMap);
		
		return transInfoList;
	}//getWikiTrans - end
	

	/*
	 * 곽동우
	 * 20191105
	 * 위키원문 등록된 태그 리스트 뿌려주기
	 */
	@Override
	public List<LinkedHashMap<String,Object>> getWikiTagList() {
		List<LinkedHashMap<String,Object>> tagList = wikiDAO.getWikiTagList();
		
		return tagList;
	}

	/*
	 * 곽동우
	 * 20191108
	 * 위키 번역 삭제하기
	 */
	@Override
	public int delWikiTrans(WikiTransVO tVo) {
		return wikiDAO.delWikiTrans(tVo);
	}
	
	
	/* ==============
	 곽동우
	 20191112
	 위키번역추천
	 ================*/
	public int wikiTransRec(WikiRecVO rvo) {
		return wikiDAO.wikiTransRec(rvo);
	}
	
	/* ==============
	 곽동우
	 20191113
	 위키번역추천취소
	 ================*/
	public int wikiTransRecDel(WikiRecVO rvo) {
		return wikiDAO.wikiTransRecDel(rvo);
	}
	
	
	/* ==============
	 곽동우
	 20191113
	 위키번역추천취소
	 ================*/
	public List<WikiTransVO> getMyWikiTransList() {
		return wikiDAO.getMyWikiTransList();
	}	
	
	
	////////// 파일

	// 파일수정
	public void textSave(String contents, String path) throws IOException {
		BufferedOutputStream bs = null;
		// String fixTitle = today+StringReplace(title); //제목에서 특수문자 제거
		// String path = checkFolder(tag) +"\\"+fixTitle+".txt"; // 태그폴더 안에 제목.txt 로
		// 파일경로지정

		File file = new File(path);

		try {
			bs = new BufferedOutputStream(new FileOutputStream(file));

			String str = contents;
			bs.write(str.getBytes()); // Byte형으로만 넣을 수 있음

		} catch (Exception e) {
			e.getStackTrace();
			// TODO: handle exception
		} finally {
			bs.close(); // 반드시 닫는다.
		}
	}

	// 태그제거
	public String removeTag(String html) {
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}

	// 저장된 txt파일읽기
	public String readText(String path) {
		String manualContents = null;
		// 바이트 단위로 파일읽기
		String filePath = path; // 대상 파일
		FileInputStream fileStream = null; // 파일 스트림

		try {
			fileStream = new FileInputStream(filePath);// 파일 스트림 생성
			
			
			
			int byteCount = fileStream.read();
			
			fileStream.mark(0);
			
			if (byteCount == -1)  {
			    System.out.println("SOME ERRORS!");
			    fileStream.close();
			    return manualContents = "";
			} else {
				System.out.println("NO ERRORS!");
				
			}
			fileStream.close();
			
			fileStream = new FileInputStream(filePath);
			
			int noCount = 0;	//파일내용 카운터
			
			// 버퍼 선언
			byte[] readBuffer = new byte[fileStream.available()];
			while (fileStream.read(readBuffer) != -1) {
				noCount++;
				System.out.println(noCount+"==============================================");
			}
			
//			if (noCount == 0)  {	// 파일내용이없으면 바로 리턴
//			    System.out.println("SOME ERRORS!");
//			    fileStream.close();
//			    return manualContents = "";
//			} else {
//				System.out.println("NO ERRORS!");
//			}

			manualContents = new String(readBuffer); // 내용담기

			fileStream.close();// 스트림 닫기
			// }
		} catch (Exception e) {
			e.getStackTrace();
			//System.out.println("파일읽기오류!!!!!!!!!!!!!");
			return manualContents = "";
		} finally {
			
		}
		return manualContents;
	} // end - readText()

	/*
	 * 곽동우 20191025 해당경로 파일삭제
	 */
	public void delFile(String path) {
		boolean delYn = true;
		File file = new File(path);
		if (file.exists()) {

			delYn = file.delete();
			if (delYn) {
				System.out.println("File Delete Success"); // 성공
			} else {
				System.out.println("File Delete Fail"); // 실패
			}

		} else {
			System.out.println("File Not Found"); // 미존재
		}
	}// delFile()- end

	/*
	 * 곽동우 20191028 파일 이동(삭제하면 휴지통으로이동)
	 */
	public static void fileCopy(String oriFilePath, String copyFilePath) {
		// 원본 파일경로
		// oriFilePath = "D:\\newFolder\\sql.jpg";
		// 복사될 파일경로
		// copyFilePath = "D:\\newFolder\\sql2.jpg";

		// 파일객체생성
		File oriFile = new File(oriFilePath);
		String fileName = oriFile.getName();
		
		copyFilePath += File.separator + fileName;
		
		// 복사파일객체생성
		File copyFile = new File(copyFilePath);

		try {

			FileInputStream fis = new FileInputStream(oriFile); // 읽을파일
			FileOutputStream fos = new FileOutputStream(copyFile); // 복사할파일

			int fileByte = 0;
			// fis.read()가 -1 이면 파일을 다 읽은것
			while ((fileByte = fis.read()) != -1) {
				fos.write(fileByte);
			}
			// 자원사용종료
			fis.close();
			fos.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // end - fileCopy
	}

	
	
	/*
	 * 20191117
	 * 곽동우
	 * 
	 * 원본과 수정본 비교후 번역라인 업데이트 정보 가져온다
	 * 
	 */
	public List<List<Integer>> getUpdateInfo(String oriContent, String updateContent) {
		
		Map<Integer, Object> oriLineMap = divLine(oriContent);			//원본 라인별로 담는다
		Map<Integer, Object> transLineMap = divLine(updateContent); 	//수정본 라인별로 담는다
		List<List<Integer>> updateInfo = new ArrayList<List<Integer>>(); 	//업데이트정보
		
		/*
		 * 원본 라인을 수정본과 비교해서
		 * 원본 라인번호를 담고 수정본에 같은 내용 이있으면 그 수정본 라인번호를 맵에 담는다
		 *  ex) [(원본)1,(수정본)2] [2,3]
		 */
		for(int i = 0; i < oriLineMap.size(); i++) {
			String searchContent = (String) oriLineMap.get(i);	// 수정본과 비교할 원본내용
			
			ArrayList<Integer> eqLine = new ArrayList<Integer>();	//같은라인번호 담는배열
			
			for(int j = 0; j < transLineMap.size(); j++) {	
				
				if(transLineMap.get(j).equals(searchContent)) {	// 수정본 중에 원본과 같은 라인 이면
					System.out.println(i+","+j + "  "  + searchContent + "  " + transLineMap.get(j));
					
					//ArrayList<Integer> infoList = new ArrayList<Integer>();
					//infoList.add(j);	//같은내용담는다
					
					eqLine.add(j);	// 배열에 담는다
				}
			} // end - for문
			
			updateInfo.add(eqLine);	// 같은라인 정보 들어있는 배열을 update정보에 저장
			
		}
		
		System.out.println(updateInfo.toString());
		
		
		return updateInfo;
	}
	
	/*
	 * 20191117
	 * 곽동우
	 * 라인 나눠서 
	 * ex)[1 ,	내용] [2, 내용]
	 * 리턴해준다
	 */
	public Map<Integer, Object> divLine(String contents) {	
		
		int start;		//시작태그위치 <
		int lineNum = 0;	//시작태그 >
		
		Map<Integer, Object> lineMap = new HashMap<Integer, Object>();	//리턴할 맵
		
		do {
			start = contents.indexOf("<");
			int end = contents.indexOf(">");
			
			if(start != -1) {
				
				String sTag = contents.substring(start, end+1);
				String eTag =  "</"+contents.substring(start+1, end)+">";
				int eTagLength = eTag.length();
				
				
				int idx = contents.indexOf(eTag);
				
				lineMap.put(lineNum, contents.substring(0, idx+eTagLength));		//태그잘라서 라인별로 담는다
				//data.add(text.substring(0, idx+4));
				contents = contents.substring(idx+eTagLength);		//라인에 담은 태그는 잘라버림
				lineNum++;
			}
		}while(start != -1);
		
		return lineMap;

	}
	
}
