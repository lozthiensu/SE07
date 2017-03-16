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


	<nav class="navbar navbar-toggleable-md blur-bgimage fixed-top"
		id="menuBeauti">
	<div class="container" style="opacity: 1;">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarNav1"
			aria-controls="navbarNav1" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars" aria-hidden="true"
				style="color: #fff; font-size: 30px;"></i>
		</button>
		<a class="navbar-brand" href="./"> <strong><img
				src="image/logo.png" height="30px;" /></strong>
		</a>
		<div class="collapse navbar-collapse" id="navbarNav1">
			<ul class="navbar-nav mr-auto hidden-lg-up">
				<logic:iterate name="searchForm" property="categories" id="item">
					<li class="nav-item"><a class="nav-link btn-right-menu-main"
						href='./view-category-action.do?categoryId=<bean:write
								name="item" property="categoryId" />'>
							<i class="fa fa-folder-open-o" aria-hidden="true"></i> <bean:write
								name="item" property="name" />
					</a></li>
				</logic:iterate>
			</ul>
			<ul class="navbar-nav ml-auto">
				<img src="img/avatar.jpg" alt="Hình đại diện" class="rounded-circle"
					style="width: 40px; height: 40px; display: none;" id="imgAva">
				<li class="nav-item dropdown btn-group" id="menuAcc"
					style="display: none;"><a
					class="nav-link dropdown-toggle btn-right-menu-main"
					id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span id="welcomeText"></span></a>
					<div class="dropdown-menu dropdown dropdown-menu-right"
						aria-labelledby="dropdownMenu1">
						<a class="dropdown-item" onclick="logout();">Đăng xuất</a>
					</div></li>
				<li class="nav-item" id="btnReg"><a
					class="nav-link btn-right-menu-main" data-toggle="modal"
					data-target="#modal-register">Đăng ký</a></li>
				<li class="nav-item" id="btnLog"><a
					class="nav-link  btn-right-menu-main" data-toggle="modal"
					data-target="#modal-login">Đăng nhập</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- End WOWSlider.com BODY section -->
	<br>
	<!--Navbar-->
	<div class="container">
		<nav
			class="navbar navbar-toggleable-md navbar-dark green custom-nav-view-thread hidden-md-down">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarNav1"
			aria-controls="navbarNav1" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav1">
			<ul class="navbar-nav mr-auto">

				<logic:iterate name="searchForm" property="categories" id="item">
					<li class="nav-item"><a class="nav-link"
						href='./view-category-action.do?categoryId=<bean:write
								name="item" property="categoryId" />'>
							<i class="fa fa-folder-open-o" aria-hidden="true"></i> <bean:write
								name="item" property="name" />
					</a></li>
				</logic:iterate>

			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="./search.do"><i
						class="fa fa-search" aria-hidden="true"></i> Tìm kiếm</a></li>
			</ul>
		</div>
		</nav>

	</div>
	<br>

	<br>
	<!--Navbar-->

	<div class="container container-white">
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
							<input type="checkbox" id="waterHeater"> <label
								for="waterHeater">Máy nước nóng</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="conditioner"> <label
								for="conditioner">Điều hòa</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="fridge"> <label for="fridge">Tủ
								lạnh</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="attic"> <label for="attic">Gác
								xếp</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="camera"> <label for="camera">Camera
								an ninh</label>
						</fieldset>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3">
						<select class="mdb-select" id="waterSource">
							<option value="0" selected>Không</option>
							<option value="1">Giếng đào</option>
							<option value="2">Giếng đóng-khoan</option>
							<option value="3">Nước máy</option>
							<option value="4">Không xác định</option>
						</select> <label>Nguồn nước</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="object">
							<option value="0" selected>Không</option>
							<option value="1">Nam</option>
							<option value="1">Nữ</option>
							<option value="2">Không xác định</option>
						</select> <label>Đối tượng</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="area">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 15 m&#178;</option>
							<option value="2">15 - 25 m&#178;</option>
							<option value="3">25 - 35 m&#178;</option>
							<option value="4">35 - 50 m&#178;</option>
							<option value="5">&gt; 50 m&#178;</option>
						</select> <label>Diện tích</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="price">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 500 k</option>
							<option value="2">500 - 1000 k</option>
							<option value="3">1000 - 1500 k</option>
							<option value="4">1500 - 2500 k</option>
							<option value="5">2500 - 5000 k</option>
							<option value="6">&gt; 5000 k</option>
						</select> <label>Giá phòng</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="far">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 500 m</option>
							<option value="2">500 - 1500 m</option>
							<option value="3">1500 - 3000 m</option>
							<option value="4">3000 - 6000 m</option>
							<option value="5">6000 - 10000 m</option>
							<option value="6">&gt; 10000 m</option>
						</select> <label>Phạm vi</label>
					</div>
					<div class="col-lg-3">
						<html:select name="searchForm" property="provinceId"
							styleClass="mdb-select" styleId="slbProvince">
							<option value="" selected>Không</option>
							<logic:iterate name="searchForm" property="provinces" id="item">
								<bean:define id="id" name="item" property="provinceId" />
								<html:option value="${id}">
									<bean:write name="item" property="name" />
								</html:option>
							</logic:iterate>
						</html:select>
						<label>Tỉnh/Thành phố</label>
					</div>
					<div class="col-lg-3">
						<select name="districtId" class="mdb-select" id="slbDistrict">
							<option value="" selected>Không</option>
						</select> <label>Quận/Huyện</label>
					</div>
					<div class="col-lg-3">
						<select name="villageId" class="mdb-select" id="slbVillage">
							<option value="" selected>Không</option>
						</select> <label>Làng/Xã</label>
					</div>
					<div class="col-lg-12">
						<div class="md-form">
							<input type="text" id="name" class="form-control validate"
								length="250" onkeypress="doAjaxPost()"> <label
								for="name" data-error="wrong" data-success="right">Nhập
								từ khóa</label>
						</div>
						<input type="button" value="Say Hello" onclick="doAjaxPost()"><br />
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

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		var stick = function() {
			var size = $(window).width();
			var doc = document.documentElement;
			var top = (window.pageYOffset || doc.scrollTop)
					- (doc.clientTop || 0);
			if (size > 1003) {
				$("#menuBeauti").css({
					'position' : "fixed",
					'width' : "100%"
				});
				if (top > 60) {
					$("#menuBeauti")
							.css("background-color", "rgba(0,0,0,0.75)");
				} else {
					$("#menuBeauti").css("background-color", "rgba(0,0,0,0)");
				}
			} else {
				$("#menuBeauti").css({
					'position' : "absolute",
					'width' : "100%",
					"background-color" : "rgba(0,0,0,0.75)"
				});
			}
		}
		$(window).scroll(function() {
			stick();
		});
		function log(text) {
			console.log(text);
		}
		$(document).ready(function() {
			createCookie('page', 1, 1);
			$('.mdb-select').material_select();
			$('#slbProvince').on("change", function() {
				var provinceId = $(this).val();
				log(provinceId);
				var str = "action=getDistrict" + "&provinceId=" + provinceId;
				log("POST: " + str);
				$.ajax({
					type : "POST",
					url : "/Mock_SE7/search-thread.do",
					data : str,
					success : function(response) {
						log("RES: " + response);
						var districts = JSON.parse(response);
						if (districts != undefined) {
							var n = districts.length;
							var stringResults = '<option value="" selected>Không</option>';
							for (var i = 0; i < n; i++) {
								stringResults += '<option value="'+districts[i].districtId+'">'+districts[i].name+'</option>';
							}
							$('#slbDistrict').html(stringResults);
							$('#slbDistrict').material_select();

							$('#slbVillage').html('<option value="" selected>Không</option>');
							$('#slbVillage').material_select();
						}
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
			});
			$('#slbDistrict').on("change", function() {
				var districtId = $(this).val();
				log(districtId);
				var str = "action=getVillage" + "&districtId=" + districtId;
				log("POST: " + str);
				$.ajax({
					type : "POST",
					url : "/Mock_SE7/search-thread.do",
					data : str,
					success : function(response) {
						log("RES: " + response);
						var villages = JSON.parse(response);
						if (villages != undefined) {
							var n = villages.length;
							var stringResults = '<option value="" selected>Không</option>';
							for (var i = 0; i < n; i++) {
								stringResults += '<option value="'+villages[i].villageId+'">'+villages[i].name+'</option>';
							}
							$('#slbVillage').html(stringResults);
							$('#slbVillage').material_select();
						}
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
			});
		});
		function doAjaxPost() {
			// get the form values
			wifi = $('#wifi').is(':checked');
			waterHeater = $('#waterHeater').is(':checked');
			conditioner = $('#conditioner').is(':checked');
			fridge = $('#fridge').is(':checked');
			attic = $('#attic').is(':checked');
			camera = $('#camera').is(':checked');
			object = $('#object').val();
			waterSource = $('#waterSource').val();
			area = $('#area').val();
			price = $('#price').val();
			far = $('#far').val();
			provinceId = $('#slbProvince').val();
			districtId = $('#slbDistrict').val();
			villageId = $('#slbVillage').val();
			name = $('#name').val();
			page = parseInt(readCookie('page'));
			var str = "action=search" + 
			"&wifi=" + wifi + 
			"&waterHeater=" + waterHeater +
			"&conditioner=" + conditioner +
			"&fridge=" + fridge +
			"&attic=" + attic +
			"&camera=" + camera +
			"&object=" + object +
			"&waterSource=" + waterSource +
			"&area=" + area +
			"&price=" + price +
			"&far=" + far +
			"&provinceId=" + provinceId +
			"&districtId=" + districtId +
			"&villageId=" + villageId +
			"&name=" + name;
			"&page=" + page;
			log("Post " + str);
			$.ajax({
				type : "POST",
				url : "/Mock_SE7/search-thread.do",
				data : str,
				success : function(response) {
					++page;
					createCookie('page', page, 1);
					//log("Res " + response);
					var threads = JSON.parse(response);
					if (threads != undefined) {
						var n = threads.length;
						var stringResults = '';
						for (var i = 0; i < n; i++) {
							stringResults += "<div class=\"col-lg-4\">"
									+ "<div class=\"card card-cascade hoverable\" style=\"margin-top: 40px;\">"
									+ "<div class=\"view overlay hm-white-slight\" style=\"border-radius: 10px; margin-top: -20px; width: 90%; margin-left: 5%; box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);\">"
									+ "	<img src=\""
									+ threads[i].imageThumb
									+ "\" class=\"img-fluid\" style=\" border-radius: 10px; width: 100%; \">"
									+ "<a href=\"#!\">"
									+ "	<div class=\"mask waves-effect waves-light\"></div>"
									+ "</a>"
									+ "</div>"
									+ "<div class=\"card-block text-center\">"
									+ "<h4 class=\"card-title\"><strong>Giá: "
									+ threads[i].price
									+ " đ</strong></h4>"
									+ "<h5>Diện tích: "
									+ threads[i].area
									+ " m&#178;</h5>"
									+ "<p class=\"card-text truncase-detail\">"
									+ threads[i].content
									+ "</p>"
									+ "<a href=\"view-thread-action.do?threadId="
									+ threads[i].threadId
									+ "\" ><button type=\"button\" class=\"btn btn-success\">Chi tiết</button></a>"
									+ "</div>" + "</div>" + "</div>";
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