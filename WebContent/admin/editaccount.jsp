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
<title>Sửa tài khoản</title>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/compiled.min.css" rel="stylesheet">
<link href="../css/mdb.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/sweetalert.css" rel="stylesheet">
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
				<a href="./dashboard-action.do">
					<button type="button" class="btn btn-elegant button-side-menu-left">
						<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
							aria-hidden="true"></i>Thống kê
					</button>
				</a>
			</div>
			<div class="row dash-board">
				<a href="./account-manager-action.do">
					<button type="button"
						class="btn btn-elegant button-side-menu-left button-dash-board">
						<i class="fa fa-group icon-in-button" aria-hidden="true"></i>Tài
						khoản
					</button>
				</a>
			</div>
			<div class="row dash-board">
				<a href="./category-manager-action.do">
					<button type="button" class="btn btn-elegant button-side-menu-left">
						<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
							aria-hidden="true"></i>Danh mục
					</button>
				</a>
			</div>
		</div>
		<div class="col-lg-10 col-md-12 col-12">
			<div class="row main-content-form hoverable">
				<div class="clearfix"></div>
				<div class="row" style="width: 100%">
					<div class="col-lg-12 col-12">
						<h2 class="title-in-admin">Sửa tài khoản</h2>
					</div>
					<!-- <div class="col-lg-4 col-6 text-right">
						<button class="btn btn-primary" onclick="history.go(-1);">Quay
							lại</button>
					</div> -->
				</div>

				<html:form action="/admin/edit-account-action" method="post"
					styleClass="form-admin-right">
					<div class="card-block">
						<html:hidden styleId="idAction" property="action"></html:hidden>
						<html:hidden styleClass="form-control" property="accountId"></html:hidden>
						<div style="width: 48px; display: inline-block;">
							<i class="fa fa-user prefix" style="font-size: 2rem;"></i>
						</div>
						<div style="width: calc(100% - 52px); display: inline-block;">
							<label for="form3">Quyền hạn <font color="red">*</font></label>
							<html:select property="level" styleClass="mdb-select"
								styleId="level">
								<html:option value="1">Quản trị viên</html:option>
								<html:option value="2">Điều hành viên</html:option>
								<html:option value="3">Người dùng</html:option>
							</html:select>
						</div>

						<div style="width: calc(100%); display: inline-block;"
							id="categoryId">
							<div style="width: 48px; display: inline-block;">
								<i class="fa fa-user prefix" style="font-size: 2rem;"></i>
							</div>
							<div style="width: calc(100% - 52px); display: inline-block;">
								<label for="form3">Danh mục <font color="red">*</font></label>
								<html:select name="accountForm" property="categoryId"
									styleClass="mdb-select">
									<option value="" selected>Không</option>
									<logic:iterate name="accountForm" property="categories"
										id="item">
										<bean:define id="id" name="item" property="categoryId" />
										<html:option value="${id}">
											<bean:write name="item" property="name" />
										</html:option>
									</logic:iterate>
								</html:select>
							</div>
						</div>
						<div class="md-form">
							<i class="fa fa-user prefix"></i>
							<html:text property="name" styleClass="form-control"></html:text>
							<label for="form3">Họ tên <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<i class="fa fa-envelope prefix"></i>
							<html:text property="email" styleClass="form-control"
								readonly="true"></html:text>
							<label for="form2">Email <font color="red">*</font></label>
						</div>

						<div class="md-form">
							<i class="fa fa-tag prefix"></i>
							<html:text property="password" styleClass="form-control"></html:text>
							<label for="form34">Mật khẩu</label>
						</div>

						<div class="md-form">
							<i class="fa fa-pencil prefix"></i>
							<html:text property="rePassword" styleClass="form-control"></html:text>
							<label for="form8">Nhập lại mật khẩu</label>
						</div>

						<div class="md-form">
							<i class="fa fa-pencil prefix"></i>
							<html:text property="phone" styleClass="form-control"></html:text>
							<label for="form8">Điện thoại</label>
						</div>

						<div class="text-center">
							<button onclick="return submitEditForm();"
								class="btn btn-default button-login-admin">Sửa</button>
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
		var idAction = $("#idAction");
		$(document).ready(function() {
			$("[name='name']").attr('maxlength', '50');
			$("[name='email']").attr('maxlength', '40');
			$("[name='password']").attr('maxlength', '32');
			$("[name='phone']").attr('maxlength', '11');

			$("#imgAva").attr("src", "../" + readCookie("avatarAdmin"));
			$("#dropdownMenu1").html(readCookie("emailAdmin"));
			$('.mdb-select').material_select();
			$('#level').on("change", function() {
				level = $(this).val();
				if (level == 2) {
					$("#categoryId").show();
				} else {
					$("#categoryId").hide();
				}
			});
			level = $('#level').val();
			if (level == 2) {
				$("#categoryId").show();
			} else {
				$("#categoryId").hide();
			}
		});
		function submitEditForm() {
			var level, name, email, password, rePassword, phone;
			level = $("[name='level']").val();
			name = $("[name='name']").val();
			email = $("[name='email']").val();
			password = $("[name='password']").val();
			rePassword = $("[name='rePassword']").val();
			phone = $("[name='phone']").val();
			log(validatePhone(phone));
			if (level == undefined) {
				showAlert("Quyền hạn không được bỏ trống");
				return false;
			} else if (name == undefined || name.length <= 6) {
				showAlert("Họ tên không được bỏ trống hoặc quá ngắn");
				return false;
			}  else if (email == undefined || email.length <= 6) {
				showAlert("Email không được bỏ trống hoặc quá ngắn");
				return false;
			} else if (password.length > 0 && password.length < 6) {
				showAlert("Mật khẩu quá ngắn");
				return false;
			} else if (rePassword != password) {
				showAlert("Mật khẩu không khớp");
				return false;
			} else if (validateEmail(email) == false) {
				showAlert("Email không hợp lệ");
				return false;
			} else if (validatePhone(phone) == false) {
				showAlert("Điện thoại không hợp lệ");
				return false;
			} else {
				idAction.val("submit");
				document.forms[0].submit();
				return true;
			}
		}
		function validatePhone(phone) {
			var phoneRe = /^[0-9]{1,11}$/;
			var digits = phone.replace(/\D/g, "");
			return phoneRe.test(digits);
		}
		function validateEmail(email) {
			var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(email);
		}

		function showAlert(text) {
			sweetAlert("Lỗi", text, "error");
		}

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
	</script>
</body>

</html>