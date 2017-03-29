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
<title>Tìm kiếm phòng trọ online chính xác</title>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/compiled.min.css" rel="stylesheet">
<link href="css/mdb.min.css" rel="stylesheet">
<link href="css/style-view.css" rel="stylesheet">
<style>
#map {
	height: calc(100vh - 100px);
}

#description {
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
}

#infowindow-content .title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}

.pac-card {
	margin: 10px 10px 0 0;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	font-family: Roboto;
}

#pac-container {
	padding-bottom: 12px;
	margin-right: 12px;
}

.pac-controls {
	display: inline-block;
	padding: 5px 11px;
}

.pac-controls label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: #4d90fe;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}
</style>
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

					<div style="display: table; margin: 0 auto;">
						<fieldset class="form-group">
							<input type="radio" id="kindOf" name="kindOf" value="true"
								checked="true" /> <label for="kindOf">Cho thuê phòng</label> <input
								type="radio" id="kindOf2" name="kindOf" value="false" /> <label
								for="kindOf2">Đi tìm phòng</label>
						</fieldset>
					</div>
					<div class="col-lg-12">
						<div class="md-form">
							<input type="text" id="name" class="form-control validate"
								length="250"> <label for="name" data-error="wrong"
								data-success="right">Nhập từ khóa</label>
						</div>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="wifi" onchange="doAjaxPost()">
							<label for="wifi">Wifi/Mạng</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="waterHeater" onchange="doAjaxPost()">
							<label for="waterHeater">Máy nước nóng</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="conditioner" onchange="doAjaxPost()">
							<label for="conditioner">Điều hòa</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="fridge" onchange="doAjaxPost()">
							<label for="fridge">Tủ lạnh</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="attic" onchange="doAjaxPost()">
							<label for="attic">Gác xếp</label>
						</fieldset>
					</div>
					<div class="col-lg-3">
						<fieldset class="form-group">
							<input type="checkbox" id="camera" onchange="doAjaxPost()">
							<label for="camera">Camera an ninh</label>
						</fieldset>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3">
						<html:select name="searchForm" property="categoryId"
							styleClass="mdb-select" styleId="slbCategory"
							onchange="doAjaxPost()">
							<option value="" selected>Không</option>
							<logic:iterate name="searchForm" property="categories" id="item">
								<bean:define id="id" name="item" property="categoryId" />
								<html:option value="${id}">
									<bean:write name="item" property="name" />
								</html:option>
							</logic:iterate>
						</html:select>
						<label>Danh mục</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="waterSource"
							onchange="doAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">Giếng đào</option>
							<option value="2">Giếng đóng-khoan</option>
							<option value="3">Nước máy</option>
							<option value="4">Không xác định</option>
						</select> <label>Nguồn nước</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="object" onchange="doAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">Nam</option>
							<option value="1">Nữ</option>
							<option value="2">Không xác định</option>
						</select> <label>Đối tượng</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="area" onchange="doAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 15 m&#178;</option>
							<option value="2">15 - 25 m&#178;</option>
							<option value="3">25 - 35 m&#178;</option>
							<option value="4">35 - 50 m&#178;</option>
							<option value="5">&gt; 50 m&#178;</option>
						</select> <label>Diện tích</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="price" onchange="doAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 500.000 VNĐ</option>
							<option value="2">500.000 VNĐ - 1000.000 VNĐ</option>
							<option value="3">1000.000 VNĐ - 1500.000 VNĐ</option>
							<option value="4">1500.000 VNĐ - 2500.000 VNĐ</option>
							<option value="5">2500.000 VNĐ - 5000.000 VNĐ</option>
							<option value="6">&gt; 5000.000 VNĐ</option>
						</select> <label>Giá phòng</label>
					</div>
					<div class="col-lg-3">
						<html:select name="searchForm" property="provinceId"
							styleClass="mdb-select" styleId="slbProvince"
							onchange="doAjaxPost()">
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
						<select name="districtId" class="mdb-select" id="slbDistrict"
							onchange="doAjaxPost()">
							<option value="" selected>Không</option>
						</select> <label>Quận/Huyện</label>
					</div>
					<div class="col-lg-3">
						<select name="villageId" class="mdb-select" id="slbVillage"
							onchange="doAjaxPost()">
							<option value="" selected>Không</option>
						</select> <label>Làng/Xã</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="far" onchange="checkDoAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 500 m</option>
							<option value="2">&lt; 1500 m</option>
							<option value="3">&lt; 3000 m</option>
							<option value="4">&lt; 6000 m</option>
							<option value="5">&lt; 10000 m</option>
							<option value="6">&lt; 20000 m</option>
						</select> <label>Phạm vi</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="numOfToilets" onchange="checkDoAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 2 cái</option>
							<option value="2">2 - 5 cái</option>
							<option value="3">5 - 10 cái</option>
							<option value="4">10 - 20 cái</option>
							<option value="5">&gt; 20 cái</option>
						</select> <label>Số toilet</label>
					</div>
					<div class="col-lg-3">
						<select class="mdb-select" id="numOfPeople" onchange="checkDoAjaxPost()">
							<option value="0" selected>Không</option>
							<option value="1">&lt; 2 người</option>
							<option value="2">2 - 5 người</option>
							<option value="3">5 - 10 người</option>
							<option value="4">10 - 20 người</option>
							<option value="5">&gt; 20 người</option>
						</select> <label>Số người cho phép</label>
					</div>
					<div class="col-lg-12">
						<div class="pac-card" id="pac-card">
							<div>
								<div id="title">Autocomplete search</div>
								<div id="type-selector" class="pac-controls">
									<input type="radio" name="type" id="changetype-all"
										checked="checked"> <label for="changetype-all">All</label>
									<input type="radio" name="type" id="changetype-establishment">
									<label for="changetype-establishment">Establishments</label> <input
										type="radio" name="type" id="changetype-address"> <label
										for="changetype-address">Addresses</label> <input type="radio"
										name="type" id="changetype-geocode"> <label
										for="changetype-geocode">Geocodes</label>
								</div>
								<div id="strict-bounds-selector" class="pac-controls">
									<input type="checkbox" id="use-strict-bounds" value="">
									<label for="use-strict-bounds">Strict Bounds</label>
								</div>
							</div>
							<div id="pac-container">
								<input id="pac-input" type="text" placeholder="Enter a location">
							</div>
						</div>
					</div>
					<div id="map"></div>
					<div id="infowindow-content">
						<img src="" width="16" height="16" id="place-icon"> <span
							id="place-name" class="title"></span> <br> <span
							id="place-address"></span>
					</div>
					<script>
						var map = null;
						var markers = [];
						// This example requires the Places library. Include the libraries=places
						// parameter when you first load the API. For example:
						// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
						function initMap() {
							map = new google.maps.Map(document
									.getElementById('map'), {
								center : {
									lat : 15.9782827,
									lng : 108.2631494
								},
								zoom : 16
							});
							var card = document.getElementById('pac-card');
							var input = document.getElementById('pac-input');
							var types = document
									.getElementById('type-selector');
							var strictBounds = document
									.getElementById('strict-bounds-selector');
							map.controls[google.maps.ControlPosition.TOP_RIGHT]
									.push(card);
							var autocomplete = new google.maps.places.Autocomplete(
									input);
							// Bind the map's bounds (viewport) property to the autocomplete object,
							// so that the autocomplete requests use the current map bounds for the
							// bounds option in the request.
							autocomplete.bindTo('bounds', map);
							var infowindow = new google.maps.InfoWindow();
							var infowindowContent = document
									.getElementById('infowindow-content');
							infowindow.setContent(infowindowContent);
							var marker = new google.maps.Marker({
								map : map,
								anchorPoint : new google.maps.Point(0, -29)
							});
							autocomplete
									.addListener(
											'place_changed',
											function() {
												infowindow.close();
												marker.setVisible(false);
												var place = autocomplete
														.getPlace();
												if (!place.geometry) {
													// User entered the name of a Place that was not suggested and
													// pressed the Enter key, or the Place Details request failed.
													window
															.alert("No details available for input: '"
																	+ place.name
																	+ "'");
													return;
												}
												// If the place has a geometry, then present it on a map.
												if (place.geometry.viewport) {
													map
															.fitBounds(place.geometry.viewport);
												} else {
													map
															.setCenter(place.geometry.location);
													map.setZoom(17); // Why 17? Because it looks good.
												}
												marker
														.setPosition(place.geometry.location);
												log(place.geometry.location
														.lat()
														+ " "
														+ place.geometry.location
																.lng());
												createCookie("lat",
														place.geometry.location
																.lat(), 1);
												createCookie("lng",
														place.geometry.location
																.lng(), 1);
												marker.setVisible(true);
												var address = '';
												if (place.address_components) {
													address = [
															(place.address_components[0]
																	&& place.address_components[0].short_name || ''),
															(place.address_components[1]
																	&& place.address_components[1].short_name || ''),
															(place.address_components[2]
																	&& place.address_components[2].short_name || '') ]
															.join(' ');
												}
												infowindowContent.children['place-icon'].src = place.icon;
												infowindowContent.children['place-name'].textContent = place.name;
												infowindowContent.children['place-address'].textContent = address;
												infowindow.open(map, marker);
											});
							// Sets a listener on a radio button to change the filter type on Places
							// Autocomplete.
							function setupClickListener(id, types) {
								var radioButton = document.getElementById(id);
								radioButton.addEventListener('click',
										function() {
											autocomplete.setTypes(types);
										});
							}
							setupClickListener('changetype-all', []);
							setupClickListener('changetype-address',
									[ 'address' ]);
							setupClickListener('changetype-establishment',
									[ 'establishment' ]);
							setupClickListener('changetype-geocode',
									[ 'geocode' ]);
							document
									.getElementById('use-strict-bounds')
									.addEventListener(
											'click',
											function() {
												console
														.log('Checkbox clicked! New state='
																+ this.checked);
												autocomplete.setOptions({
													strictBounds : this.checked
												});
											});
						}
					</script>
					<script
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-H_xa-vjvVRk59cgxAFSBHwj2huBV-B4&libraries=places&callback=initMap"
						async defer></script>

				</div>


			</div>
			<!--/.Card-->
		</div>
		<br> <br> <br>
		<!--/.Carousel Wrapper-->
		<!--/.Navbar-->
		<div class="breadcrumb flat">
			<a style="border: 1px solid #ddd;"><i class="fa fa-home"
				aria-hidden="true" style="font-size: 35px;"></i></a> <a class="active">
				Kết quả tìm kiếm</a>
		</div>
		<div class="col-lg-12">
			<div class="row" id="resultThreads"></div>
			<br> <br> <br>
			<div style="display: table; margin: 0 auto;" id="pagination"></div>
		</div>
	</div>

	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>

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
					$("#menuBeauti").css("background-color",
							"rgba(255,255,255,1)");
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
		$(document)
				.ready(
						function() {
							stick();
							createCookie('page', 1, 1);
							$('.mdb-select').material_select();
							$('#slbProvince')
									.on(
											"change",
											function() {
												var provinceId = $(this).val();
												log(provinceId);
												var str = "action=getDistrict"
														+ "&provinceId="
														+ provinceId;
												log("POST: " + str);
												$
														.ajax({
															type : "POST",
															url : "/Mock_SE7/search-thread.do",
															data : str,
															success : function(
																	response) {
																log("RES: "
																		+ response);
																var districts = JSON
																		.parse(response);
																if (districts != undefined) {
																	var n = districts.length;
																	var stringResults = '<option value="" selected>Không</option>';
																	for (var i = 0; i < n; i++) {
																		stringResults += '<option value="'+districts[i].districtId+'">'
																				+ districts[i].name
																				+ '</option>';
																	}
																	$(
																			'#slbDistrict')
																			.html(
																					stringResults);
																	$(
																			'#slbDistrict')
																			.material_select();

																	$(
																			'#slbVillage')
																			.html(
																					'<option value="" selected>Không</option>');
																	$(
																			'#slbVillage')
																			.material_select();
																}
															},
															error : function(e) {
																alert('Error: '
																		+ e);
															}
														});
											});
							$('#slbDistrict')
									.on(
											"change",
											function() {
												var districtId = $(this).val();
												log(districtId);
												var str = "action=getVillage"
														+ "&districtId="
														+ districtId;
												log("POST: " + str);
												$
														.ajax({
															type : "POST",
															url : "/Mock_SE7/search-thread.do",
															data : str,
															success : function(
																	response) {
																log("RES: "
																		+ response);
																var villages = JSON
																		.parse(response);
																if (villages != undefined) {
																	var n = villages.length;
																	var stringResults = '<option value="" selected>Không</option>';
																	for (var i = 0; i < n; i++) {
																		stringResults += '<option value="'+villages[i].villageId+'">'
																				+ villages[i].name
																				+ '</option>';
																	}
																	$(
																			'#slbVillage')
																			.html(
																					stringResults);
																	$(
																			'#slbVillage')
																			.material_select();
																}
															},
															error : function(e) {
																alert('Error: '
																		+ e);
															}
														});
											});
						});
		function viewPage(page) {
			createCookie('page', page, 1);
			doAjaxPost();
		}
		$('#name').autocomplete(
				{
					lookup : function(query, done) {

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
						categoryId = $('#slbCategory').val();
						numOfToilets = $('#numOfToilets').val();
						numOfPeople = $('#numOfPeople').val();
						name = $("#name").val();
						lat = readCookie('lat');
						lng = readCookie('lng');
						kindOf = $('#kindOf').is(':checked');
						if (kindOf == true) {
							kindOf = "true";
						} else {
							kindOf = "false";
						}
						var str = "action=autocomplete" + "&wifi=" + wifi + "&waterHeater="
						+ waterHeater + "&conditioner=" + conditioner + "&fridge="
						+ fridge + "&attic=" + attic + "&camera=" + camera
						+ "&object=" + object + "&waterSource=" + waterSource
						+ "&categoryId=" + categoryId + "&area=" + area + "&price="
						+ price + "&far=" + far + "&lat=" + lat + "&lng=" + lng
						+ "&provinceId=" + provinceId + "&kindOf=" + kindOf
						+ "&districtId=" + districtId + "&villageId=" + villageId
						+ "&name=" + name + "&numOfToilets=" + numOfToilets + "&numOfPeople=" + numOfPeople + "&page=1";
						$.ajax({
							type : "POST",
							url : "/Mock_SE7/search-thread.do",
							data : str,
							success : function(res) {
								result = JSON.parse(res);
								done(result);
							},
							error : function(e) {
								alert('Error: ' + e);
							}
						});
					},
					onSelect : function(suggestion) {
						doAjaxPost();
						log('You selected: ' + suggestion.value + ', '
								+ suggestion.data);
					}
				});
		$("#name").focusout(function() {
			doAjaxPost();
		});
		function checkDoAjaxPost() {
			lat = readCookie('lat');
			lng = readCookie('lng');
			if(lat == null || lng == null){
				showError("Bạn chưa chỉ định địa chỉ trên googlemap");
				$('#far').val("0");
			}else{
				doAjaxPost();
			}
		}
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
			categoryId = $('#slbCategory').val();
			numOfToilets = $('#numOfToilets').val();
			numOfPeople = $('#numOfPeople').val();
			name = $("#name").val();
			page = parseInt(readCookie('page'));
			lat = readCookie('lat');
			lng = readCookie('lng');
			kindOf = $('#kindOf').is(':checked');
			log(kindOf);
			if (kindOf == true) {
				kindOf = "true";
			} else {
				kindOf = "false";
			}
			var str = "action=search" + "&wifi=" + wifi + "&waterHeater="
					+ waterHeater + "&conditioner=" + conditioner + "&fridge="
					+ fridge + "&attic=" + attic + "&camera=" + camera
					+ "&object=" + object + "&waterSource=" + waterSource
					+ "&categoryId=" + categoryId + "&area=" + area + "&price="
					+ price + "&far=" + far + "&lat=" + lat + "&lng=" + lng
					+ "&provinceId=" + provinceId + "&kindOf=" + kindOf
					+ "&districtId=" + districtId + "&villageId=" + villageId
					+ "&name=" + name + "&numOfToilets=" + numOfToilets + "&numOfPeople=" + numOfPeople + "&page=" + page;
			log("Post " + str);
			$
					.ajax({
						type : "POST",
						url : "/Mock_SE7/search-thread.do",
						data : str,
						success : function(response) {
							//++page;
							createCookie('page', page, 1);
							//log("Res " + response);
							var threads = JSON.parse(response);
							if (threads != undefined) {

								while (markers.length) {
									markers.pop().setMap(null);
								}
								/* START MAKER */

								var infowindow = new google.maps.InfoWindow();

								var marker, i;

								for (i = 0; i < threads.length; i++) {
									marker = new google.maps.Marker({
										position : new google.maps.LatLng(
												threads[i].latitude,
												threads[i].longitude),
										map : map,
										icon : './img/green-dot.png'
									});
									markers.push(marker);

									google.maps.event
											.addListener(
													marker,
													'click',
													(function(marker, i) {
														return function() {
															infowindow
																	.setContent('<div class="col-md-12"><div class="card card-cascade hoverable"style="margin-top: 40px;"><div class="view overlay hm-white-slight"style="margin-top: -15px; width: 90%; margin-left: 5%; min-height: 200px; max-height: 200px;"><img class="img-fluid"src="'+threads[i].imageThumb+'"style="border-radius: 3px; width: auto; min-height: 200px;"style=" "><div class="mask waves-effect waves-light"></div></div><div class="card-block  card-block-tren"><a class="activator" style="margin-top: -5px;"><i class="fa fa-eye" aria-hidden="true"></i> '
																			+ threads[i].viewed
																			+ '</a><span class="score s'+threads[i].avgScoreInt+'" style="margin-top: -15px;"></span> (<strong itemprop="reviewCount">'
																			+ threads[i].avgScore
																			+ '</strong>)</div><div class="card-block text-center" style="margin-top: 0px;"><h4 class="card-title"><strong><i class="fa fa-money" style="font-size:25px;color:#000"></i> '
																			+ threads[i].priceString
																			+ '</strong></h4><h5><i class="fa fa-area-chart" style="font-size:16px;color:#000"></i> '
																			+ threads[i].area
																			+ 'm&#178;</h5><p class="card-text truncase-detail">'
																			+ threads[i].name
																			+ '</p><a class="btn btn-success btn-fb" href="./view-thread-action.do?threadId='
																			+ threads[i].threadId
																			+ '">Xem</a><a type="button" onclick="addToCompare('
																			+ threads[i].threadId
																			+ ','
																			+ "'"
																			+ threads[i].name
																			+ "'"
																			+ ')" class="btn-floating btn-small btn-fb"><i class="fa fa-compress"></i></a></div></div></div>');
															infowindow
																	.open(map,
																			marker);
														}
													})(marker, i));
								}

								/* END MAKER */

								var n = threads.length;
								var stringResults = '';
								for (var i = 0; i < n; i++) {
									stringResults += '<div class=" col-lg-4 col-md-6"><div class="card card-cascade hoverable"style="margin-top: 40px;"><div class="view overlay hm-white-slight"style="margin-top: -15px; width: 90%; margin-left: 5%; min-height: 200px; max-height: 200px;"><img class="img-fluid"src="'+threads[i].imageThumb+'"style="border-radius: 3px; width: auto; min-height: 200px;"style=" "><div class="mask waves-effect waves-light"></div></div><div class="card-block  card-block-tren"><a class="activator" style="margin-top: -5px;"><i class="fa fa-eye" aria-hidden="true"></i> '
											+ threads[i].viewed
											+ '</a><span class="score s'+threads[i].avgScoreInt+'" style="margin-top: -15px;"></span> (<strong itemprop="reviewCount">'
											+ threads[i].avgScore
											+ '</strong>)</div><div class="card-block text-center" style="margin-top: 0px;"><h4 class="card-title"><strong><i class="fa fa-money" style="font-size:25px;color:#000"></i> '
											+ threads[i].priceString
											+ '</strong></h4><h5><i class="fa fa-area-chart" style="font-size:16px;color:#000"></i> '
											+ threads[i].area
											+ 'm&#178;</h5><p class="card-text truncase-detail">'
											+ threads[i].name
											+ '</p><a class="btn btn-success btn-fb" href="./view-thread-action.do?threadId='
											+ threads[i].threadId
											+ '">Xem</a><a type="button" onclick="addToCompare('
											+ threads[i].threadId
											+ ','
											+ "'"
											+ threads[i].name
											+ "'"
											+ ')" class="btn-floating btn-small btn-fb"><i class="fa fa-compress"></i></a></div></div></div>';
								}
							}
							if (threads.length == 0)
								stringResults = '<br><br><br><span class="text-center" style="    margin: 0 auto;  margin-top: 50px;  font-weight: bold; color: initial;  font-size: 30px;">Không có kết quả phù hợp</span>';
							$('#resultThreads').html(stringResults);
							var strPagi = '<nav class="pagination-center">';
							strPagi += '<ul class="pagination pagination-md pg-amber">';
							strPagi += '<li onclick="viewPage(1);" class="page-item">';
							strPagi += '<a class="page-link" saria-label="Previous">';
							strPagi += '<span aria-hidden="true">&laquo;</span><span aria-hidden="true">&laquo;</span>';
							strPagi += '</a>';
							strPagi += '</li>';
							strPagi += '<li onclick="viewPage('
									+ ((threads[0].page - 1) > 1 ? (threads[0].page - 1)
											: 1) + ')" class="page-item">';
							strPagi += '<a class="page-link" saria-label="Previous">';
							strPagi += '<span aria-hidden="true">&laquo;</span>';
							strPagi += '</a>';
							strPagi += '</li>';

							var pc = threads[0].page;
							var i = 0;
							var n = threads[0].totalPage;

							for (i = 1; i <= n; i++) {
								if (i != pc)
									strPagi += "<li onclick='viewPage("
											+ i
											+ ");' class=\"page-item\"><a class=\"page-link\">"
											+ i + "</a></li>";
								else
									strPagi += "<li onclick='viewPage("
											+ i
											+ ");' class=\"page-item active\"><a class=\"page-link\">"
											+ i + "</a></li>";
							}

							strPagi += '<li onclick="viewPage('
									+ ((threads[0].page + 1) < threads[0].totalPage ? (threads[0].totalPage + 1)
											: threads[0].totalPage)
									+ ');" class="page-item">';
							strPagi += '<a class="page-link" aria-label="Next">';
							strPagi += '<span aria-hidden="true">&raquo;</span>';
							strPagi += '</a>';
							strPagi += '</li>';
							strPagi += '<li onclick="viewPage('
									+ (threads[0].totalPage)
									+ ');" class="page-item">';
							strPagi += '<a class="page-link" aria-label="Next">';
							strPagi += '	<span aria-hidden="true">&raquo;</span><span aria-hidden="true">&raquo;</span>';
							strPagi += '</a>';
							strPagi += '</li>';
							strPagi += '</ul>';
							strPagi += '</nav>';
							//log(strPagi);
							$('#pagination').html(strPagi);

							//pagination
						},
						error : function(e) {
							alert('Error: ' + e);
						}
					});
		}
	</script>
</body>

</html>