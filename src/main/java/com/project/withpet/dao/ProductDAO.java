package com.project.withpet.dao;

import com.project.withpet.model.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDAO {

   @Autowired
    private SqlSession sqlSession;

   // 01. 상품목록
    public List<Product> list(Product product) {
        return sqlSession.selectList("product.productList", product);
    }

    // 01 -1. 리스트 데이터 카운트
    public int getCount(Product product) {
        return sqlSession.selectOne("product.getCount", product);
    }

    // 02 -1 상세페이지 조회수 증가
    public void updatepro_readcnt(int pro_no) {
        sqlSession.update("hit", pro_no);
    }

    // 02  상세페이지 정보
    public Product getProductDetail(int pro_no) {
        return sqlSession.selectOne("pro_content", pro_no);
    }

    // 03. 글쓰기
    public int productInsert(Product product) {
        return sqlSession.insert("product.productWrite", product);
    }

    // 04. 글수정
    public int productUpdate(Product product) {
        return sqlSession.update("product.productUpdate", product);
    }

    // 05. 글 삭제
    public int productDelete(int pro_no) {
       return sqlSession.update("product.productDelete", pro_no);
    }

    // 06. 좋아요
    public void updateLike(int pro_no) {
        sqlSession.update("product.updateLike", pro_no);
    }

}
