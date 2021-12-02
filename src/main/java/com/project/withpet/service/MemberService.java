package com.project.withpet.service;

import com.project.withpet.dao.MemberDAO;
import com.project.withpet.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    // 아이디 중복 체크
    public int checkMemberId(String id) throws Exception {
        return memberDAO.checkMemberId(id);
    }

    // 회원 가입
    public void insertMember(Member member) throws Exception {
        memberDAO.insertMember(member);
    }

    // 로그인
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }

    // 비밀번호 검색
    public Member findPwd(Member member) throws Exception {
        return memberDAO.findPwd(member);
    }

    // 아이디 검색
    public List<String> findId(Member member) {
        return memberDAO.findId(member);
    }

    // 내 정보, 내 정보 수정폼
    public Member selectMember(String id) throws Exception {
        return memberDAO.selectMember(id);
    }

    // 내 정보 수정
    public void updateMember(Member member) throws Exception {
        memberDAO.updateMember(member);
    }

    // 회원 탈퇴
    public void deleteMember(String id) throws Exception {
        memberDAO.deleteMember(id);
    }





}
