package com.project.withpet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.withpet.dao.HospitalDAO;
import com.project.withpet.model.Hospital;

@Service
public class HospitalService {
	@Autowired
	private HospitalDAO hospitalDAO;

	// 글 작성(insert)
	public int insert(Hospital hospital) {
		return hospitalDAO.insert(hospital); 
	}
	
	// 총 데이터 개수 구하기
	public int getTotal(Hospital hospital) {
		return hospitalDAO.getTotal(hospital);
	}

	// 데이터(게시글) 10개 구하기
	public List<Hospital> list(Hospital hospital) {
		return hospitalDAO.list(hospital);
	}

	// 상세 페이지 : 조회수 증가
	public void updateReadcnt(int hos_no) {
		hospitalDAO.updateReadcnt(hos_no);
	}

	// 상세 페이지 : 데이터 1개 구하기
	public Hospital select(int hos_no) {
		return hospitalDAO.select(hos_no);
	}

	// 글 수정(update)
	public int update(Hospital hospital) {
		return hospitalDAO.update(hospital);
	}

	// 글 삭제(delete)
	public int delete(int hos_no) {
		return hospitalDAO.delete(hos_no);
	}

	// 병원 게시판 게시글 추천수 업데이트
	public void updateLike(int hos_no) {
		hospitalDAO.updateLike(hos_no);
	}

}
