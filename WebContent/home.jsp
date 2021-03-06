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
<title>TimTro.Com - Tìm trọ online nhanh chóng chính xác</title>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/compiled.min.css" rel="stylesheet">
<link href="css/mdb.min.css" rel="stylesheet">
<link href="css/style-view.css" rel="stylesheet">
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
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
		<a class="navbar-brand"> <strong><img
				src="image/logo.png" height="30px;" /></strong>
		</a>
		<div class="collapse navbar-collapse" id="navbarNav1">
			<ul class="navbar-nav mr-auto hidden-lg-up">
				<logic:iterate name="homeViewForm" property="categories" id="item">
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
	<!--Carousel Wrapper-->
	<!-- Start WOWSlider.com BODY section -->
	<div id="wowslider-container1"
		style="font-size: 10px; position: fixed; z-index: 1;">
		<div class="ws_images ">
			<ul>
				<logic:iterate name="homeViewForm" property="viewHighest" id="item">
					<li><a
						href="./view-thread-action.do?threadId=<bean:write name="item" property="threadId" />""><img
							class="blur-bgimage"
							src="<bean:write name="item" property="imageThumb" />"
							alt="<bean:write name="item" property="name" />"
							title="<bean:write name="item" property="name" />"
							id="wows1_<bean:write name="item" property="threadId" />" /></a></li>
				</logic:iterate>

			</ul>
		</div>
		<!-- <div class="ws_script" style="position: absolute; left: -99%">
			<a href="http://wowslider.com">bootstrap slider</a> by WOWSlider.com
			v8.7
		</div> -->

	</div>
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>

	<!-- End WOWSlider.com BODY section -->
	<br>
	<!--Navbar-->
	<div class="container" style="margin-top: 460px; z-index: 2;">
		<nav
			class="navbar navbar-toggleable-md navbar-dark green custom-nav-home hidden-md-down">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarNav1"
			aria-controls="navbarNav1" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav1">
			<ul class="navbar-nav mr-auto">
				<logic:iterate name="homeViewForm" property="categories" id="item">
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

	<!-- another version - flat style with animated hover effect -->

	<div class="container container-white"
		style="margin-top: 0; z-index: 3; background: #fff;">
		<div class="row">
			<div class="col-lg-12">

				<logic:iterate name="homeViewForm" property="categoryWithThreads"
					id="item">
					<!--Slide new start -->
					<div class="breadcrumb flat">
						<a style="border: 1px solid #ddd;"><i class="fa fa-home"
							aria-hidden="true" style="font-size: 35px;"></i></a> <a
							class="active"
							href="./view-category-action.do?categoryId=<bean:write name="item"
								property="categoryId" />">
							<bean:write name="item" property="name" />
						</a>
					</div>
					<div class="row">
						<!--Carousel Wrapper-->
						<logic:iterate name="item" property="threads" id="thread">
							<!--Card-->
							<div class=" col-lg-4 col-md-6">
								<div class="card card-cascade hoverable"
									style="margin-top: 40px;">
									<!--Card image-->
									<!--Card image-->
									<div class="view overlay hm-white-slight"
										style="margin-top: -15px; width: 90%; margin-left: 5%; min-height: 200px; max-height: 200px;">
										<img class="img-fluid"
											src="<bean:write name="thread" property="imageThumb" />"
											style="border-radius: 3px; width: auto; min-height: 200px;"
											style=" ">
										<div class="mask waves-effect waves-light"></div>
										<div class="mask waves-effect waves-light"></div>
									</div>

									<!--/Card image-->
									<!--Card content-->
									<div class="card-block card-block-tren">
										<!--Social shares button-->
										<a class="activator" style="margin-top: -5px;"><i
											class="fa fa-eye" aria-hidden="true"></i> <bean:write
												name="thread" property="viewed" /></a>
										<!--Title-->
										<span
											class="score s<bean:write name="thread" property="avgScoreInt" />"
											style="margin-top: -15px;"></span> (<strong
											itemprop="reviewCount"><bean:write name="thread"
												property="avgScore" /></strong>)
									</div>
									<div class="card-block text-center" style="margin-top: 0px;">
										<!--Title-->
										<h4 class="card-title" style="">
											<strong><i class="fa fa-money"
												style="font-size: 25px; color: #000"></i> <bean:write
													name="thread" property="priceString" /> </strong>
										</h4>
										<h5 style="">
											<i class="fa fa-area-chart"
												style="font-size: 16px; color: #000"></i>
											<bean:write name="thread" property="area" />
											m&#178;
										</h5>
										<p class="card-text truncase-detail" style="clear: both;">
											<bean:write name="thread" property="name" />
										</p>
										<bean:define id="threadId" name="thread" property="threadId"></bean:define>
										<bean:define id="name" name="thread" property="name"></bean:define>
										<html:link styleClass="btn btn-success btn-fb"
											action="/view-thread-action?threadId=${threadId}">Xem</html:link>

										<!--Facebook-->
										<a type="button" onclick="addToCompare(${threadId},'${name}')"
											class="btn-floating btn-small btn-fb"><i
											class="fa fa-compress"></i></a>
										<!--Twitter-->
									</div>
									<!--/.Card content-->
								</div>
							</div>
							<!--/.Card-->
						</logic:iterate>
					</div>
				</logic:iterate>

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
				if (top > 360) {
					$("#menuBeauti")
							.css("background-color", "rgba(0,0,0,0.75)");
				} else {
					$("#menuBeauti").css("background-color", "rgba(0,0,0,0.1)");
				}
			} else {
				$("#menuBeauti").css({
					'position' : "absolute",
					'width' : "100%"
				});
			}
		}
		$(window).scroll(function() {
			stick();
		});
		$(document).ready(
				function() {
					var size = $(window).width();
					var doc = document.documentElement;
					var top = (window.pageYOffset || doc.scrollTop)
							- (doc.clientTop || 0);
					if (size > 1003) {
						$("#menuBeauti").css({
							'position' : "fixed"
						});
						if (top > 360) {
							$("#menuBeauti").css("background-color",
									"rgba(0,0,0,0.75)");
						} else {
							$("#menuBeauti").css("background-color",
									"rgba(0,0,0,0.1)");
						}
					} else {
						$("#menuBeauti").css({
							'position' : "absolute"
						});
					}
				});
	</script>
</body>

</html>