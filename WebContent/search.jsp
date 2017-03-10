<%@page import="common.StringProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/compiled.min.css" rel="stylesheet">
<link href="css/mdb.min.css" rel="stylesheet">
<!-- Owl Carousel Assets -->
<link href="css//owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.css" rel="stylesheet">
<link href="css/style-view.css" rel="stylesheet">
<link href="css/lightbox.min.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="header.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>
	<!--Navbar-->

	<div class="container container-white">
		Enter your name please : <input type="text" id="name"><br />
		<input type="button" value="Say Hello" onclick="doAjaxPost()"><br />
		<div id="info" style="color: green;"></div>
		<!-- <img src="image/logo.png" class="img-fluid logo" /> -->
		<br> <br>
		<!--Carousel Wrapper-->
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="wifi" checked> <label
								for="wifi">Wifi/Mạng</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="waterHeater" checked> <label
								for="waterHeater">Máy nước nóng</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="conditioner" checked> <label
								for="conditioner">Điều hòa</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="checkbox4"> <label
								for="checkbox4">Tủ lạnh</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="checkbox5"> <label
								for="checkbox5">Camera an ninh</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select">
							<option value="" disabled selected>Chọn đối tượng phù
								hợp</option>
							<option value="1">Nam</option>
							<option value="1">Nữ</option>
							<option value="2">Không xác định</option>
						</select> <label>Đối tượng</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select">
							<option value="" disabled selected>Chọn diện tích thích
								hợp</option>
							<option value="1">&lt; 15 m&#178;</option>
							<option value="1">15 - 25 m&#178;</option>
							<option value="2">25 - 35 m&#178;</option>
							<option value="3">35 - 50 m&#178;</option>
							<option value="3">&gt; 50 m&#178;</option>
						</select> <label>Diện tích</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select">
							<option value="" disabled selected>Chọn giá phòng thích
								hợp</option>
							<option value="1">&lt; 500 k</option>
							<option value="1">500 - 1000 k</option>
							<option value="2">1000 - 1500 k</option>
							<option value="3">1500 - 2500 k</option>
							<option value="3">2500 - 5000 k</option>
							<option value="3">&gt; 5000 k</option>
						</select> <label>Giá phòng</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select">
							<option value="" disabled selected>Chọn phạm vi thích
								hợp</option>
							<option value="1">&lt; 500 m</option>
							<option value="1">500 - 1500 m</option>
							<option value="2">1500 - 3000 m</option>
							<option value="3">3000 - 6000 m</option>
							<option value="3">6000 - 10000 m</option>
							<option value="3">&gt; 10000 m</option>
						</select> <label>Phạm vi</label>
					</div>

				</div>

			</div>
			<!--/.Card-->
		</div>
		<br> <br> <br>
		<!--/.Carousel Wrapper-->
		<!--/.Navbar-->
		<div class="col-lg-12">
			<h1 class="h1-title">Kết quả tìm kiếm</h1>
			<div class="row" id="resultThreads"></div>
			<br> <br> <br>
			<div style="display: table; margin: 0 auto;">
				<nav>
				<ul class="pagination pg-amber">
					<!--Arrow left-->
					<li class="page-item"><a class="page-link"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>

					<!--Numbers-->
					<li class="page-item active"><a class="page-link">1</a></li>
					<li class="page-item"><a class="page-link">2</a></li>
					<li class="page-item"><a class="page-link">3</a></li>
					<li class="page-item"><a class="page-link">4</a></li>
					<li class="page-item"><a class="page-link">5</a></li>

					<!--Arrow right-->
					<li class="page-item"><a class="page-link" aria-label="Next">
							<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
					</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript">
		function log(text) {
			console.log(text);
		}
		$(document).ready(function() {
			$('.mdb-select').material_select();
		});
		function doAjaxPost() {
			// get the form values
			var name = $('#name').val();
			var wifi = $('#wifi').is(':checked');
			var waterHeater = $('#waterHeater').is(':checked');
			var conditioner = $('#conditioner').is(':checked');
			$.ajax({
				type : "POST",
				url : "/Mock_SE7/search-thread.do",
				data : "name=" + name + "&wifi=" + wifi
						+ "&waterHeater=" + waterHeater
						+ "&conditioner=" + conditioner,
				success : function(response) {
					var threads = JSON.parse(response);
					if (threads != undefined) {
						var n = threads.length;
						var stringResults = '';
						for (var i = 0; i < n; i++) {
							stringResults += "<div class=\"col-lg-4\">"
							+"<div class=\"card card-cascade hoverable\" style=\"margin-top: 40px;\">"
							+"<div class=\"view overlay hm-white-slight\" style=\"border-radius: 10px; margin-top: -20px; width: 90%; margin-left: 5%; box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);\">"
							+"	<img src=\""+ threads[i].imageThumb +"\" class=\"img-fluid\" style=\" border-radius: 10px; width: 100%; \">"
							+"<a href=\"#!\">"
							+"	<div class=\"mask waves-effect waves-light\"></div>"
							+"</a>"
							+"</div>"
							+"<div class=\"card-block text-center\">"
							+"<h4 class=\"card-title\"><strong>Giá: "+ threads[i].price +" đ</strong></h4>"
							+"<h5>Diện tích: "+ threads[i].area +" m&#178;</h5>"
							+"<p class=\"card-text truncase-detail\">"+ threads[i].content +"</p>"
							+"<a href=\"view-thread-action.do?threadId="+ threads[i].threadId +"\" ><button type=\"button\" class=\"btn btn-success\">Chi tiết</button></a>"
							+"</div>"
							+"</div>"
							+"</div>";
						}
					}
					$('#resultThreads').html(stringResults);
				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
		}
	</script>
</body>

</html>