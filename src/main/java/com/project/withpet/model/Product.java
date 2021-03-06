package com.project.withpet.model;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class Product {

//	pro_no NUMBER NOT NULL, /* 상품 번호 */
//	bus_id VARCHAR2(20) NOT NULL, /* 판매자 id */
//	pro_name VARCHAR2(50) NOT NULL, /* 상품 이름 */
//	stock NUMBER NOT NULL, /* 재고 */
//	pro_content VARCHAR2(2000) NOT NULL, /* 설명 */
//	pro_img VARCHAR2(100) NOT NULL, /* 상품 이미지 */
//	pro_price VARCHAR2(50) NOT NULL, /* 가격 */
//	pro_readcnt NUMBER NOT NULL, /* 조회수 */
//	pro_likecnt NUMBER /* 추천수 */

    private int pro_no;
    private String bus_id;
    private String pro_name;
    private int stock;
    private String pro_content;
    private String pro_img;
    private int pro_readcnt;
    private int pro_likecnt;
    private int price;
    private String pro_del; // 삭제 쿼리 Y or N
    private MultipartFile pro_photo; // 상품이미지파일

    // page
    private int startRow;
    private int endRow;

    // 검색
    private String search;
    private String keyword;

    // 정렬
    private String sortValue;


    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    public String getBus_id() {
        return bus_id;
    }

    public void setBus_id(String bus_id) {
        this.bus_id = bus_id;
    }

    public String getPro_name() {return pro_name;}

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public int getStock() {return stock;}

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getPro_content() {
        return pro_content;
    }

    public void setPro_content(String pro_content) {
        this.pro_content = pro_content;
    }

    public String getPro_img() {
        return pro_img;
    }

    public void setPro_img(String pro_img) {
        this.pro_img = pro_img;
    }

    public int getPrice() {return price;}

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPro_readcnt() {
        return pro_readcnt;
    }

    public void setPro_readcnt(int pro_readcnt) {
        this.pro_readcnt = pro_readcnt;
    }

    public int getPro_likecnt() {
        return pro_likecnt;
    }

    public void setPro_likecnt(int pro_likecnt) {
        this.pro_likecnt = pro_likecnt;
    }

    public String getPro_del() {return pro_del;}

    public void setPro_del(String pro_del) {this.pro_del = pro_del;}

    private List<Product> productList;

    public List<Product> getProductVOList() {
        return productList;
    }

    public MultipartFile getPro_photo() {
        return pro_photo;
    }
    public void setPro_photo(MultipartFile productPhoto) {
        this.pro_photo = productPhoto;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getEndRow() {
        return endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public String getSortValue() {
        return sortValue;
    }

    public void setSortValue(String sortValue) {
        this.sortValue = sortValue;
    }

    @Override
    public String toString() {
        return "Product[pro_no="+pro_no+",bus_id=" +bus_id+",pro_name"+pro_name+",stock="+stock+",pro_content="+pro_content+",pro_img="+pro_img+",pro_readcnt="+pro_readcnt+",pro_likecnt="+pro_likecnt+",price="+price+",pro_photo="+pro_photo+"]";
    }
}
