function comm_check() {
	if ($("#com_title").val() == "") {
		alert("제목를 입력하세요!");
		$("#com_title").val("").focus();
		return false;
	}
	if(CKEDITOR.instances.com_content.getData() =='' 
        || CKEDITOR.instances.com_content.getData().length ==0){
    alert("질문을 입력하세요!");
    $("#com_content").focus();
    return false;
	}
}
