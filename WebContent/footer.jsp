
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<!--Footer-->
<div class="header-footer-phong-tro"></div>
<footer
	class="page-footer center-on-small-only primary-color-dark footer-phong-tro">

	<!--Footer Links-->
	<div class="container">
		<div class="row">

			<!--First column-->
			<div class="col-md-4 col-md-offset-1">
				<h5 class="title">TÌM TRỌ ONLINE</h5>
				<br> <img src="image/logo.png" height="35px;" /> <br> <br>
				<ul>
					<li><a href="#!">Phát triển bởi SE07</a></li>
				</ul>
			</div>
			<!--/.First column-->

			<hr class="hidden-md-up">

			<!--Second column-->
			<div class="col-md-4 col-md-offset-1">
				<h5 class="title">GIỚI THIỆU</h5>
				<p>Chúng tôi luôn cố gắng đem lại những thông tin nhanh chóng và
					chính xác cho mọi người.</p>
				<p>Rất mong nhận được sự ủng hộ giúp đỡ của mọi người cùng nhau
					xây dựng một kênh thông tin truyền thông về nhà trọ tốt nhất Việt
					Nam.</p>
			</div>
			<!--/.Second column-->


		</div>
	</div>
	<!--/.Footer Links-->

	<!--Copyright-->
	<div class="footer-copyright">
		<div class="container-fluid">
			© 2017 Copyright: <a href="#"> SE07 </a>

		</div>
	</div>
	<!--/.Copyright-->

</footer>



<!-- Modal Login -->
<div class="modal fade modal-ext" id="modal-login" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!--Content-->
		<div class="modal-content">
			<!--Header-->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="w-100">
					<i class="fa fa-user"></i> Đăng nhập
				</h3>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="md-form">
					<i class="fa fa-envelope prefix"></i> <input type="text" id="form2"
						class="form-control"> <label for="form2">Email</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password" id="form3"
						class="form-control"> <label for="form3">Mật khẩu</label>
				</div>
				<div class="text-center">
					<button class="btn btn-primary btn-lg green">Đăng nhập</button>
				</div>
			</div>
			<!--Footer-->
			<div class="modal-footer">
				<div class="options text-right">
					<p>
						Chưa có tài khoản? <a href="#">Đăng ký</a>
					</p>
				</div>
				<button type="button" class="btn btn-warning ml-auto"
					data-dismiss="modal">Đóng</button>
			</div>
		</div>
		<!--/.Content-->
	</div>
</div>
<!-- Modal Register -->
<div class="modal fade modal-ext" id="modal-register" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!--Content-->
		<div class="modal-content">
			<!--Header-->
			<div class="modal-header flex-column">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="w-100">
					<i class="fa fa-user"></i> Đăng ký
				</h3>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="md-form">
					<i class="fa fa-envelope prefix"></i> <input type="text" id="form2"
						class="form-control"> <label for="form2">Email</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password" id="form3"
						class="form-control"> <label for="form3">Mật khẩu</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password" id="form4"
						class="form-control"> <label for="form4">Nhập lại
						mật khẩu</label>
				</div>

				<div class="text-center">
					<button class="btn btn-primary btn-lg green">Đăng ký</button>
				</div>
			</div>
			<!--Footer-->
			<div class="modal-footer">
				<div class="options">
					<p>
						Đã có tài khoản? <a href="#">Đăng nhập</a>
					</p>
				</div>
				<button type="button" class="btn btn-warning ml-auto"
					data-dismiss="modal">Đóng</button>
			</div>
		</div>
		<!--/.Content-->
	</div>
</div>