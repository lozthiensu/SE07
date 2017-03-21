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
				<logic:iterate name="viewThreadForm" property="categories" id="item">
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
						<a class="dropdown-item" href="./user/">Quản lý</a> <a
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

				<logic:iterate name="viewThreadForm" property="categories" id="item">
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
				<div class="infoThread">
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
						<br> <br>


						<div class="row infoThread">
							<div id="map" class="z-depth-1"></div>
							<div id="map2" class="z-depth-1"></div>
						</div>
						<div class="breadcrumb flat"
							style="width: 100%; margin-top: 10px;">
							<a style="border: 1px solid #ddd;"><i class="fa fa-home"
								aria-hidden="true" style="font-size: 35px;"></i></a> <a
								class="active" href="#"> Bình luận</a>
						</div>
						<div class="modal-body infoThread">

							<section> <!--Leave a reply form-->
							<div class="reply-form">
								<p class="text-center" id="welcomeToRate">(Chức năng yêu cầu
									đăng nhập)</p>

								<!--Third row-->
								<div class="row">
									<!--Image column-->
									<div class="col-sm-2 col-12">
										<img src="image/avatar.jpg" style="height: 100px;" id="imgAvaCMT">
									</div>
									<!--/.Image column-->

									<!--Content column-->
									<div class="col-sm-10 col-12">
										<div class="md-form">
											<textarea type="text" id="newContentRate" class="md-textarea"
												length="200" maxlength="200"></textarea>
											<label for="form8">Nội dung</label>
											<div class="form-inline">

												<fieldset class="form-group">
													<input name="newScoreRate" type="radio" id="radio1"
														checked="checked" value="1"> <label for="radio1">Rất
														tệ</label>
												</fieldset>

												<fieldset class="form-group">
													<input name="newScoreRate" type="radio" id="radio2"
														value="2"> <label for="radio2">Tệ</label>
												</fieldset>

												<fieldset class="form-group">
													<input name="newScoreRate" type="radio" id="radio3"
														value="3"> <label for="radio3">Bình thường</label>
												</fieldset>

												<fieldset class="form-group">
													<input name="newScoreRate" type="radio" id="radio4"
														value="4"> <label for="radio4">Tốt</label>
												</fieldset>
												<fieldset class="form-group">
													<input name="newScoreRate" type="radio" id="radio5"
														value="5"> <label for="radio5">Rất tốt</label>
												</fieldset>

											</div>
										</div>

									</div>

									<div class="text-center">
										<button class="btn btn-primary" onclick="return submitRate();"
											id="btnAddRate">Gửi bình luận</button>
									</div>
									<!--/.Content column-->

								</div>
								<!--/.Third row-->
							</div>
							<!--/.Leave a reply form--> </section>
						</div>
					</div>
				</div>
				<!--/.Rotating card-->

				<!-- START COMMENTS -->
				<!--Main wrapper-->
				<div class="comments-list text-left infoThread">
					<div class="section-heading">
						<h3>
							Số bình luận<span class="badge blue" id="ratesCountAjax"><bean:write
									name="viewThreadForm" property="ratesCount" /></span>
						</h3>
					</div>
					<!--First row-->
					<div id="listRate">
						<logic:iterate name="viewThreadForm" property="rates" id="item">
							<div class="row">
								<!--Image column-->
								<div class="col-sm-2 col-12">
									<img src="<bean:write name="item" property="accountImage" />"
										style="height: 100px;">
								</div>
								<!--/.Image column-->
								<!--Content column-->
								<div class="col-sm-10 col-12">
									<a><h3 class="user-name">
											<bean:write name="item" property="accountName" />
										</h3></a>
									<div class="card-data" style="padding: 0px;">
										<ul>
											<li class="comment-date"><i class="fa fa-commenting"
												aria-hidden="true"></i> <span
												class="score s<bean:write name="item" property="score" />"></span>
											</li>
											<li class="comment-date" style="float: right;"><i
												class="fa fa-clock-o"></i> <bean:write name="item"
													property="created" /></li>
										</ul>
									</div>
									<p class="comment-text"
										style="word-wrap: break-word; word-break: break-all;">
										<bean:write name="item" property="content" />
									</p>
								</div>
								<!--/.Content column-->
							</div>
						</logic:iterate>
					</div>

					<!--/.First row-->
				</div>
				<!--/.Main wrapper-->
				<!-- END COMMENTS -->

			</div>
			<div class="col-lg-3">
				<div class="card card-cascade hoverable" style="margin-top: 0px;">
					<input style="display: none;" id="threadOld"
						value="<bean:write name="thread" property="old" />"></input>
					<div class="text-center">
						<logic:equal name="thread" property="old" value="true">
							<button type="button"
								class="btn btn-danger waves-effect waves-light">Tin đã
								quá lâu</button>
						</logic:equal>
						<logic:equal name="thread" property="old" value="false">
							<button type="button"
								class="btn btn-success waves-effect waves-light">Tin
								còn hạn</button>
						</logic:equal>
					</div>
					<!--/Card image-->
					<!--Card content-->
					<div class="card-block text-center infoThread">
						<!--Title-->
						<h4 class="card-title">
							<strong>Giá: <bean:write name="thread" property="price" />
								đ
							</strong>
						</h4>
						<h5 class="card-title">
							<strong>Gọi: <bean:write name="thread" property="price" /></strong>
						</h5>
						<span class="text-left"> <span
							class="score s<bean:write name="thread" property="avgScoreInt" />"></span>(<strong
							itemprop="reviewCount"><bean:write name="thread"
									property="avgScore" /></strong>)
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
								<bean:write name="thread" property="rateNum" />
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
								<logic:equal name="thread" property="wifi" value="true">
								Có
								</logic:equal>
								<logic:notEqual name="thread" property="wifi" value="true">
								Không
								</logic:notEqual>
							</h5>
							<h5>
								<font color="#607d8b">Máy nước nóng:</font>
								<logic:equal name="thread" property="waterHeater" value="true">
								Có
								</logic:equal>
								<logic:notEqual name="thread" property="waterHeater"
									value="true">
								Không
								</logic:notEqual>
							</h5>
							<h5>
								<font color="#607d8b">Điều hòa:</font>
								<logic:equal name="thread" property="conditioner" value="true">
								Có
								</logic:equal>
								<logic:notEqual name="thread" property="conditioner"
									value="true">
								Không
								</logic:notEqual>
							</h5>
							<h5>
								<font color="#607d8b">Tủ lạnh:</font>
								<logic:equal name="thread" property="fridge" value="true">
								Có
								</logic:equal>
								<logic:notEqual name="thread" property="fridge" value="true">
								Không
								</logic:notEqual>
							</h5>
							<h5>
								<font color="#607d8b">Gác xếp:</font>
								<logic:equal name="thread" property="attic" value="true">
								Có
								</logic:equal>
								<logic:notEqual name="thread" property="attic" value="true">
								Không
								</logic:notEqual>
							</h5>
							<h5>
								<font color="#607d8b">Camera an ninh:</font>
								<logic:equal name="thread" property="camera" value="true">
								Có
								</logic:equal>
								<logic:notEqual name="thread" property="camera" value="true">
								Không
								</logic:notEqual>
							</h5>
							<h5>
								<font color="#607d8b">Nguồn nước:</font>
								<bean:write name="thread" property="waterSource" />
							</h5>
							<h5>
								<font color="#607d8b">Số toilet:</font>
								<bean:write name="thread" property="numOfToilets" />
							</h5>
							<h5>
								<font color="#607d8b">Hướng phòng:</font>
								<bean:write name="thread" property="direction" />
							</h5>
							<h5>
								<font color="#607d8b">Tỉnh:</font>
								<bean:define id="province" name="thread" property="province"></bean:define>
								<bean:write name="province" property="name" />
							</h5>
							<h5>
								<font color="#607d8b">Quân/Huyện:</font>
								<bean:define id="district" name="thread" property="district"></bean:define>
								<bean:write name="district" property="name" />
							</h5>
							<h5>
								<font color="#607d8b">Xã:</font>
								<bean:define id="village" name="thread" property="village"></bean:define>
								<bean:write name="village" property="name" />
							</h5>
						</span>
						<!--/.Card content-->
					</div>
				</div>
			</div>
		</div>
		<!--Slide new start -->
		<div class="breadcrumb flat" style="clear: both;">
			<a style="border: 1px solid #ddd;"><i class="fa fa-home"
				aria-hidden="true" style="font-size: 35px;"></i></a> <a class="active"> Bài viết liên quan</a>
		</div>
		<div class="row">
			<div class="row">
				<!--Carousel Wrapper-->
				<logic:iterate name="viewThreadForm" property="relateThreads"
					id="threadRelated">
					<!--Card-->
					<div class=" col-lg-4 col-md-6">
						<div class="card card-cascade hoverable" style="margin-top: 40px;">
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
									class="fa fa-eye" aria-hidden="true"></i> <bean:write
										name="threadRelated" property="viewed" /></a>
								<!--Title-->
								<span
									class="score s<bean:write name="threadRelated" property="avgScoreInt" />"
									style="margin-top: -15px;"></span> (<strong
									itemprop="reviewCount"><bean:write
										name="threadRelated" property="avgScore" /></strong>)
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
										<bean:define id="name" name="threadRelated" property="name"></bean:define>
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

		</div>
		<br>
	</div>

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/jquery.raty-fa.js"></script>

	<!-- <script type="text/javascript" src="js/lightbox-plus-jquery.min.js"></script> -->

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
			$('#btnAddRate').prop('disabled', true); //TO DISABLED
			$('input[name=newScoreRate]:checked').prop('checked', false); //TO UNCHECK  
			$('input[name=newScoreRate]').prop('disabled', true); //TO DISABLED  
			email = readCookie('email');
			log(email);
			if (email != undefined && email.length > 6) {
				$('#btnAddRate').prop('disabled', false); //TO ENABLE
				$('input[name=newScoreRate]').prop('disabled', false); //TO ENABLE 
				$("#welcomeToRate").html("");	
			}else{
				$("#welcomeToRate").html("Chức năng yêu cầu đăng nhập");
			}	
			log($("#threadOld").val());
			if($("#threadOld").val() == 'true'){
				log(true + "ne");
				$('.infoThread')
				.css({
				   'filter'         : 'blur(2px)',
				   '-webkit-filter' : 'blur(2px)',
				   '-moz-filter'    : 'blur(2px)',
				   '-o-filter'      : 'blur(2px)',
				   '-ms-filter'     : 'blur(2px)'
				});
				$('#btnAddRate').prop('disabled', true); //TO DISABLEDnewContentRate
				$('#newContentRate').prop('disabled', true); //TO DISABLED
			}else if( $("#threadOld").val() != 'true' && email != undefined && email.length > 6 ){
				log(false + "ne");
				$('.infoThread')
				.css({
				   'filter'         : 'blur(0px)',
				   '-webkit-filter' : 'blur(0px)',
				   '-moz-filter'    : 'blur(0px)',
				   '-o-filter'      : 'blur(0px)',
				   '-ms-filter'     : 'blur(0px)'
				});
				$('#btnAddRate').prop('disabled', false); //TO DISABLEDnewContentRate
				$('#newContentRate').prop('disabled', false); //TO DISABLED
			}
		});
	</script>
	<script>
		function submitRate(){
			content = $("#newContentRate").val();
			score = parseInt($('input[name=newScoreRate]:checked').val());
			threadId = parseInt('<bean:write name="thread" property="threadId" />');
			email = readCookie("email");
			password = readCookie("password");
			accountId = readCookie("accountId");
			var errorStr = "";
			var erorFlag = false;
			if(content.length < 10){
				errorStr = "Nội dung phải nhiều hơn 10 kí tự";
				erorFlag = true; 
			}
			if(isNaN(score) == true){
				if(errorStr.length < 10){
					errorStr = "Chưa chọn chất lượng";
				}else{
					errorStr += ", chưa chọn chất lượng";
				}
				erorFlag = true; 
			}
			if(erorFlag == true){
				showError(errorStr);
				return false;
			}
			var rate = {
				threadId: threadId,
				content: content,
				score: score,
				accountId: accountId
			};
			log(rate);
			$.ajax({
				type : "POST",
				url : "/Mock_SE7/home-rate-action.do",
				data : "threadId=" + threadId + "&content=" + content + "&score=" + score + "&accountId=" + accountId + "&email=" + email + "&action=addNew",
				success : function(res) {
					log(res);
					var obj = JSON.parse(res);
					log(obj);
					if (obj != undefined) {
						$("#newContentRate").val("");
						$('input[name=newScoreRate]:checked').prop('checked', false);
						var n = obj.length;
						var stringResults = '';
						for (var i = 0; i < n; i++) {
							log("Dan in ra: " + i);
							stringResults +=''+
						'<div class="row">'+
							'<div class="col-sm-2 col-12">'+
							'<img src='+obj[i].accountImage+' style="height: 100px;">'+
							'</div>'+
							'<div class="col-sm-10 col-12">'+
								'<a><h3 class="user-name">'+
								obj[i].accountName +
									'</h3></a>'+
								'<div class="card-data" style="padding:0px;">'+
									'<ul>'+
										'<li class="comment-date"><i class="fa fa-commenting" aria-hidden="true"></i>'+
										'<span class="score s'+obj[i].score+'"></span>'+
										'</li>'+
										'<li class="comment-date" style="    float: right;"><i class="fa fa-clock-o"></i>'+obj[i].created+'</li>'+
									'</ul>'+
								'</div>'+
								'<p class="comment-text">'+
								obj[i].content+
								'</p>'+
							'</div>' +
						'</div>';
						}
						$('#listRate').html(stringResults);
						$('#ratesCountAjax').html(n);
					}else{
						showError("Lỗi không xác định");
					}
				},
				error : function(e) {
					showError("Lỗi không xác định " + e);
				}
			});
			
		}
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