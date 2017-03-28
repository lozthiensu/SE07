<%@page import="statics.Pagination"%>
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
<title>Quản lý tài khoản</title>
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
				<a href="./thread-manager-action.do">
					<button type="button" class="btn btn-elegant button-side-menu-left">
						<i class="fa fa-globe icon-in-button" style="color: #2C97BE"
							aria-hidden="true"></i>Bài viết
					</button>
				</a>
			</div>
			<div class="row">
				<a href="./account-manager-action.do">
					<button type="button"
						class="btn btn-elegant button-side-menu-left  button-dash-board">
						<i class="fa fa-group icon-in-button" aria-hidden="true"></i>Tài
						khoản
					</button>
				</a>
			</div>
		</div>
		<div class="col-lg-10 col-md-12 col-12 scroll-box">
			<div class="main-content hoverable" style="overflow-y: scroll;">
				<div class="clearfix"></div>
				<div class="row" style="width: 100%; height: 60px;">
					<div class="col-lg-8">
						<h2 class="title-in-admin">Danh sách tài khoản</h2>
					</div>
				</div>
				<div class="table-custom">
					<div>
						<div class="col-mot">Id</div>
						<div class="col-ba">Tên</div>
						<div class="col-ba">Email</div>
						<div class="col-hai">Điện thoại</div>
						<div class="col-ba">Thao tác</div>
					</div>
					<logic:iterate name="accountListForm" property="accounts" id="item">
						<hr>
						<div>
							<div class="col-mot">
								<bean:write name="item" property="accountId" />
							</div>
							<div class="col-ba">
								<bean:write name="item" property="name" />
							</div>
							<div class="col-ba">
								<bean:write name="item" property="email" />
							</div>
							<div class="col-hai">
								<bean:write name="item" property="phone" />
							</div>
							<div class="col-mot">
								<logic:equal name="item" property="status" value="1">
									<button
										onclick="lockItem(<bean:write name="item" property="accountId" />)"
										type="button" class="btn btn-action" data-toggle="tooltip"
										data-placement="top" title="Verify item">
										<i class="fa  fa-lock red-text icon-btn-action"></i>
									</button>
								</logic:equal>
								<logic:equal name="item" property="status" value="0">
									<button
										onclick="unlockItem(<bean:write name="item" property="accountId" />)"
										type="button" class="btn btn-action" data-toggle="tooltip"
										data-placement="top" title="Verify item">
										<i class="fa  fa-unlock teal-text icon-btn-action"></i>
									</button>
								</logic:equal>
							</div>
						</div>
					</logic:iterate>
				</div>
				<nav class="pagination-center">
				<ul class="pagination pagination-md pg-amber">
					<li onclick='viewPage(1);' class="page-item"><a
						class="page-link" saria-label="Previous"> <span
							aria-hidden="true">&laquo;</span> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li
						onclick='viewPage(<%out.println((Pagination.page - 1) > 1 ? (Pagination.page - 1) : 1);%>);'
						class="page-item"><a class="page-link" saria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
					<%
						for (int i = 1; i <= Pagination.totalPage; i++) {
							if (i != Pagination.page)
								out.println("<li onclick='viewPage(" + i
										+ ");' class=\"page-item\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>");
							else
								out.println("<li onclick='viewPage(" + i
										+ ");' class=\"page-item active\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>");
						}
					%>
					<li
						onclick='viewPage(<%out.println((Pagination.page + 1) < Pagination.totalPage ? (Pagination.page + 1) : Pagination.totalPage);%>);'
						class="page-item"><a class="page-link" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
					</a></li>
					<li onclick='viewPage(<%out.println(Pagination.totalPage);%>);'
						class="page-item"><a class="page-link" aria-label="Next">
							<span aria-hidden="true">&raquo;</span><span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
				</nav>

				<html:form action="/mod/account-manager-action" method="get">
					<html:hidden styleId="pageId" name="accountListForm"
						property="page" styleClass="form-control"></html:hidden>
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
		//Trỏ đến styleId( tương đương với id) của property page
		var pageId = $("#pageId");
		//Khi load trang xong
		$(document)
				.ready(
						function() {
							$("#imgAva").attr("src", "../" + readCookie("avatarMod"));
							$("#dropdownMenu1").html(readCookie("emailMod"));
							//Đọc lại giá trị page hiện tại từ Form Class
							var pageStatic = parseInt('<bean:write name="accountListForm" property="page"/>');
							//Thêm class active vô id <li> của trang hiện tại
							$(".page-item").eq(pageStatic + 1).addClass("active");
						});
		//Khi muốn xem kết quả tìm kiếm của trang nào đó
		function viewPage(page) {
			//Gán giá trị page truyền vào cho property page của Form Class
			pageId.val(page);
			//Submit form bằng javascript
			document.forms[0].submit();
		};
		//hàm sửa item
		function lockItem(id){
			var curentUrl = window.location.href;
			var index = curentUrl.lastIndexOf("/");
			var url = curentUrl.substring(0, index);
			window.location.href = url + "/lock-account-action.do?accountId="+id; 
		};
		function unlockItem(id){
			var curentUrl = window.location.href;
			var index = curentUrl.lastIndexOf("/");
			var url = curentUrl.substring(0, index);
			window.location.href = url + "/unlock-account-action.do?accountId="+id; 
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
	</script>
</body>

</html>