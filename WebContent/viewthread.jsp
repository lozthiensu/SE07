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

	<nav class="navbar navbar-toggleable-md fixed-top" id="menuBeauti"
		style="background-color: #fff; box-shadow: none;">
	<div class="container" style="opacity: 1;">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarNav1"
			aria-controls="navbarNav1" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars" aria-hidden="true"
				style="color: #fff; font-size: 30px;"></i>
		</button>
		<a class="navbar-brand" href="#"> <strong><img
				src="image/logo.png" height="30px;" /></strong>
		</a>
		<div class="collapse navbar-collapse" id="navbarNav1">
			<ul class="navbar-nav mr-auto hidden-lg-up">
				<logic:iterate name="viewThreadForm" property="categories" id="item">
					<li class="nav-item"><a class="nav-link btn-right-menu-main">
							<i class="fa fa-folder-open-o" aria-hidden="true"></i> <bean:write
								name="item" property="name" />
					</a></li>
				</logic:iterate>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link btn-right-menu-main"
					data-toggle="modal" data-target="#modal-register">Đăng ký</a></li>
				<li class="nav-item"><a class="nav-link  btn-right-menu-main"
					data-toggle="modal" data-target="#modal-login">Đăng nhập</a></li>
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

				<logic:iterate name="viewThreadForm" property="categories" id="item">
					<li class="nav-item"><a class="nav-link"> <i
							class="fa fa-folder-open-o" aria-hidden="true"></i> <bean:write
								name="item" property="name" /></a></li>
				</logic:iterate>

			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"><i
						class="fa fa-search" aria-hidden="true"></i> Tìm kiếm</a></li>
			</ul>
		</div>
		</nav>

	</div>
	<br>
	<br>
	<!--Navbar-->
	<div class="container container-white">
		<bean:define id="thread" name="viewThreadForm" property="thread"></bean:define>

		<h2 class="text-center">
			<bean:write name="thread" property="name" />
		</h2>
		<br>
		<div class="row">
			<div class="col-lg-9">
				<div class="breadcrumb flat" style="width: 100%; margin-top: 10px;">
					<a style="border: 1px solid #ddd;"><i class="fa fa-home"
						aria-hidden="true" style="font-size: 35px;"></i></a> <a class="active"
						href="#"> Thông tin chi tiết</a>
				</div>
				<div class="card-wrapper">
					<div id="card-1" class="card-rotating effect__click">
						<!--Back Side-->
						<br> <br> <br>
						<div class="text-left">
							<!--Content-->
							<p>
								<bean:write name="thread" property="content" />
							</p>
						</div>
						<!--/.Back Side-->
						<div class="row">
							<logic:iterate name="viewThreadForm" property="images" id="item">
								<div class="col-lg-3">
									<a href="<bean:write
											name="item" property="src" />"
										data-lightbox="example-set"
										data-title="<bean:write
											name="item" property="content" />">
										<img class="img-fluid"
										src="<bean:write
											name="item" property="src" />"
										alt="<bean:write
											name="item" property="content" />" />
									</a>
								</div>
							</logic:iterate>
						</div>
						<div class="row">
							<logic:iterate name="viewThreadForm" property="images360"
								id="item">
								<div class="col-lg-3">
									<a
										onclick="changeImage360('<bean:write
											name="item" property="src" />', '<bean:write
											name="item" property="content" />')">
										<img class="img-fluid"
										src="<bean:write
											name="item" property="src" />"
										alt="<bean:write
											name="item" property="content" />" />
									</a>
								</div>
							</logic:iterate>
						</div>
						<div class="row">
							<div id="map" class="z-depth-1"></div>
							<div id="map2" class="z-depth-1"></div>
						</div>
					</div>
				</div>
				<!--/.Rotating card-->
			</div>
			<div class="col-lg-3">
				<div class="card card-cascade hoverable" style="margin-top: 0px;">
					<div class="text-center">
						<button type="button"
							class="btn btn-success waves-effect waves-light">Còn
							phòng</button>
					</div>
					<!--/Card image-->
					<!--Card content-->
					<div class="card-block text-center">
						<!--Title-->
						<h4 class="card-title">
							<strong>Giá: <bean:write name="thread" property="price" />
								đ
							</strong>
						</h4>
						<h5 class="card-title">
							<strong>Gọi: <bean:write name="thread" property="price" /></strong>
						</h5>
						<span class="text-left">
							<h5>
								<font color="#607d8b">Ngày đăng:</font>
								<bean:write name="thread" property="created" />
							</h5>
							<h5>
								<font color="#607d8b">Lượt xem:</font>
								<bean:write name="thread" property="viewed" />
							</h5>
							<h5>
								<font color="#607d8b">Lượt đánh giá:</font>
								<bean:write name="thread" property="viewed" />
							</h5>
							<h5>
								<font color="#607d8b">Địa chỉ:</font>
								<bean:write name="thread" property="address" />
							</h5>
							<h5>
								<font color="#607d8b">Giá điện:</font>
								<bean:write name="thread" property="electricFee" />
								đ/kí
							</h5>
							<h5>
								<font color="#607d8b">Giá nước:</font>
								<bean:write name="thread" property="waterFee" />
								đ/m&sup3;
							</h5>
							<h5>
								<font color="#607d8b">Phụ phí:</font>
								<bean:write name="thread" property="otherFee" />
								đ
							</h5>
							<h5>
								<font color="#607d8b">Diện tích:</font>
								<bean:write name="thread" property="area" />
								m&#178;
							</h5>
							<h5>
								<font color="#607d8b">Wifi:</font>
								<bean:write name="thread" property="wifi" />
							</h5>
							<h5>
								<font color="#607d8b">Máy nước nóng:</font>
								<bean:write name="thread" property="waterHeater" />
							</h5>
							<h5>
								<font color="#607d8b">Điều hòa:</font>
								<bean:write name="thread" property="conditioner" />
							</h5>
							<h5>
								<font color="#607d8b">Tủ lạnh:</font>
								<bean:write name="thread" property="fridge" />
							</h5>
							<h5>
								<font color="#607d8b">Gác xếp:</font>
								<bean:write name="thread" property="attic" />
							</h5>
							<h5>
								<font color="#607d8b">Số toilet:</font>
								<bean:write name="thread" property="numOfToilets" />
							</h5>
							<h5>
								<font color="#607d8b">Camera an ninh:</font>
								<bean:write name="thread" property="camera" />
							</h5>
							<h5>
								<font color="#607d8b">Nguồn nước:</font>
								<bean:write name="thread" property="waterSource" />
							</h5>
							<h5>
								<font color="#607d8b">Hướng phòng:</font>
								<bean:write name="thread" property="direction" />
							</h5>
							<h5>
								<font color="#607d8b">Tỉnh:</font>
								<bean:write name="thread" property="villageId" />
							</h5>
							<h5>
								<font color="#607d8b">Quân/Huyện:</font>
								<bean:write name="thread" property="villageId" />
							</h5>
							<h5>
								<font color="#607d8b">Xã:</font>
								<bean:write name="thread" property="villageId" />
							</h5>
						</span>
						<!--/.Card content-->
					</div>
				</div>
			</div>
		</div>
		<br>	<!--Slide new start -->
					<div class="breadcrumb flat">
						<a style="border: 1px solid #ddd;"><i class="fa fa-home"
							aria-hidden="true" style="font-size: 35px;"></i></a> <a
							class="active" href="#"> Bài viết liên quan</a>
					</div>
					<div class="row">
						<!--Carousel Wrapper-->
						<logic:iterate name="viewThreadForm" property="relateThreads" id="threadRelated">
							<!--Card-->
							<div class=" col-lg-4 col-md-6">
								<div class="card card-cascade hoverable"
									style="margin-top: 40px;">
									<!--Card image-->
									<!--Card image-->
									<div class="view overlay hm-white-slight"
										style="margin-top: -15px; width: 90%; margin-left: 5%; min-height: 200px; max-height: 200px;">
										<img class="img-fluid"
											src="<bean:write name="threadRelated" property="imageThumb" />"
											style="border-radius: 3px; width: auto; min-height: 200px;"
											style=" ">
										<div class="mask waves-effect waves-light"></div>
										<div class="mask waves-effect waves-light"></div>
									</div>

									<!--/Card image-->
									<!--Card content-->
									<div class="card-block">
										<!--Social shares button-->
										<a class="activator" style="margin-top: 10px;"><i
											class="fa fa-eye" aria-hidden="true"></i> 1232</a>
										<!--Title-->
										<div class="star-rating" itemprop="aggregateRating"
											itemscope="" itemtype="http://schema.org/AggregateRating">
											<span class="fill"></span><span class="fill"></span><span
												class="fill"></span><span class="fill"></span><span
												class="half"></span>( <strong itemprop="reviewCount">5</strong>
											)
										</div>
									</div>
									<div class="card-block text-center" style="margin-top: -35px;">
										<!--Title-->
										<h4 class="card-title">
											<strong>Giá: <bean:write name="threadRelated"
													property="priceString" />
											</strong>
										</h4>
										<h5>
											Diện tích:
											<bean:write name="threadRelated" property="area" />
											m&#178;
										</h5>
										<p class="card-text truncase-detail">
											<bean:write name="threadRelated" property="name" />
										</p>
										<bean:define id="threadId" name="threadRelated" property="threadId"></bean:define>
										<html:link styleClass="btn btn-success btn-fb"
											action="/view-thread-action?threadId=${threadId}">Xem</html:link>

										<!--Facebook-->
										<a type="button" class="btn-floating btn-small btn-fb"><i
											class="fa fa-compress"></i></a>
										<!--Twitter-->
									</div>
									<!--/.Card content-->
								</div>
							</div>
							<!--/.Card-->
						</logic:iterate>
					</div>
	</div>

				
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/lightbox-plus-jquery.min.js"></script>
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
						if (top > 60) {
							$("#menuBeauti").css("background-color",
									"rgba(0,0,0,0.75)");
						} else {
							$("#menuBeauti").css("background-color",
									"rgba(0,0,0,0)");
						}
					} else {
						$("#menuBeauti").css({
							'position' : "absolute",
							'width' : "100%",
							"background-color" : "rgba(0,0,0,0.75)"
						});
					}
				});
	</script>
	<script>
		var panorama;
		
 		function initPano() {
			panorama = new google.maps.StreetViewPanorama(document
					.getElementById('map'), {
				pano : 'reception',
				visible : true,
				panoProvider : getCustomPanorama,
			    zoom: 0
			});
		}

		function getCustomPanoramaTileUrl(pano, zoom, tileX, tileY) {
			return readCookie('activeSrcImage360');
		}

		function getCustomPanorama(pano, zoom, tileX, tileY) {
			return {
				location : {
					pano : pano,
					description : readCookie('activeNameImage360'),
				    zoom: 0
				},
				links : [],
				copyright : 'Imagery (c) 2010 Google',
				tiles : {
					tileSize : new google.maps.Size(1024, 512),
					worldSize : new google.maps.Size(1024, 512),
					centerHeading : 105,
					getTileUrl : getCustomPanoramaTileUrl,
				    zoom: 0
				}
			};
		}
		
		function changeImage360(src, content){
			console.log(src);console.log(content);
			createCookie('activeSrcImage360',src,1);
			createCookie('activeNameImage360',content,1);
		    panorama.setPano(src);
		}

		function initMap() {
			var uluru = {
				lat : parseFloat('<bean:write name="thread" property="latitude" />'),
				lng :  parseFloat('<bean:write name="thread" property="longitude" />')
			};
			var map = new google.maps.Map(document.getElementById('map2'), {
				zoom : 16,
				center : uluru
			});
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
		}

		function initialize() {
			initPano();
			initMap();
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-H_xa-vjvVRk59cgxAFSBHwj2huBV-B4&callback=initialize">
		
	</script>
</body>

</html>