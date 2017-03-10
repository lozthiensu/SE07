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
	<div class="container">
		<nav class="navbar navbar-toggleable-md navbar-dark green">
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarNav1"
			aria-controls="navbarNav1" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav1">
			<ul class="navbar-nav mr-auto">

				<logic:iterate name="viewThreadForm" property="categories" id="item">
					<li class="nav-item"><a class="nav-link"><bean:write
								name="item" property="name" /></a></li>
				</logic:iterate>

			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link">Tìm kiếm</a></li>
			</ul>
		</div>
		</nav>

	</div>
	<br>
	<br>
	<br>
	<!--Navbar-->
	<div class="container container-white">
		<bean:define id="thread" name="viewThreadForm" property="thread"></bean:define>
		<br> <br>
		<h2 class="text-center">
			<bean:write name="thread" property="name" />
		</h2>
		<br>
		<div class="row">
			<div class="col-lg-9">
				<div class="row">
					<div class="col-lg-8">
						<h1>Mô tả thông tin</h1>
					</div>
					<div class="col-lg-4 text-right">
						<button type="button"
							class="btn btn-success waves-effect waves-light">Còn
							phòng</button>
					</div>
				</div>
				<div class="card-wrapper">
					<div id="card-1" class="card-rotating effect__click">
						<!--Back Side-->
						<div class="text-left">
							<!--Content-->
							<hr>
							<p>
								<bean:write name="thread" property="content" />
							</p>
						</div>
						<!--/.Back Side-->
						<div class="row">
							<div class="col-lg-3">
								<a href="image/1.jpg" data-lightbox="example-set"
									data-title="Click the right half of the image to move forward.">
									<img class="img-fluid" src="image/1.jpg" alt="" />
								</a>
							</div>
							<div class="col-lg-3">
								<a href="image/2.jpg" data-lightbox="example-set"
									data-title="Or press the right arrow on your keyboard."><img
									class="img-fluid" src="image/2.jpg" alt="" /></a>
							</div>
							<div class="col-lg-3">
								<a href="image/3.jpg" data-lightbox="example-set"
									data-title="The next image in the set is preloaded as you're viewing."><img
									class="img-fluid" src="image/3.jpg" alt="" /></a>
							</div>
							<div class="col-lg-3">
								<a href="image/4.jpg" data-lightbox="example-set"
									data-title="Click anywhere outside the image or the X to the right to close."><img
									class="img-fluid" src="image/4.jpg" alt="" /></a>
							</div>
						</div>
						<div id="map" class="z-depth-1"></div>
						<div id="map2" class="z-depth-1"></div>
					</div>
				</div>
				<!--/.Rotating card-->
			</div>
			<div class="col-lg-3">
				<div class="row">
					<div class="card card-cascade hoverable" style="margin-top: 0px;">
						<div class="text-center">
							<a class="btn btn-outline-success btn-rounded waves-effect">Thông
								số</a>
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
									<font color="#607d8b">Lượt xem:</font> <bean:write name="thread" property="viewed" />
								</h5>
								<h5>
									<font color="#607d8b">Lượt đánh giá:</font> <bean:write name="thread" property="viewed" />
								</h5>
								<h5>
									<font color="#607d8b">Địa chỉ:</font> <bean:write name="thread" property="address" />
								</h5>
								<h5>
									<font color="#607d8b">Giá điện:</font><bean:write name="thread" property="electricFee" /> đ/kí
								</h5>
								<h5>
									<font color="#607d8b">Giá nước:</font> <bean:write name="thread" property="waterFee" /> đ/m&sup3;
								</h5>
								<h5>
									<font color="#607d8b">Phụ phí:</font> <bean:write name="thread" property="otherFee" /> đ
								</h5>
								<h5>
									<font color="#607d8b">Diện tích:</font> <bean:write name="thread" property="area" /> m&#178;
								</h5>
								<h5>
									<font color="#607d8b">Wifi:</font> <bean:write name="thread" property="wifi" />
								</h5>
								<h5>
									<font color="#607d8b">Máy nước nóng:</font> <bean:write name="thread" property="waterHeater" />
								</h5>
								<h5>
									<font color="#607d8b">Điều hòa:</font> <bean:write name="thread" property="conditioner" />
								</h5>
								<h5>
									<font color="#607d8b">Tủ lạnh:</font> <bean:write name="thread" property="fridge" />
								</h5>
								<h5>
									<font color="#607d8b">Gác xếp:</font> <bean:write name="thread" property="attic" />
								</h5>
								<h5>
									<font color="#607d8b">Số toilet:</font> <bean:write name="thread" property="numOfToilets" />
								</h5>
								<h5>
									<font color="#607d8b">Camera an ninh:</font> <bean:write name="thread" property="camera" />
								</h5>
								<h5>
									<font color="#607d8b">Nguồn nước:</font> <bean:write name="thread" property="waterSource" />
								</h5>
								<h5>
									<font color="#607d8b">Hướng phòng:</font> <bean:write name="thread" property="direction" />
								</h5>
								<h5>
									<font color="#607d8b">Tỉnh:</font> <bean:write name="thread" property="villageId" />
								</h5>
								<h5>
									<font color="#607d8b">Quân/Huyện:</font> <bean:write name="thread" property="villageId" />
								</h5>
								<h5>
									<font color="#607d8b">Xã:</font> <bean:write name="thread" property="villageId" />
								</h5>
							</span>
						</div>
						<!--/.Card content-->
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row" style="margin-top: 300px;">
			<!--Slide new start -->
			<div class="slide-new">
				<h1 class="h1-title">Nhà trọ liên quan</h1>
				<!--Carousel Wrapper-->
				<div id="nha-cho-thue" class="carousel slide carousel-multi-item"
					style="margin-top: -83px;" data-ride="carousel">
					<!--Controls-->
					<a class="btn-floating btn-small carousel-preview"
						href="#nha-cho-thue" data-slide="prev"><i
						class="fa fa-chevron-left"></i></a> <a
						class="btn-floating btn-small carousel-next" href="#nha-cho-thue"
						data-slide="next"><i class="fa fa-chevron-right"></i></a>
					<!--/.Controls-->
					<!--Indicators-->
					<ol class="carousel-indicators">
						<li data-target="#nha-cho-thue" data-slide-to="0" class="active"></li>
						<li data-target="#nha-cho-thue" data-slide-to="1"></li>
						<li data-target="#nha-cho-thue" data-slide-to="2"></li>
					</ol>
					<!--/.Indicators-->
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="col-md-4">
								<!--Card-->
								<div class="card card-cascade hoverable"
									style="margin-top: 40px;">
									<!--Card image-->
									<div class="view overlay hm-white-slight"
										style="border-radius: 10px; margin-top: -20px; width: 90%; margin-left: 5%; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12);">
										<img src="image/4.jpg" class="img-fluid"
											style="border-radius: 10px; width: 100%;"> <a href="#!">
											<div class="mask waves-effect waves-light"></div>
										</a>
									</div>
									<!--/Card image-->
									<!--Card content-->
									<div class="card-block text-center">
										<!--Title-->
										<h4 class="card-title">
											<strong>Giá: 2.000.000 đ</strong>
										</h4>
										<h5>Diện tích: 40 m&#178;</h5>
										<p class="card-text truncase-detail">Phòng rộng, thoáng
											mát, sạch sẽ, tiện nghi đầy đủ.</p>
										<button type="button" class="btn btn-success">Chi
											tiết</button>
									</div>
									<!--/.Card content-->
								</div>
								<!--/.Card-->
							</div>
							<div class="col-md-4 hidden-sm-down">
								<!--Card-->
								<div class="card card-cascade hoverable"
									style="margin-top: 40px;">
									<!--Card image-->
									<div class="view overlay hm-white-slight"
										style="border-radius: 10px; margin-top: -20px; width: 90%; margin-left: 5%; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12);">
										<img src="image/6.jpg" class="img-fluid"
											style="border-radius: 10px; width: 100%;"> <a href="#!">
											<div class="mask waves-effect waves-light"></div>
										</a>
									</div>
									<!--/Card image-->
									<!--Card content-->
									<div class="card-block text-center">
										<!--Title-->
										<h4 class="card-title">
											<strong>Giá: 1.000.000 đ</strong>
										</h4>
										<h5>Diện tích: 20 m&#178;</h5>
										<p class="card-text truncase-detail">Phòng thích hợp cho
											sinh viên, có wifi, 2 toilet, an ninh đảm bảo.</p>
										<button type="button" class="btn btn-success">Chi
											tiết</button>
									</div>
									<!--/.Card content-->
								</div>
								<!--/.Card-->
							</div>
							<div class="col-md-4 hidden-sm-down">
								<!--Card-->
								<div class="card card-cascade hoverable"
									style="margin-top: 40px;">
									<!--Card image-->
									<div class="view overlay hm-white-slight"
										style="border-radius: 10px; margin-top: -20px; width: 90%; margin-left: 5%; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12);">
										<img src="image/6.jpg" class="img-fluid"
											style="border-radius: 10px; width: 100%;"> <a href="#!">
											<div class="mask waves-effect waves-light"></div>
										</a>
									</div>
									<!--/Card image-->
									<!--Card content-->
									<div class="card-block text-center">
										<!--Title-->
										<h4 class="card-title">
											<strong>Giá: 1.500.000 đ</strong>
										</h4>
										<h5>Diện tích: 25 m&#178;</h5>
										<p class="card-text truncase-detail">Cho thuê phòng trọ
											quận 7 hẻm 156 huỳnh tấn phát gần khu chế xuất tân thuận, các
											trường đại học maketing, đại học nguyễn tất thành, đại học
											luật…</p>
										<button type="button" class="btn btn-success">Chi
											tiết</button>
									</div>
									<!--/.Card content-->
								</div>
								<!--/.Card-->
							</div>
						</div>
						<!--/.First slide-->
					</div>
					<!--/.Slides-->
				</div>
			</div>
			<!--Slide new end -->
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/lightbox-plus-jquery.min.js"></script>
</body>

</html>