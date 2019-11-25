package com.dd.devdeveloper.files.service.impl;


import java.util.LinkedHashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.files.FilesVO;

@Repository
public class FilesDAO {

	//여기서 매퍼 호출하거든요 ~
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 파일 전체
	public List<FilesVO> getFilesList(FilesVO vo) {
		return mybatis.selectList("FilesDAO.getFilesList", vo);
	}
	
	// 파일 임포트
	public List<FilesVO> getImportList(FilesVO vo) {
		return mybatis.selectList("FilesDAO.getImportList", vo);
	}
	
	//검색하면 검색한거 개수 가져오는
	public int getConuntFiles(FilesVO vo) {
		return mybatis.selectOne("FilesDAO.getCountFiles", vo); //얘로 매퍼실행해라 
	}
		
	// 파일 업로드
	public void filesUpload(FilesVO vo) { 
		mybatis.insert("FilesDAO.filesInsertProc", vo); // 매퍼에서 파일 DAO라는 네임스페이스와 파일 인설트Proc라는 iD를 가진 insert문을 실행한다 파라미터로 vo를 넘겨준다
						
	}
	
	// 휴지통 리스트
	public List<FilesVO> getTrashList(FilesVO vo) {
		return mybatis.selectList("FilesDAO.getTrashList", vo);
		
	}
	
	// 임포트
	public void filesImport(FilesVO vo) {
		System.out.println("sss"+ vo);
		  mybatis.update("FilesDAO.filesImport", vo);
	}
	
	//경로 조회
	public FilesVO getFiles(FilesVO vo) {
		return mybatis.selectOne("FilesDAO.getFiles", vo);
	}
	
	// 휴지통
	public void filesTrash(FilesVO vo) {
		   mybatis.update("FilesDAO.filesTrash", vo);
	}
	// 검색
	public List<LinkedHashMap<String, Object>> filesSearch(FilesVO vo) {
		return mybatis.selectList("FilesDAO.filesSearch", vo);
		
	}
	// 검색
	public List<FilesVO> getfilesSearch(FilesVO vo) {
		return mybatis.selectList("FilesDAO.getFilesSearch", vo);
		 
	}

	// 파일 삭제
	public int deleteFiles(FilesVO vo) {
		return mybatis.delete("FilesDAO.deleteFiles", vo);
	}
	
	// 파일 루트
	public List<FilesVO> getFilesRoute(FilesVO vo) {
		return mybatis.selectList("FilesDAO.getFilesRoute", vo);
		
	}

}
