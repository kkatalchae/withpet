package com.project.withpet.dao;

import com.project.withpet.model.Pet;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PetDAO {

    @Autowired
    private SqlSession sqlSession;

    // 펫 등록
    public void enrollPet(Pet pet) throws Exception {
        sqlSession.insert("enroll_pet", pet);
    }
    // 펫 리스트
    public List<Pet> selectPetList(String pet_parent) throws Exception {
        return sqlSession.selectList("select_pet_list", pet_parent);
    }

    // 펫 검색
    public Pet selectPet(int pet_no) throws Exception {
        return sqlSession.selectOne("select_pet", pet_no);
    }

    // 펫 정보 수정
    public void updatePet(Pet pet) throws Exception {
        sqlSession.update("update_pet", pet);
    }

    // 펫 정보 삭제
    public void deletePet(int pet_no) throws Exception {
        sqlSession.delete("delete_pet", pet_no);
    }
}
