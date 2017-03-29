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
<title>Thêm bài viết mới</title>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/compiled.min.css" rel="stylesheet">
<link href="../css/mdb.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/sweetalert.css" rel="stylesheet">
<style>
#map {
	height: 450px;
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
<script src="../js/tinymce/tinymce.min.js"></script>
<script>
	tinymce
			.init({
				selector : '#content',
				height : 400,
				plugins : "autolink,lists,spellchecker,pagebreak,table,save,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,template"
			});
</script>
<script type="text/javascript">
	function log(a) {
		console.log(a);
	}
	function createCookie(name, value, days) {
		var expires = "";
		if (days) {
			var date = new Date();
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			expires = "; expires=" + date.toUTCString();
		}
		document.cookie = name + "=" + value + expires + "; path=/";
	}

	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length, c.length);
		}
		return null;
	}

	function eraseCookie(name) {
		createCookie(name, "", -1);
	}
</script>
</head>
<body>
	<nav class="navbar navbar-toggleable-md fixed-top">
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarNav1"
		aria-controls="navbarNav1" aria-expanded="false"
		aria-label="Toggle navigation">
		<i class="fa fa-bars" style="color: #2C97BE" aria-hidden="true"></i>
	</button>
	<a class="navbar-brand" href="../"> <strong><img
			src="../img/logo.png" height="25px;" /></strong>
	</a>
	<div class="collapse navbar-collapse" id="navbarNav1">
		<ul class="navbar-nav mr-auto">
		</ul>
		<ul class="navbar-nav ml-auto">
			<a href="./thread-manager-action.do">
				<button type="button" class="btn btn-elegant hidden-xl-up">
					<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
						aria-hidden="true"></i>Bài viết
				</button>
			</a>
			<a href="./rate-manager-action.do">
				<button type="button" class="btn btn-elegant hidden-xl-up">
					<i class="fa fa-group icon-in-button" aria-hidden="true"></i>Bình
					luận
				</button>
			</a>
			<img id="imgAva" src="../img/avatar.jpg" alt="Hình đại diện"
				class="rounded-circle" style="width: 40px; height: 40px">
			<li class="nav-item dropdown btn-group"><a
				class="nav-link dropdown-toggle" id="dropdownMenu1"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
				<div class="dropdown-menu dropdown dropdown-menu-right"
					aria-labelledby="dropdownMenu1">
					<a class="dropdown-item" onclick="logout();">Đăng xuất</a>
				</div></li>
		</ul>
	</div>
	</nav>

	<div class="row main-board">
		<div class="col-lg-2 hidden-lg-down side-menu-left">
			<div class="row dash-board">
				<a href="./thread-manager-action.do">
					<button type="button"
						class="btn btn-elegant button-side-menu-left button-dash-board">
						<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
							aria-hidden="true"></i>Bài viết
					</button>
				</a>
			</div>
			<div class="row">
				<a href="./rate-manager-action.do">
					<button type="button" class="btn btn-elegant button-side-menu-left">
						<i class="fa fa-group icon-in-button" aria-hidden="true"></i>Bình
						luận
					</button>
				</a>
			</div>
		</div>
		<div class="col-lg-10 col-md-12 col-12 scroll-box">
			<div class="main-content hoverable" style="overflow-y: scroll;">
				<div class="clearfix"></div>
				<div class="row" style="width: 100%">
					<div class="col-lg-12 col-12">
						<h2 class="title-in-admin">Thêm bài viết</h2>
					</div>
					<!-- <div class="col-lg-4 col-6 text-right">
						<button class="btn btn-primary" onclick="history.go(-1);">Quay
							lại</button>
					</div> -->
				</div>

				<html:form action="/user/add-thread-action" method="post"
					styleClass="form-admin-right">
					<div class="card-block">
						<html:hidden styleId="idAction" property="action"></html:hidden>
						<html:hidden styleClass="form-control" property="threadId"></html:hidden>
						<html:hidden styleClass="form-control" property="accountId"></html:hidden>
						<html:hidden styleClass="form-control" property="latitude"></html:hidden>
						<html:hidden styleClass="form-control" property="longitude"></html:hidden>
						<bean:define id="kindOf" name="threadForm" property="kindOf"></bean:define>
						<div style="display: table; margin: 0 auto;">
							<fieldset class="form-group">
								<input type="radio" id="kindOf" name="kindOf"
									<%out.print(kindOf);
				if ("true".equals(kindOf.toString())) {
					out.print(" checked=\"checked\" ");
				}%>
									value="true" /> <label for="kindOf">Cho thuê phòng</label> <input
									type="radio" id="kindOf2" name="kindOf"
									<%out.print(kindOf);
				if ("false".equals(kindOf.toString())) {
					out.print(" checked=\"checked\" ");
				}%>
									value="false" /> <label for="kindOf2">Đi tìm phòng</label>
							</fieldset>
						</div>

						<div style="width: calc(100%); display: inline-block;">
							<label for="form3">Thể loại  <font color="red">*</font></label>
							<html:select name="threadForm" property="categoryId"
								styleClass="mdb-select" styleId="slbCategory">
								<logic:iterate name="threadForm" property="categories" id="item">
									<bean:define id="id" name="item" property="categoryId" />
									<html:option value="${id}">
										<bean:write name="item" property="name" />
									</html:option>
								</logic:iterate>
							</html:select>
						</div>
						<div style="width: calc(100%); display: inline-block;">
							<label for="form3">Tỉnh - Thành phố  <font color="red">*</font></label>
							<html:select name="threadForm" property="provinceId"
								styleClass="mdb-select" styleId="slbProvince">
								<logic:iterate name="threadForm" property="provinces" id="item">
									<bean:define id="id" name="item" property="provinceId" />
									<html:option value="${id}">
										<bean:write name="item" property="name" />
									</html:option>
								</logic:iterate>
							</html:select>
						</div>
						<div style="width: calc(100%); display: inline-block;">
							<label for="form3">Quận - Huyện <font color="red">*</font></label>
							<html:select name="threadForm" property="districtId"
								styleClass="mdb-select" styleId="slbDistrict">
								<logic:iterate name="threadForm" property="districts" id="item">
									<bean:define id="id" name="item" property="districtId" />
									<html:option value="${id}">
										<bean:write name="item" property="name" />
									</html:option>
								</logic:iterate>
							</html:select>
						</div>
						<div style="width: calc(100%); display: inline-block;">
							<label for="form3">Làng - Xã <font color="red">*</font></label>
							<html:select name="threadForm" property="villageId"
								styleClass="mdb-select" styleId="slbVillage">
								<logic:iterate name="threadForm" property="villages" id="item">
									<bean:define id="id" name="item" property="villageId" />
									<html:option value="${id}">
										<bean:write name="item" property="name" />
									</html:option>
								</logic:iterate>
							</html:select>
						</div>
						<div class="md-form">
							<html:text property="name" styleClass="form-control"
								value=""></html:text>
							<label for="form3">Tên <font color="red">*</font></label>
						</div>

						<label for="form3">Nội dung <font color="red">*</font></label>
						<div class="md-form">
							<html:textarea styleId="content" property="content"
								value=""
								styleClass="form-control"></html:textarea>
						</div>

						<div class="md-form">
							<html:text property="price" styleClass="form-control"></html:text>
							<label for="form3">Giá <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<html:text property="electricFee" styleClass="form-control"></html:text>
							<label for="form3">Tiền điện <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<html:text property="waterFee" styleClass="form-control"></html:text>
							<label for="form3">Tiền nước <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<html:text property="otherFee" styleClass="form-control"></html:text>
							<label for="form3">Phụ phí <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<html:text property="area" styleClass="form-control"></html:text>
							<label for="form3">Diện tích <font color="red">*</font></label>
						</div>

						<bean:define id="wifi" name="threadForm" property="wifi"></bean:define>
						<bean:define id="waterHeater" name="threadForm"
							property="waterHeater"></bean:define>
						<bean:define id="conditioner" name="threadForm"
							property="conditioner"></bean:define>
						<bean:define id="fridge" name="threadForm" property="fridge"></bean:define>
						<bean:define id="attic" name="threadForm" property="attic"></bean:define>
						<bean:define id="camera" name="threadForm" property="camera"></bean:define>
						<fieldset class="form-group">
							<input type="checkbox" name="wifi" id="wifi"
								<%out.print(wifi);
				if ("true".equals(wifi.toString())) {
					out.print(" checked=\"checked\" ");
				}%> />
							<label for="wifi">Wifi</label>
						</fieldset>
						<fieldset class="form-group">
							<input type="checkbox" id="waterHeater" name="waterHeater"
								<%out.print(waterHeater);
				if ("true".equals(waterHeater.toString())) {
					out.print(" checked=\"checked\" ");
				}%> />
							<label for="waterHeater">Nước nóng</label>
						</fieldset>
						<fieldset class="form-group">
							<input type="checkbox" id="conditioner" name="conditioner"
								<%out.print(conditioner);
				if ("true".equals(conditioner.toString())) {
					out.print(" checked=\"checked\" ");
				}%> />
							<label for="conditioner">Điều hòa</label>
						</fieldset>
						<fieldset class="form-group">
							<input type="checkbox" id="fridge" name="fridge"
								<%out.print(fridge);
				if ("true".equals(fridge.toString())) {
					out.print(" checked=\"checked\" ");
				}%> />
							<label for="fridge">Tủ lạnh</label>
						</fieldset>
						<fieldset class="form-group">
							<input type="checkbox" id="attic" name="attic"
								<%out.print(attic);
				if ("true".equals(attic.toString())) {
					out.print(" checked=\"checked\" ");
				}%> />
							<label for="attic">Gác xếp</label>
						</fieldset>
						<fieldset class="form-group">
							<input type="checkbox" id="camera" name="camera"
								<%out.print(camera);
				if ("true".equals(camera.toString())) {
					out.print(" checked=\"checked\" ");
				}%> />
							<label for="camera">Camera</label>
						</fieldset>

						<html:select property="waterSource" styleClass="mdb-select">
							<html:option value="1">Giếng đào</html:option>
							<html:option value="2">Giếng đóng-khoan</html:option>
							<html:option value="3">Nước máy</html:option>
							<html:option value="4">Không xác định</html:option>
						</html:select>
						<label>Nguồn nước  <font color="red">*</font></label>

						<div class="md-form">
							<html:text property="direction" styleClass="form-control"></html:text>
							<label for="form3">Hướng phòng</label>
						</div>

						<div class="md-form">
							<html:text property="numOfToilets" styleClass="form-control"></html:text>
							<label for="form3">Số toilet  <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<html:text property="numOfPeople" styleClass="form-control"></html:text>
							<label for="form3">Số người cho phép <font color="red">*</font></label>
						</div>

						<html:select property="object" styleClass="mdb-select">
							<html:option value="1">Nam</html:option>
							<html:option value="2">Nữ</html:option>
							<html:option value="3">Không xác định</html:option>
						</html:select>
						<label>Đối tượng</label>

						<div class="md-form">
							<html:text property="imageThumb" styleClass="form-control"></html:text>
							<label for="form3">Hình đại diện cho phòng</label>
						</div>

						<div class="md-form">
							<html:text property="imagesString" styleClass="form-control"></html:text>
							<label for="form3">Hình ảnh về phòng</label>
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
											for="changetype-address">Addresses</label> <input
											type="radio" name="type" id="changetype-geocode"> <label
											for="changetype-geocode">Geocodes</label>
									</div>
									<div id="strict-bounds-selector" class="pac-controls">
										<input type="checkbox" id="use-strict-bounds" value="">
										<label for="use-strict-bounds">Strict Bounds</label>
									</div>
								</div>
								<div id="pac-container">
									<html:text property="address" styleId="pac-input"></html:text>
								</div>
							</div>
						</div>
						<div id="map"></div>
						<div id="infowindow-content">
							<img src="" width="16" height="16" id="place-icon"> <span
								id="place-name" class="title"></span> <br> <span
								id="place-address"></span>
						</div>
						<bean:define id="sendNotification" name="threadForm"
							property="sendNotification"></bean:define>
						<br> <br>
						<fieldset class="form-group">
							<input type="checkbox" name="sendNotification"
								id="sendNotification"
								<%out.print(wifi);
				if ("true".equals(wifi.toString())) {
					out.print(" checked=\"checked\" ");
				}%>
								onchange="doAjaxPost()" /> <label for="sendNotification">Gửi
								thông báo đến bài viết phù hợp nhu cầu</label>
						</fieldset>

						<div id="relateThread"></div>
						<script>
							var map = null;
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
								var input = document
										.getElementById('pac-input');
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

													$('input[name="latitude"]')
															.val(
																	place.geometry.location
																			.lat())
													$('input[name="longitude"]')
															.val(
																	place.geometry.location
																			.lng())
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
													infowindow
															.open(map, marker);
												});
								// Sets a listener on a radio button to change the filter type on Places
								// Autocomplete.
								function setupClickListener(id, types) {
									var radioButton = document
											.getElementById(id);
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
													autocomplete
															.setOptions({
																strictBounds : this.checked
															});
												});
							}
						</script>
						<script
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-H_xa-vjvVRk59cgxAFSBHwj2huBV-B4&libraries=places&callback=initMap"
							async defer></script>

						<div class="text-center">
							<button onclick="return submitAddForm();"
								class="btn btn-default button-login-admin">Thêm</button>
							<button class="btn btn-primary" onclick="history.go(-1);">Quay
								lại</button>
						</div>
					</div>
				</html:form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="../js/tether.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../js/mdb.min.js"></script>
	<script type="text/javascript" src="../js/sweetalert.min.js"></script>
	<script type="text/javascript">
		function log(a) {
			console.log(a);
		}
		var idAction = $("#idAction");
		$(document)
				.ready(
						function() {
							
							$("[name='name']").attr('maxlength', '500');
							$("[name='address']").attr('maxlength', '500');
							$("[name='content']").attr('maxlength', '4000');
							$("[name='direction']").attr('maxlength', '100');

							$("[name='price']").attr('type', 'number');
							$("[name='price']").attr('min', '0');
							$("[name='price']").attr('max', '99999999999');

							$("[name='electricFee']").attr('type', 'number');
							$("[name='electricFee']").attr('min', '0');
							$("[name='electricFee']").attr('max', '99999999999');

							$("[name='waterFee']").attr('type', 'number');
							$("[name='waterFee']").attr('min', '0');
							$("[name='waterFee']").attr('max', '99999999999');

							$("[name='otherFee']").attr('type', 'number');
							$("[name='otherFee']").attr('min', '0');
							$("[name='otherFee']").attr('max', '99999999999');
							
							$("[name='area']").attr('type', 'number');
							$("[name='area']").attr('min', '0');
							$("[name='area']").attr('max', '99999999999');

							$("[name='numOfToilets']").attr('type', 'number');
							$("[name='numOfToilets']").attr('min', '0');
							$("[name='numOfToilets']").attr('max', '99999999999');

							$("[name='numOfPeople']").attr('type', 'number');
							$("[name='numOfPeople']").attr('min', '0');
							$("[name='numOfPeople']").attr('max', '99999999999');
							
							$('input[type=radio][name=kindOf]').change(
									function() {
										if (this.value == 'true') {
											log("Cho tue");
										} else if (this.value == 'false') {
											log("Di tim");
										}
									});
							$("#imgAva").attr("src",
									"../" + readCookie("avatar"));
							$("#dropdownMenu1").html(readCookie("email"));
							//Đọc lại giá trị page hiện tại từ Form Class
							$('input[type="text"]').keypress(function(event) {
								if (event.keyCode == '13') {
									event.preventDefault();
								}
							});
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
																	var stringResults = '<option value="0">- Chọn huyện -</option>';
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
																					'');
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
																	var stringResults = '<option value="0">- Chọn xã -</option>';
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
		function submitAddForm() {
			$('[name="price"]').parent().next(".validation").remove();
			$('[name="electricFee"]').parent().next(".validation").remove();
			$('[name="waterFee"]').parent().next(".validation").remove();
			$('[name="otherFee"]').parent().next(".validation").remove();
			$('[name="area"]').parent().next(".validation").remove();
			$('[name="numOfToilets"]').parent().next(".validation").remove();
			$('[name="numOfPeople"]').parent().next(".validation").remove();
			villageId = $('[name="villageId"]').val();

			name = $('[name="name"]').val();
			content = tinymce.get('content').getContent();
			price = $.isNumeric($('[name="price"]').val());
			priceVal = parseInt($('[name="price"]').val());
			electricFee = $.isNumeric($('[name="electricFee"]').val());
			electricFeeVal = parseInt($('[name="electricFee"]').val());
			waterFee = $.isNumeric($('[name="waterFee"]').val());
			waterFeeVal = parseInt($('[name="waterFee"]').val());
			otherFee = $.isNumeric($('[name="otherFee"]').val());
			otherFeeVal = parseInt($('[name="otherFee"]').val());
			area = $.isNumeric($('[name="area"]').val());
			areaVal = parseInt($('[name="area"]').val());
			numOfToilets = $.isNumeric($('[name="numOfToilets"]').val());
			numOfToiletsVal = parseInt($('[name="numOfToilets"]').val());
			numOfPeople = $.isNumeric($('[name="numOfPeople"]').val());
			numOfPeopleVal = parseInt($('[name="numOfPeople"]').val());

			if (villageId == 0 || villageId == null) {
				showAlert("Bạn chưa chọn xã");
				return false;
			} else if (name == null || name.length < 10) {
				showAlert("Tiêu đề quá ngắn");
				return false;
			} else if (content == null || content.length < 10) {
				showAlert("Nội dung quá ngắn");
				return false;
			} else if (price == false) {
				showAlert("Giá không hợp lệ");
				return false;
			} else if (electricFee == false) {
				showAlert("Tiền điện không hợp lệ");
				return false;
			} else if (waterFee == false) {
				showAlert("Tiền nước không hợp lệ");
				return false;
			} else if (otherFee == false) {
				showAlert("Phụ phí không hợp lệ");
				return false;
			} else if (area == false) {
				showAlert("Diện tích không hợp lệ");
				return false;
			} else if (numOfToilets == false) {
				showAlert("Số toilets không hợp lệ");
				return false;
			} else if (numOfPeople == false) {
				showAlert("Số người không hợp lệ");
				return false;
			} else if (priceVal < 0 || priceVal > 9999999999) {
				$('[name="price"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Giá tiền phải > 0 và < 1 tỷ</div>");
				$('[name="price"]').focus();
				return false;
			} else if (electricFeeVal < 0 || electricFeeVal > 9999999999) {
				$('[name="electricFee"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Tiền điện phải > 0 và < 1 tỷ</div>");
				$('[name="electricFee"]').focus();
				return false;
			} else if (waterFeeVal < 0 || waterFeeVal > 9999999999) {
				$('[name="waterFee"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Tiền nước phải > 0 và < 1 tỷ</div>");
				$('[name="waterFee"]').focus();
				return false;
			} else if (otherFeeVal < 0 || otherFeeVal > 9999999999) {
				$('[name="otherFee"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Phụ phí phải > 0 và < 1 tỷ</div>");
				$('[name="otherFee"]').focus();
				return false;
			} else if (areaVal < 0 || areaVal > 9999999999) {
				$('[name="area"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Diện tích phải > 0 và < 1 tỷ</div>");
				$('[name="area"]').focus();
				return false;
			} else if (numOfToiletsVal < 0 || numOfToiletsVal > 9999999999) {
				$('[name="numOfToilets"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Số toilet phải > 0 và < 1 tỷ</div>");
				$('[name="numOfToilets"]').focus(); 
				return false;
			} else if (numOfPeopleVal < 0 || numOfPeopleVal > 9999999999) {
				$('[name="numOfPeople"]').parent().after("<div class='validation' style='color:red;margin-bottom: 20px;'>Số người phải > 0 và < 1 tỷ</div>");
				$('[name="numOfPeople"]').focus();
				return false;
			}else{
				idAction.val("submit");
				document.forms[0].submit();
				return true;
			}
		}
		function showAlert(text) {
			sweetAlert("Lỗi", text, "error");
		}
		function logout() {
			$.ajax({
				type : "POST",
				url : "/Mock_SE7/home-account-action.do",
				data : "action=logout",
				success : function(res) {
					log("Logout");
				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
			eraseCookie("email");
			eraseCookie("password");
			var curentUrl = window.location.href;
			index = curentUrl.lastIndexOf("/");
			url = curentUrl.substring(0, index);
			index = url.lastIndexOf("/");
			url = url.substring(0, index);
			window.location.href = url;
		};

		function log(a) {
			console.log(a);
		};

		function createCookie(name, value, days) {
			var expires = "";
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				expires = "; expires=" + date.toUTCString();
			}
			document.cookie = name + "=" + value + expires + "; path=/";
		};

		function readCookie(name) {
			var nameEQ = name + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ')
					c = c.substring(1, c.length);
				if (c.indexOf(nameEQ) == 0)
					return c.substring(nameEQ.length, c.length);
			}
			return null;
		};

		function eraseCookie(name) {
			createCookie(name, "", -1);
		};
		function doAjaxPost() {
			sendNotification = $('#sendNotification').is(':checked');
			if(sendNotification == false){
				return false;
			}
			// get the form values
			wifi = $('#wifi').is(':checked');
			waterHeater = $('#waterHeater').is(':checked');
			conditioner = $('#conditioner').is(':checked');
			fridge = $('#fridge').is(':checked');
			attic = $('#attic').is(':checked');
			camera = $('#camera').is(':checked');
			object = $('#object').val();
			waterSource = $('[name="waterSource"]').val(); 
			area = $('#area').val();
			far = $('#far').val();
			provinceId = $('#slbProvince').val();
			districtId = $('#slbDistrict').val();
			villageId = $('#slbVillage').val();
			categoryId = $('#slbCategory').val();
			name = $('[name="name"]').val();
			page = 1;
			lat = $('[name="latitude"]').val();
			lng = $('[name="longitude"]').val();
			kindOf = $('#kindOf').is(':checked');
			log(kindOf);
			if (kindOf == true) {
				kindOf = "false";
			}else{
				kindOf = "true";
			}
			var str = "action=search" + "&wifi=" + wifi + "&waterHeater="
					+ waterHeater + "&conditioner=" + conditioner + "&fridge="
					+ fridge + "&attic=" + attic + "&camera=" + camera
					+ "&object=" + object + "&waterSource=" + waterSource
					+ "&categoryId=" + categoryId + "&far=" + 6 + "&lat=" + lat
					+ "&lng=" + lng + "&provinceId=" + provinceId
					+ "&districtId=" + districtId + "&kindOf=" + kindOf
					+ "&villageId=" + villageId + "&name=" + "&page=" + page;
			log("Post " + str);
			$
					.ajax({
						type : "POST",
						url : "/Mock_SE7/search-thread.do",
						data : str,
						success : function(response) {
							log(response);
							//++page;
							createCookie('page', page, 1);
							//log("Res " + response);
							var threads = JSON.parse(response);
							if (threads != undefined) {
								var n = threads.length;
								var stringResults = '<span>Bài viết gợi ý phù hợp mục tiêu cho bạn</span>';
								for (var i = 0; i < n; i++) {
									stringResults += '<div class="row"><div class="col-md-10"> '
											+ threads[i].name
											+ ' </div>'
											+ '<div class="col-md-2"><button onclick="viewItem('
											+ threads[i].threadId
											+ ')" type="button" class="btn btn-action" data-toggle="tooltip" data-placement="top" title="View item"> <i class="fa fa-eye blue-text icon-btn-action"></i> </button></div></div>';
								}
								if(n == 0)
									stringResults = "Không có kết quả nào";
							}
							$('#relateThread').html(stringResults);
							//pagination
						},
						error : function(e) {
							alert('Error: ' + e);
						}
					});
		};
		//Hàm xóa item
		function viewItem(id) {
			var curentUrl = window.location.href;
			index = curentUrl.lastIndexOf("/");
			url = curentUrl.substring(0, index);
			index = url.lastIndexOf("/");
			url = url.substring(0, index);
			window.open(url + "/view-thread-action.do?threadId=" + id);
		};
	</script>
</body>

</html>