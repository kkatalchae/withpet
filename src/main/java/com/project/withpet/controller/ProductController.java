package com.project.withpet.controller;


import com.project.withpet.model.Product;
import com.project.withpet.model.Qna;
import com.project.withpet.service.PagingPgm;
import com.project.withpet.service.ProductService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 01. 01-1 상품 전체 목록
    @RequestMapping(value = "productList", method = RequestMethod.GET)
    public String productList(HttpServletRequest request, String pageNum, Product product, Model model){

        // 정렬 값(sortValue)이 없는 경우(초기 실행)
        if(product.getSortValue() == null) {
            product.setSortValue("recent");
        }

        String sortValue = product.getSortValue();

        final int rowPerPage = 10;

        if (pageNum == null || pageNum.equals("")) {
            pageNum = "1";
        }

        // 현제 페이지 (pageNum 변환)
        int currentPage = Integer.parseInt(pageNum);

        // 총 데이터 구해오기
        int total = productService.getCount(product);
        System.out.println("totalData:"+total);

        // 한페이지에 데이터 시작 값, 끝값
        int startRow = (currentPage - 1) * rowPerPage + 1; // 1, 11, 21, 31 , DTO에 저장
        int endRow = startRow + rowPerPage - 1; // 10, 20, 30, 40 , DTO에 저장

        PagingPgm paging = new PagingPgm(total, rowPerPage, currentPage);

        product.setStartRow(startRow);
        product.setEndRow(endRow);

        int no = total - startRow + 1; // 화면 출력 번호

        List<Product> list = productService.list(product);
        System.out.println("list : " + list);

        // 정렬
        model.addAttribute("sortValue", sortValue);

        model.addAttribute("list", list);
        model.addAttribute("no", no);
        model.addAttribute("paging", paging);

        // 검색
        model.addAttribute("search", product.getSearch());
        model.addAttribute("keyword", product.getKeyword());

        return "product/productList";
    }


    // 02. 02-1 상세 페이지 : 조회수 1증가 + 상세정보 구하기
    @RequestMapping("/productDetail")
    public String productDetail(@RequestParam("no") int pro_no, String page, Model model) {



        productService.updatepro_readcnt(pro_no);				// 조회수 1증가
        Product product = productService.getProductDetail(pro_no);	    // 상세 정보 구하기
        String pro_content = product.getPro_content().replace("\n", "<br>");

        model.addAttribute("product", product);
        model.addAttribute("pro_content", pro_content);
        model.addAttribute("page", page);

        return "product/productDetail";
    }
    // 03. 글작성 폼 04.수정페이지 폼
    @RequestMapping("productWrite")
    public String productForm(@RequestParam(value = "no", required = false, defaultValue = "0") String pro_no_str, Model model, HttpSession session){

        String id = (String) session.getAttribute("id");
        Product product = new Product();

        product.setBus_id(id);

        int pro_no = Integer.parseInt(pro_no_str);
        if(pro_no > 0){
            product = productService.getProductDetail(pro_no);	    // 상세 정보 구하기
            String pro_content = product.getPro_content().replace("\n", "<br>");

            model.addAttribute("product", product);
            model.addAttribute("pro_content", pro_content);
        }
        return "product/productWrite";
    }

    // 03-1 글작성 결과
    // 04-1 수정시 이미지 변경사항 확인
    @RequestMapping("productResult")
    public String producteWrite(HttpServletRequest req, Product product, Model model) throws Exception {
        System.out.println("bus_id:"+ product.getBus_id());
        int result = 0;
        PrintWriter printWriter = null;
        OutputStream out = null;
        BufferedOutputStream bos = null;

        int pro_no = product.getPro_no();

        MultipartFile pro_photo = product.getPro_photo();
        if(pro_photo != null){
            if(pro_photo.getSize() > 0 && StringUtils.isNotBlank(pro_photo.getName())){
                if(pro_photo.getContentType().toLowerCase().startsWith("image/")){
                    try{
                        String fileName = pro_photo.getOriginalFilename();
                        String ext = FilenameUtils.getExtension(fileName);

                        byte[] bytes = pro_photo.getBytes();
                        String uploadPath = req.getSession().getServletContext().getRealPath("/upload");
                        File uploadFile = new File(uploadPath);
                        if(!uploadFile.exists()){
                            uploadFile.mkdirs();
                        }
                        fileName = UUID.randomUUID() + "." + ext;
                        uploadPath = uploadPath + "/" + fileName;
                        out = new FileOutputStream(new File(uploadPath));
//						out.write(bytes);
                        bos = new BufferedOutputStream(out); // Buffer 에 넣기 때문에 남아있는 메모리 사이즈는 신경써야 하죠.
                        bos.write(bytes, 0, bytes.length); // Buffer 에 담은 것을 파일에 I/O 합니다.
                        bos.flush(); // FileOutputStream 에는 flush 가 없지요. flush 를 해야지 메모리에 남기지 않고 몽땅 파일에 저장해요.

                        product.setPro_img(fileName);

                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(bos != null){
                            bos.close();
                        }
                        if(out != null){
                            out.close();
                        }
                    }
                }
            }
        }

        if(pro_no > 0) {
            result = productService.productUpdate(product);
        }else {
            result = productService.productInsert(product);
        }
        System.out.println("result:"+result);

        model.addAttribute("result", result);

        return "product/productResult";
    }

    //05. 게시글 삭제
    @RequestMapping("productDelete")
    public String productDelete(@RequestParam("no") int pro_no) throws Exception {
        productService.productDelete(pro_no);
        return "product/productDelete";
    }

}
