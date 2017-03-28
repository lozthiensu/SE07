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
<bean:define id="thread" name="viewThreadForm" property="thread"></bean:define>
<title><bean:write name="thread" property="name" /> - TimTro.Com</title>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/compiled.min.css" rel="stylesheet">
<link href="css/mdb.min.css" rel="stylesheet">
<link href="css/style-view.css" rel="stylesheet">
<link href="css/lightbox.min.css" rel="stylesheet">
<link href="js/lightbox/photoswipe.css" rel="stylesheet">
</head>
<body>
	<!-- Root element of PhotoSwipe. Must have class pswp. -->
	<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

		<!-- Background of PhotoSwipe. 
         It's a separate element as animating opacity is faster than rgba(). -->
		<div class="pswp__bg"></div>

		<!-- Slides wrapper with overflow:hidden. -->
		<div class="pswp__scroll-wrap">

			<!-- Container that holds slides. 
            PhotoSwipe keeps only 3 of them in the DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on. -->
			<div class="pswp__container">
				<div class="pswp__item"></div>
				<div class="pswp__item"></div>
				<div class="pswp__item"></div>
			</div>

			<!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
			<div class="pswp__ui pswp__ui--hidden">

				<div class="pswp__top-bar">

					<!--  Controls are self-explanatory. Order can be changed. -->

					<div class="pswp__counter"></div>

					<button class="pswp__button pswp__button--close"
						title="Close (Esc)"></button>

					<button class="pswp__button pswp__button--share" title="Share"></button>

					<button class="pswp__button pswp__button--fs"
						title="Toggle fullscreen"></button>

					<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

					<!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
					<!-- element will get class pswp__preloader--active when preloader is running -->
					<div class="pswp__preloader">
						<div class="pswp__preloader__icn">
							<div class="pswp__preloader__cut">
								<div class="pswp__preloader__donut"></div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
					<div class="pswp__share-tooltip"></div>
				</div>

				<button class="pswp__button pswp__button--arrow--left"
					title="Previous (arrow left)"></button>

				<button class="pswp__button pswp__button--arrow--right"
					title="Next (arrow right)"></button>

				<div class="pswp__caption">
					<div class="pswp__caption__center"></div>
				</div>

			</div>

		</div>

	</div>
	<div
		style="
	background-image: url(<bean:write name="thread" property="imageThumb" />);
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;height: 500px;
	margin-top: 50px;
    filter: blur(30px);"></div>
	<div class="thread-content-1">

		<jsp:include page="header.jsp" />

		<nav class="navbar navbar-toggleable-md blur-bgimage fixed-top"
			id="menuBeauti" style="background: #fff">
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
					<logic:iterate name="viewThreadForm" property="categories"
						id="item">
						<li class="nav-item"><a class="nav-link btn-right-menu-main"
							href='./view-category-action.do?categoryId=<bean:write
								name="item" property="categoryId" />'>
								<i class="fa fa-folder-open-o" aria-hidden="true"></i> <bean:write
									name="item" property="name" />
						</a></li>
					</logic:iterate>
				</ul>
				<ul class="navbar-nav ml-auto">
					<img src="img/avatar.jpg" alt="Hình đại diện"
						class="rounded-circle"
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

		<!--Navbar-->
		<div class="container">
			<nav
				class="navbar navbar-toggleable-md navbar-dark green custom-nav-view-thread hidden-md-down"
				style="    margin-top: 7px;">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarNav1"
				aria-controls="navbarNav1" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav1">
				<ul class="navbar-nav mr-auto">

					<logic:iterate name="viewThreadForm" property="categories"
						id="item">
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
		<br> <br>
		<!--Navbar-->
		<div class="container-fluid">
			<div class="row"
				style="background: #fff; margin-top: 300px; position: relative; height: 150px;"></div>
		</div>
		<div class="container container-white " style="margin-top: -460px;">

			<h2 class="text-center thread-name">
				<logic:equal name="thread" property="kindOf" value="false">[TÌM] </logic:equal><bean:write name="thread" property="name" />
			</h2>
			<br>

			<div class="row">
				<div class="col-lg-9"
					style="background: #fff; border-top-left-radius: 5px; border-top-right-radius: 5px;">
					<div class="breadcrumb flat" style="width: 100%; margin-top: 10px;">
						<a style="border: 1px solid #ddd;"><i class="fa fa-home"
							aria-hidden="true" style="font-size: 35px;"></i></a> <a
							class="active" href="#"> Thông tin chi tiết</a>
					</div>
					<div class="infoThread">
						<div id="card-1" class="card-rotating effect__click">
							<!--Back Side-->
							<br> <br> <br>
							<div class="text-left">
								<!--Content-->
								<p>
									<bean:write name="thread" property="content" filter="false" />
								</p>
							</div>
							<!--/.Back Side-->
							<div class="row">
								<div id="demo-test-gallery" class="demo-gallery">
									<logic:iterate name="viewThreadForm" property="images"
										id="item">
										<a
											href="<bean:write
											name="item" property="src" />"
											data-size="1600x1600"
											data-med="<bean:write
											name="item" property="src" />"
											data-med-size="1600x1024"
											data-author="<bean:write
											name="item" property="content" />"
											class="demo-gallery__img--main"> <img
											src="<bean:write
											name="item" property="src" />"
											alt="" class="col-3" />
										</a>
									</logic:iterate>
								</div>
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
									<p class="text-center" id="welcomeToRate">(Chức năng yêu
										cầu đăng nhập)</p>

									<!--Third row-->
									<div class="row">
										<!--Image column-->
										<div class="col-sm-2 col-12">
											<img src="image/avatar.jpg" style="height: 100px;"
												id="imgAvaCMT">
										</div>
										<!--/.Image column-->

										<!--Content column-->
										<div class="col-sm-10 col-12">
											<div class="md-form">
												<textarea type="text" id="newContentRate"
													class="md-textarea" length="200" maxlength="200"></textarea>
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
															value="3"> <label for="radio3">Bình
															thường</label>
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
											<button class="btn btn-primary"
												onclick="return submitRate();" id="btnAddRate">Gửi
												bình luận</button>
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
								<div class="row"
									id="rate-<bean:write name="item" property="rateId" />">
									<!--Image column-->
									<div class="col-sm-2 col-12">
										<img src="<bean:write name="item" property="accountImage" />"
											style="height: 100px;">
									</div>
									<!--/.Image column-->
									<!--Content column-->
									<div class="col-sm-10 col-12">
										<div>
											<span style="font-size: 30px;" class="user-name"> <bean:write
													name="item" property="accountName" />
											</span>
											<logic:equal name="item" property="can" value="true">
												<span class="rate-button-func"
													onclick="deleteRate(<bean:write name="item" property="rateId" />)">
													<i class="fa fa-times red-text icon-btn-action"></i>
												</span>
												<span class="rate-button-func"
													onclick="editRate(<bean:write name="item" property="rateId" />)">
													<i class="fa fa-pencil-square-o grey-text icon-btn-action"></i>
												</span>
											</logic:equal>
										</div>
										<div class="card-data" style="padding: 0px;">
											<ul>
												<li class="comment-date"><span
													class="score s<bean:write name="item" property="score" />"></span>
												</li>
												<li class="comment-date" style="float: right;"><i
													class="fa fa-clock-o"></i> <bean:write name="item"
														property="created" /></li>
											</ul>
										</div>
										<p class="comment-text"
											id="content-rate-<bean:write name="item" property="rateId" />"
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

					<input style="display: none;" id="threadOld"
						value="<bean:write name="thread" property="old" />"></input>
					<div class="text-center">
						<logic:equal name="thread" property="old" value="true">
							<button type="button"
								class="btn btn-danger waves-effect waves-light">
								<b>Tin đã quá lâu</b>
							</button>
						</logic:equal>
						<logic:equal name="thread" property="old" value="false">
							<button type="button"
								class="btn btn-success waves-effect waves-light">
								<b>Tin còn hạn</b>
							</button>
						</logic:equal>
					</div>
					<br> <br> <br> <br> <br>
					<div class="card card-cascade hoverable" style="margin-top: 0px;">
						<div class="row infoThread">
							<!--Image column-->
							<div class="col-md-12 col-12 ">
								<div class=" thread-avatar">
									<img src="<bean:write name="thread" property="avatar" />"
										style="height: 200px; width: 200px; border-radius: 50%; border: 10px solid #fff; box-shadow: 0px 0px 5px 0 rgba(0, 0, 0, .16), 0px 0px 5px 0 rgba(0, 0, 0, .12);">
								</div>
							</div>
						</div>
						<!--/Card image-->
						<!--Card content-->
						<div class="card-block text-center infoThread"
							style="margin-top: 0px;">
							<!--Title-->
							<h5 class="card-title">
								<strong><bean:write name="thread" property="phone" />
								</strong>
							</h5>
							<h5 class="card-title">
								<strong><bean:write name="thread" property="email" />
								</strong>
							</h5>
							<br>
							<h4 class="card-title">
								<strong>Giá: <bean:write name="thread"
										property="priceString" />
								</strong>
							</h4>
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
									<bean:write name="thread" property="electricFeeString" />/kí
								</h5>
								<h5>
									<font color="#607d8b">Giá nước:</font>
									<bean:write name="thread" property="waterFeeString" />/m&sup3;
								</h5>
								<h5>
									<font color="#607d8b">Phụ phí:</font>
									<bean:write name="thread" property="otherFeeString" />
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
									<bean:write name="thread" property="waterSourceString" />
								</h5>
								<h5>
									<font color="#607d8b">Số toilet:</font>
									<bean:write name="thread" property="numOfToilets" />
								</h5>
								<h5>
									<font color="#607d8b">Số người:</font>
									<bean:write name="thread" property="numOfPeople" />
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
					aria-hidden="true" style="font-size: 35px;"></i></a> <a class="active">
					Bài viết liên quan</a>
			</div>
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
							<div class="card-block   card-block-tren">
								<!--Social shares button-->
								<a class="activator" style="margin-top: -5px;"><i
									class="fa fa-eye" aria-hidden="true"></i> <bean:write
										name="threadRelated" property="viewed" /></a>
								<!--Title-->
								<span
									class="score s<bean:write name="threadRelated" property="avgScoreInt" />"
									style="margin-top: -15px;"></span> (<strong
									itemprop="reviewCount"><bean:write
										name="threadRelated" property="avgScore" /></strong>)
							</div>
							<div class="card-block text-center" style="margin-top: 0px;">
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
								<bean:define id="threadId" name="threadRelated"
									property="threadId"></bean:define>
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
			<br>
		</div>

		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/tether.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/mdb.min.js"></script>
		<script type="text/javascript" src="js/lightbox/photoswipe.min.js"></script>
		<script type="text/javascript"
			src="js/lightbox/photoswipe-ui-default.min.js"></script>

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
					$("#menuBeauti").css("background-color", "rgba(255,255,255,1)");
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
			stick();
			$('#btnAddRate').prop('disabled', true); //TO DISABLED
			$('input[name=newScoreRate]:checked').prop('checked', false); //TO UNCHECK  
			$('input[name=newScoreRate]').prop('disabled', true); //TO DISABLED  
			$('#newContentRate').attr('maxlength', '200'); 
			email = readCookie('email');
			if (email != undefined && email.length > 6) {
				$('#btnAddRate').prop('disabled', false); //TO ENABLE
				$('input[name=newScoreRate]').prop('disabled', false); //TO ENABLE 
				$("#welcomeToRate").html("");	
			}else{
				$("#welcomeToRate").html("Chức năng yêu cầu đăng nhập");
			}	
			if($("#threadOld").val() == 'true'){
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
					if (res == "success") {
						getRates();
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
		function getRates(){
			threadId = parseInt('<bean:write name="thread" property="threadId" />');
			$.ajax({
				type : "POST",
				url : "/Mock_SE7/home-rate-action.do",
				data : "threadId=" + threadId + "&action=get",
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
							deleteBtn = "";
							if(obj[i].can == true){
								deleteBtn = '<span class="rate-button-func"'+
								'onclick="deleteRate('+ obj[i].rateId +')">'+
								'<i class="fa fa-times red-text icon-btn-action"></i>'+
							'</span><span class="rate-button-func" onclick="editRate('+obj[i].rateId+')"> <i class="fa fa-pencil-square-o grey-text icon-btn-action"></i></span>';
							}
							log("Dan in ra: " + i);
							stringResults +=''+
						'<div id="rate-'+obj[i].rateId+'" class="row">'+
							'<div class="col-sm-2 col-12">'+
							'<img src='+obj[i].accountImage+' style="height: 100px;">'+
							'</div>'+
							'<div class="col-sm-10 col-12">'+
								'<div>'+
									'<span style="font-size: 30px;" class="user-name">' + obj[i].accountName +
									'</span>'+
									deleteBtn +
								'</div>'+
								'<div class="card-data" style="padding:0px;">'+
									'<ul>'+
										'<li class="comment-date">'+
										'<span class="score s'+obj[i].score+'"></span>'+
										'</li>'+
										'<li class="comment-date" style=" float: right;"><i class="fa fa-clock-o"></i>'+obj[i].created+'</li>'+
									'</ul>'+
								'</div>'+
								'<p p class="comment-text" id="content-rate-'+obj[i].rateId+'" style="word-wrap: break-word; word-break: break-all;">' + obj[i].content+
								'</p>'+
							'</div>' +
						'</div>';
						}
						log(stringResults)
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
		function deleteRate(rateId){
			swal({
				  title: "Bạn có chắc?",
				  text: "Dữ liệu bị xóa sẽ mất vĩnh viễn!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "Đồng ý!",
				  closeOnConfirm: true
				},
				function(){
					threadId = parseInt('<bean:write name="thread" property="threadId" />');
					$.ajax({
						type : "POST",
						url : "/Mock_SE7/home-rate-action.do",
						data : "rateId=" + rateId + "&threadId=" + threadId + "&action=delete",
						success : function(res) {
							log(res);
							if (res == "success") {
								getRates();
							}else{
								showError("Lỗi không xác định");
							}
						},
						error : function(e) {
							showError("Lỗi không xác định " + e);
						}
					});
				});
		}

		function editRate(rateId){
		    var divHtml = $('#content-rate-' + rateId ).html().trim();
		    log(';' + divHtml + 'a');
		    if(divHtml != null && divHtml.length > 1){
			    var editableText = $('<div class="md-form" id="rate-'+rateId+'" ><textarea id="content-rate-'+rateId+'"  type="text" class="md-textarea" length="200" maxlength="200"></textarea><label for="form8">Nội dung</label><div class="text-center"><button class="btn btn-primary" onclick="return submitEdit('+rateId+');" >Sửa</button><button class="btn btn-primary" onclick="return cancelEdit('+rateId+');" >Hủy</button></div></div>');
			    $('#content-rate-' + rateId ).replaceWith(editableText);
			    $('#content-rate-' + rateId ).val(divHtml);
			    $('#content-rate-' + rateId ).focus();
		    }
		}

		function submitEdit(rateId){
		    content = $('#content-rate-' + rateId ).val().trim();
		    log(';' + content + 'a');
			$.ajax({
				type : "POST",
				url : "/Mock_SE7/home-rate-action.do",
				data : "rateId=" + rateId + "&content=" + content + "&action=update",
				success : function(res) {
					log(res);
					if (res == "success") {
						getRates();
					}else{
						showError("Lỗi không xác định");
					}
				},
				error : function(e) {
					showError("Lỗi không xác định " + e);
				}
			});
		}
		
		function cancelEdit(rateId){
		    var html = $('#content-rate-' + rateId ).val();
		    log(html + "ádasd");
		    var viewableText = $('<p class="comment-text" id="content-rate-'+rateId+'" style="word-wrap: break-word; word-break: break-all;"></p>');
		    $('#rate-' + rateId ).replaceWith(viewableText);
		    $('#content-rate-' + rateId ).html(html);
		}

		function initialize() {
			initPano();
			initMap();
		}
	</script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-H_xa-vjvVRk59cgxAFSBHwj2huBV-B4&callback=initialize">
		
	</script>
		<script type="text/javascript">
    (function() {

		var initPhotoSwipeFromDOM = function(gallerySelector) {

			var parseThumbnailElements = function(el) {
			    var thumbElements = el.childNodes,
			        numNodes = thumbElements.length,
			        items = [],
			        el,
			        childElements,
			        thumbnailEl,
			        size,
			        item;

			    for(var i = 0; i < numNodes; i++) {
			        el = thumbElements[i];

			        // include only element nodes 
			        if(el.nodeType !== 1) {
			          continue;
			        }

			        childElements = el.children;

			        size = el.getAttribute('data-size').split('x');

			        // create slide object
			        item = {
						src: el.getAttribute('href'),
						w: parseInt(size[0], 10),
						h: parseInt(size[1], 10),
						author: el.getAttribute('data-author')
			        };

			        item.el = el; // save link to element for getThumbBoundsFn

			        if(childElements.length > 0) {
			          item.msrc = childElements[0].getAttribute('src'); // thumbnail url
			          if(childElements.length > 1) {
			              item.title = childElements[1].innerHTML; // caption (contents of figure)
			          }
			        }


					var mediumSrc = el.getAttribute('data-med');
		          	if(mediumSrc) {
		            	size = el.getAttribute('data-med-size').split('x');
		            	// "medium-sized" image
		            	item.m = {
		              		src: mediumSrc,
		              		w: parseInt(size[0], 10),
		              		h: parseInt(size[1], 10)
		            	};
		          	}
		          	// original image
		          	item.o = {
		          		src: item.src,
		          		w: item.w,
		          		h: item.h
		          	};

			        items.push(item);
			    }

			    return items;
			};

			// find nearest parent element
			var closest = function closest(el, fn) {
			    return el && ( fn(el) ? el : closest(el.parentNode, fn) );
			};

			var onThumbnailsClick = function(e) {
			    e = e || window.event;
			    e.preventDefault ? e.preventDefault() : e.returnValue = false;

			    var eTarget = e.target || e.srcElement;

			    var clickedListItem = closest(eTarget, function(el) {
			        return el.tagName === 'A';
			    });

			    if(!clickedListItem) {
			        return;
			    }

			    var clickedGallery = clickedListItem.parentNode;

			    var childNodes = clickedListItem.parentNode.childNodes,
			        numChildNodes = childNodes.length,
			        nodeIndex = 0,
			        index;

			    for (var i = 0; i < numChildNodes; i++) {
			        if(childNodes[i].nodeType !== 1) { 
			            continue; 
			        }

			        if(childNodes[i] === clickedListItem) {
			            index = nodeIndex;
			            break;
			        }
			        nodeIndex++;
			    }

			    if(index >= 0) {
			        openPhotoSwipe( index, clickedGallery );
			    }
			    return false;
			};

			var photoswipeParseHash = function() {
				var hash = window.location.hash.substring(1),
			    params = {};

			    if(hash.length < 5) { // pid=1
			        return params;
			    }

			    var vars = hash.split('&');
			    for (var i = 0; i < vars.length; i++) {
			        if(!vars[i]) {
			            continue;
			        }
			        var pair = vars[i].split('=');  
			        if(pair.length < 2) {
			            continue;
			        }           
			        params[pair[0]] = pair[1];
			    }

			    if(params.gid) {
			    	params.gid = parseInt(params.gid, 10);
			    }

			    return params;
			};

			var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
			    var pswpElement = document.querySelectorAll('.pswp')[0],
			        gallery,
			        options,
			        items;

				items = parseThumbnailElements(galleryElement);

			    // define options (if needed)
			    options = {

			        galleryUID: galleryElement.getAttribute('data-pswp-uid'),

			        getThumbBoundsFn: function(index) {
			            // See Options->getThumbBoundsFn section of docs for more info
			            var thumbnail = items[index].el.children[0],
			                pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
			                rect = thumbnail.getBoundingClientRect(); 

			            return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
			        },

			        addCaptionHTMLFn: function(item, captionEl, isFake) {
						if(!item.title) {
							captionEl.children[0].innerText = '';
							return false;
						}
						captionEl.children[0].innerHTML = item.title +  '<br/><small>Photo: ' + item.author + '</small>';
						return true;
			        }
					
			    };


			    if(fromURL) {
			    	if(options.galleryPIDs) {
			    		// parse real index when custom PIDs are used 
			    		// http://photoswipe.com/documentation/faq.html#custom-pid-in-url
			    		for(var j = 0; j < items.length; j++) {
			    			if(items[j].pid == index) {
			    				options.index = j;
			    				break;
			    			}
			    		}
				    } else {
				    	options.index = parseInt(index, 10) - 1;
				    }
			    } else {
			    	options.index = parseInt(index, 10);
			    }

			    // exit if index not found
			    if( isNaN(options.index) ) {
			    	return;
			    }



				var radios = document.getElementsByName('gallery-style');
				for (var i = 0, length = radios.length; i < length; i++) {
				    if (radios[i].checked) {
				        if(radios[i].id == 'radio-all-controls') {

				        } else if(radios[i].id == 'radio-minimal-black') {
				        	options.mainClass = 'pswp--minimal--dark';
					        options.barsSize = {top:0,bottom:0};
							options.captionEl = false;
							options.fullscreenEl = false;
							options.shareEl = false;
							options.bgOpacity = 0.85;
							options.tapToClose = true;
							options.tapToToggleControls = false;
				        }
				        break;
				    }
				}

			    if(disableAnimation) {
			        options.showAnimationDuration = 0;
			    }

			    // Pass data to PhotoSwipe and initialize it
			    gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);

			    // see: http://photoswipe.com/documentation/responsive-images.html
				var realViewportWidth,
				    useLargeImages = false,
				    firstResize = true,
				    imageSrcWillChange;

				gallery.listen('beforeResize', function() {

					var dpiRatio = window.devicePixelRatio ? window.devicePixelRatio : 1;
					dpiRatio = Math.min(dpiRatio, 2.5);
				    realViewportWidth = gallery.viewportSize.x * dpiRatio;


				    if(realViewportWidth >= 1200 || (!gallery.likelyTouchDevice && realViewportWidth > 800) || screen.width > 1200 ) {
				    	if(!useLargeImages) {
				    		useLargeImages = true;
				        	imageSrcWillChange = true;
				    	}
				        
				    } else {
				    	if(useLargeImages) {
				    		useLargeImages = false;
				        	imageSrcWillChange = true;
				    	}
				    }

				    if(imageSrcWillChange && !firstResize) {
				        gallery.invalidateCurrItems();
				    }

				    if(firstResize) {
				        firstResize = false;
				    }

				    imageSrcWillChange = false;

				});

				gallery.listen('gettingData', function(index, item) {
				    if( useLargeImages ) {
				        item.src = item.o.src;
				        item.w = item.o.w;
				        item.h = item.o.h;
				    } else {
				        item.src = item.m.src;
				        item.w = item.m.w;
				        item.h = item.m.h;
				    }
				});

			    gallery.init();
			};

			// select all gallery elements
			var galleryElements = document.querySelectorAll( gallerySelector );
			for(var i = 0, l = galleryElements.length; i < l; i++) {
				galleryElements[i].setAttribute('data-pswp-uid', i+1);
				galleryElements[i].onclick = onThumbnailsClick;
			}

			// Parse URL and open gallery if it contains #&pid=3&gid=1
			var hashData = photoswipeParseHash();
			if(hashData.pid && hashData.gid) {
				openPhotoSwipe( hashData.pid,  galleryElements[ hashData.gid - 1 ], true, true );
			}
		};

		initPhotoSwipeFromDOM('.demo-gallery');

	})();

	</script>

	</div>
</body>

</html>