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
<bean:define id="thread" name="compareForm" property="thread"></bean:define>
<bean:define id="thread2" name="compareForm" property="thread2"></bean:define>
<title><bean:write name="thread" property="name" /> vs <bean:write
		name="thread2" property="name" /> - TimTro.Com</title>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/compiled.min.css" rel="stylesheet">
<link href="css/mdb.min.css" rel="stylesheet">
<!-- Owl Carousel Assets -->
<link href="css//owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.css" rel="stylesheet">
<link href="css/style-view.css" rel="stylesheet">
<!-- <link href="css/lightbox.min.css" rel="stylesheet"> -->
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
				<logic:iterate name="compareForm" property="categories" id="item">
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
				<li class="dropdown" id="notificationBag"><span
					class="badge red" id="numMessUnread" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"></span>
					<div class="dropdown-menu dropdown dropdown-menu-right"
						aria-labelledby="numMessUnread">
						<span id="listNoti"></span>
					</div></li>
				<li class="nav-item dropdown btn-group" id="menuAcc"
					style="display: none;"><a
					class="nav-link dropdown-toggle btn-right-menu-main"
					id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span id="welcomeText"></span></a>
					<div class="dropdown-menu dropdown dropdown-menu-right"
						aria-labelledby="dropdownMenu1">
						<a class="dropdown-item" href="./user/login.do">Quản lý</a> <a
							class="dropdown-item" onclick="logout();">Đăng xuất</a>
					</div></li>
				<li class="nav-item" id="btnReg"><a
					class="nav-link btn-right-menu-main" data-toggle="modal"
					data-target="#modal-register">Đăng ký</a></li>
				<li class="nav-item" id="btnLog"><a
					class="nav-link  btn-right-menu-main" data-toggle="modal"
					data-target="#modal-login">Đăng nhập</a></li>
				<li class="nav-item" id="btnLog"><a
					class="nav-link  btn-right-menu-main" data-toggle="modal"
					data-target="#modal-compare">So sánh</a></li>
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

				<logic:iterate name="compareForm" property="categories" id="item">
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
		<div class="breadcrumb flat" style="width: 100%; margin-top: 10px;">
			<a style="border: 1px solid #ddd;"><i class="fa fa-home"
				aria-hidden="true" style="font-size: 35px;"></i></a> <a class="active">
				Thông tin so sánh</a>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Bài viết</strong>
			</div>
			<div class="col-lg-4">
				<a
					href="./view-thread-action.do?threadId=<bean:write name="thread" property="threadId" />"
					target="_blank"><bean:write name="thread" property="name" /></a>
			</div>
			<div class="col-lg-4">
				<a
					href="./view-thread-action.do?threadId=<bean:write name="thread2" property="threadId" />"
					target="_blank"><bean:write name="thread2" property="name" /></a>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Giá</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="priceString" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="priceString" />
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Địa chỉ</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="address" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="address" />
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Giá điện</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="electricFeeString" />
				/kí
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="electricFeeString" />
				/kí
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Giá nước</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="waterFeeString" />
				/m&sup3;
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="waterFeeString" />
				/m&sup3;
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Phụ phí</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="otherFeeString" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="otherFeeString" />
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Diện tích</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="area" />
				m&#178;
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="area" />
				m&#178;
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Wifi</strong>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread" property="wifi" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread" property="wifi" value="true">
				Không
				</logic:notEqual>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread2" property="wifi" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread2" property="wifi" value="true">
				Không
				</logic:notEqual>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Máy nước nóng</strong>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread" property="waterHeater" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread" property="waterHeater" value="true">
				Không
				</logic:notEqual>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread2" property="waterHeater" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread2" property="waterHeater" value="true">
				Không
				</logic:notEqual>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Điều hòa</strong>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread" property="conditioner" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread" property="conditioner" value="true">
				Không
				</logic:notEqual>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread2" property="conditioner" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread2" property="conditioner" value="true">
				Không
				</logic:notEqual>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Tủ lạnh</strong>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread" property="fridge" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread" property="fridge" value="true">
				Không
				</logic:notEqual>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread2" property="fridge" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread2" property="fridge" value="true">
				Không
				</logic:notEqual>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Gác xếp</strong>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread" property="attic" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread" property="attic" value="true">
				Không
				</logic:notEqual>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread2" property="attic" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread2" property="attic" value="true">
				Không
				</logic:notEqual>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Camera an ninh</strong>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread" property="camera" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread" property="camera" value="true">
				Không
				</logic:notEqual>
			</div>
			<div class="col-lg-4">
				<logic:equal name="thread2" property="camera" value="true">
				Có
				</logic:equal>
				<logic:notEqual name="thread2" property="camera" value="true">
				Không
				</logic:notEqual>
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Nguồn nước</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="waterSourceString" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="waterSourceString" />
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Số toilet</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="numOfToilets" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="numOfToilets" />
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Số người cho phép</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="numOfPeople" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="numOfPeople" />
			</div>
		</div>
		<div class="row row-compare">
			<div class="col-lg-4">
				<strong>Hướng phòng</strong>
			</div>
			<div class="col-lg-4">
				<bean:write name="thread" property="direction" />
			</div>
			<div class="col-lg-4">
				<bean:write name="thread2" property="direction" />
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>


	<jsp:include page="footer.jsp" />
	<script>
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
		$(document).ready(function() {
			email = readCookie('email');
		});
	</script>
	<script>
		
	</script>
</body>

</html>
