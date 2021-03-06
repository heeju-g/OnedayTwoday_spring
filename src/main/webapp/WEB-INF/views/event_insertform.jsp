<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Event</title>
<style type="text/css">
.lab{
	font-size: 10pt;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name="event"]').change(function() {
			var id = $('input[name="event"]:checked').attr('id');
			if(id == 'sale') {
				$("#sale_rate").next().removeClass("disabled");
			} else {
				$("#sale_rate").next().addClass("disabled");
			}
		});
		
		$('input[name="category"]').change(function() {
			var id = $('input[name="category"]:checked').attr('id');
			if(id == 'class') {
				$("#class_no").next().removeClass("disabled");
				$("#product_no").next().addClass("disabled");
			} else {
				$("#product_no").next().removeClass("disabled");
				$("#class_no").next().addClass("disabled");
			}
		});
	})
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="comment-form" style="padding-left: 60px; padding-right: 60px">
		<div class="slider-area" style="margin-bottom: 150px;">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Event Insert</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form class="form-contact comment_form">
		<input type="hidden" name="member_id" value="${mDto.member_id }" />
			<div class="row">
				<div class="col-2" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="primary-radio mr-1">
							<input type="radio" id="new" name="event" value="NEW">
							<label for="new"></label>
						</div>
						<span class="lab">New</span>
					</div>
					
				</div>
				<div class="col-1" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="primary-radio mr-1">
							<input type="radio" id="sale" name="event" value="??????" checked>
							<label for="sale"></label>
						</div>
						<span class="lab">Sale</span>
					</div>				
				</div>	
				<div class="col-2" style="margin-bottom: 30px;">
					<select name="sale_rate" id="sale_rate">
						<option value="0">0%</option>
		                <option value="10">10%</option>
		                <option value="20">20%</option>
		                <option value="30">30%</option>
		                <option value="40">40%</option>
		                <option value="50">50%</option>
		                <option value="60">60%</option>
		                <option value="70">70%</option>
		                <option value="80">80%</option>
		                <option value="90">90%</option>
					</select>
				</div>
				<div class="col-1" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="confirm-radio mr-1">
							<input type="radio" id="class" name="category" value="class" checked>
							<label for="class"></label>
						</div>
						<span class="lab">Class</span>
					</div>
				</div>
				<div class="col-2" style="margin-bottom: 30px;">
					<div id="class_sel" >
						<select name="class_no" id="class_no">
		                  <c:forEach items="${cList }" var="cDto">
		                    <option value="${cDto.class_no }">
		                      ${cDto.class_title }
		                    </option>
		                  </c:forEach>
		                </select>
					</div>
				</div>
				<div class="col-1" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="confirm-radio mr-1">
							<input type="radio" id="product" name="category" value="product" >
							<label for="product"></label>
						</div>
						<span class="lab">product</span>
					</div>
				</div>
				<div class="col-2" style="margin-bottom: 30px;">
					<div id="product_sel" >
						<select name="product_no" id="product_no" disabled="disabled">
		                  <c:forEach items="${pList }" var="pDto">
		                    <option value="${pDto.product_no }">
		                      ${pDto.product_name }
		                    </option>
		                  </c:forEach>
		                </select>
		            </div>
				</div>
				<div class="col-12">
					<div class="form-group">
					<input class="form-control" type="text" name="event_title" placeholder="Event Title" required="required">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" rows="10" cols="60"
							name="event_desc"></textarea>
					</div>
				</div>
				<div class="col-4">
					<div class="form-group">
					<input class="form-control" type="date" name="start" placeholder="Detail Address" required="required">
					</div>
				</div>
				~
				<div class="col-4">
					<div class="form-group">
					<input class="form-control" type="date" name="end" placeholder="Detail Address" required="required">
					</div>
				</div>
			</div>
			<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none; cursor: pointer;">????????????</button>
			<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display: none;">
			<span style="font-size: 10px; color: gray;">?????????????????? ?????? 10????????? ????????? ???????????????.</span>
			<div class="data_file_txt" id="data_file_txt" style="margin: 40px;">
				<span>?????? ??????</span> <br />
				<div id="articlefileChange"></div>
			</div>
			<div class="form-group" align="right">
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="registerAction()">Send</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='main.do'">Cancle</button>
			</div>
		</form>
	</div>
	
<script>
$(document).ready(function()
		// input file ?????? ????????? fileCheck ?????? ??????
		{
			$("#input_file").on("change", fileCheck);
		});
/**
 * ??????????????????
 */
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});
// ?????? ?????? ?????? ?????? totalCount??? ?????????
var fileCount = 0;
// ?????? ????????? ???????????? ?????? ????????? ????????? ?????????.
var totalCount = 10;
// ?????? ????????????
var fileNum = 0;
// ???????????? ??????
var content_files = new Array();
function fileCheck(e) {
    var files = e.target.files;
    
    // ?????? ?????? ??????
    var filesArr = Array.prototype.slice.call(files);
    
    // ?????? ?????? ?????? ??? ??????
    if (fileCount + filesArr.length > totalCount) {
      alert('????????? ?????? '+totalCount+'????????? ????????? ??? ??? ????????????.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // ????????? ?????? ???????????? ??? ??????
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="resources/images/minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //????????? ??????.
    $("#input_file").val("");
  }
// ?????? ?????? ?????? ??????
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}
/*
 * ??? submit ??????
 */
	function registerAction(){
		
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// ?????? ???????????? ?????? ??????. 
			if(!content_files[x].is_delete){
				 formData.append("files", content_files[x]);
			}
		}
	
   /*
   * ??????????????? multiple ajax??????
   */    
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "eventInsertRes.do",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("??????????????? ??????");
   	    		$(location).attr('href','index.do');
			} else
				alert("????????? ????????? ????????????");
   	    		return false;
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("??????????????? ????????????????????????. ?????? ??? ?????? ?????????????????? ????????????.");
   	     return false;
   	      }
   	    });
   	    return false;
	}
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>