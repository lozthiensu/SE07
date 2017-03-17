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
			</div>
			<!--/.First column-->

			<hr class="hidden-md-up">

			<!--Second column-->
			<div class="col-md-4 col-md-offset-1">
				<h5 class="title">GIỚI THIỆU</h5>
				<p>Chúng tôi luôn cố gắng đem lại những thông tin nhanh chóng và
					chính xác cho mọi người.</p>
			</div>
			<!--/.Second column-->


		</div>
	</div>
	<!--/.Footer Links-->

	<!--Copyright-->
	<div class="footer-copyright">
		<div class="container-fluid">
			© 2017 Copyright <a href="#"> SE07 </a>

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
					<i class="fa fa-envelope prefix"></i> <input type="text"
						id="emailLog" class="form-control"> <label for="form2">Email</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="passwordLog" class="form-control"> <label for="form3">Mật
						khẩu</label>
				</div>
				<div class="text-center">
					<button class="btn btn-primary btn-lg green" onclick="loginAjax();">Đăng
						nhập</button>
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


<!-- Modal Login -->
<div class="modal fade modal-ext" id="modal-compare" tabindex="-1"
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
					<i class="fa fa-user"></i> So sánh
				</h3>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div id="list-compare"> 
				</div> 
				<div class="text-center">
					<button class="btn btn-primary  ml-auto green" onclick="compare();">Bắt
						đầu</button>
					<button type="button" class="btn btn-warning ml-auto" onclick="clearCompare();" data-dismiss="modal">Xóa</button>
				</div>

			</div>
		</div>
		<!--/.Content-->
	</div>
</div>
<!-- Modal Register -->
<script>
	/* $.validator.addMethod('emailReg', function(value) {
		return /^((\d{5}-\d{4})|(\d{5})|([A-Z]\d[A-Z]\s\d[A-Z]\d))$/
				.test(value);
	}, 'Please enter a valid US or Canadian postal code.'); */
</script>
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
					<i class="fa fa-envelope prefix"></i> <input type="text"
						id="emailReg"
						pattern="/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/"
						class="form-control"> <label for="form2">Email</label><span
						id="labelEmail"></span>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="passwordReg" class="form-control"> <label for="form3">Mật
						khẩu</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="re-passwordReg" class="form-control"> <label
						for="form4">Nhập lại mật khẩu</label>
				</div>

				<div class="text-center">
					<button onclick="return registerAjax();"
						class="btn btn-primary btn-lg green">Đăng ký</button>
				</div>
			</div>
			<!--Footer-->
			<div class="modal-footer">
				<div class="row">
					<div class="col-md-6">
						<div class="options">
							<p>
								Đã có tài khoản? <a href="#">Đăng nhập</a>
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<button type="button" class="btn btn-warning ml-auto"
							data-dismiss="modal">Đóng</button>
					</div>
				</div>

			</div>
		</div>
		<!--/.Content-->
	</div>
</div>

<link href="css/sweetalert.css" rel="stylesheet">
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script>
	/* START CHECK PASSS REGISTER */
	var passwordReg = document.getElementById("passwordReg"), re_passwordReg = document
			.getElementById("re-passwordReg");
	function validatePassword() {
		if (passwordReg.value != passwordReg.value) {
			passwordReg.setCustomValidity("Mật khẩu không khớp");
		} else {
			passwordReg.setCustomValidity('');
		}
	}
	passwordReg.onchange = validatePassword;
	passwordReg.onkeyup = validatePassword;
	/* END CHECK PASSS REGISTER */
	function registerAjax() {
		email = $("#emailReg").val();
		password = $("#passwordReg").val();
		re_password = $("#re-passwordReg").val();

		if (email.length < 1) {
			showError("Email không được bỏ trống hoặc quá ngắn");
			return false;
		} else if (password.length < 1) {
			showError("Mật khẩu không được bỏ trống hoặc quá ngắn");
			return false;
		}
		$.ajax({
			type : "POST",
			url : "/Mock_SE7/home-account-action.do",
			data : "email=" + email + "&password=" + password
					+ "&action=register",
			success : function(res) {
				if (res == "success") {
					log("tc");
					showSuccess("Đăng ký thành công");
					return true;
				} else {
					log("tb");
					showError("Đăng ký thất bại");
					return false;
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
	function loginAjax() {
		email = $("#emailLog").val();
		password = $("#passwordLog").val();

		$
				.ajax({
					type : "POST",
					url : "/Mock_SE7/home-account-action.do",
					data : "email=" + email + "&password=" + password
							+ "&action=login",
					success : function(res) {
						var accountId = 0;
						accountId = parseInt(res);
						log(accountId);
						if (accountId >= 0) {
							showSuccess("Đăng nhập thành công");
							createCookie("email", email, 1);
							createCookie("password", password, 1);
							createCookie("accountId", accountId, 1);
							$("#welcomeText").html("Chào " + email);
							$("#modal-login").modal('hide');
							$("#btnReg").hide();
							$("#btnLog").hide();
							$("#imgAva").show();
							$("#menuAcc").show();
							$('#btnAddRate').prop('disabled', false); //TO DISABLED
							$("#welcomeToRate").html("");	
							return true;
						} else {
							showError("Đăng nhập thất bại");
							$("#welcomeText").html("");
							return false;
						}
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
	}

	function checkEmail() {
		log("check email");
		email = $("#emailReg").val();
		$.ajax({
			type : "POST",
			url : "/Mock_SE7/home-account-action.do",
			data : "email=" + email + "&action=checkEmail",
			success : function(res) {
				if (res == "success") {
					log("tc");
					$("#labelEmail").html("");
					return true;
				} else {
					log("tb");
					$("#labelEmail").html("Email đã tồn tại");
					return false;
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
	function logout() {
		eraseCookie("email");
		eraseCookie("password");
		$("#welcomeText").html("");
		$("#btnReg").show();
		$("#btnLog").show();
		$("#imgAva").hide();
		$("#menuAcc").hide();
		$('#btnAddRate').prop('disabled', true); //TO DISABLED
		$("#welcomeToRate").html("Chức năng yêu cầu đăng nhập");
	}
	$(document).ready(function() {
		$("#emailReg").keypress(function() {
			checkEmail();
		});
		$("#emailReg").keyup(function() {
			checkEmail();
		});

		/* If login success, show avatar, hide button reg, log */
		email = readCookie('email');
		log(email);
		if (email != undefined && email.length > 6) {
			$("#welcomeText").html("Chào " + email);
			$("#imgAva").show();
			$("#menuAcc").show();
			$("#btnReg").hide();
			$("#btnLog").hide();
			$('#btnAddRate').prop('disabled', false); //TO DISABLED
			$("#welcomeToRate").html("");	
		} else {
			$("#btnReg").show();
			$("#btnLog").show();
			$("#imgAva").hide();
			$("#menuAcc").hide(); 
			$("#welcomeText").html("");
			$('#btnAddRate').prop('disabled', true); //TO DISABLED
			$("#welcomeToRate").html("Chức năng yêu cầu đăng nhập");
		}
	});
	function showError(text) {
		sweetAlert("Lỗi", text, "error");
	}
	function showSuccess(text) {
		sweetAlert("Thành công", text, "success");
	}
	function addToCompare(threadId, name){
		var cmpJSON = readCookie("cmpJSON"); 
		var cmpOBJ = null;
		if( cmpJSON == "null" || cmpJSON === "null" || cmpJSON == null){
			cmpOBJ = [];
			log("Rỗng");
		}else{
			log("Có");
			cmpOBJ = JSON.parse(cmpJSON);
		} 
		var myObj = { "id" : threadId,  "name" : name };
	  	var count = Object.keys(cmpOBJ).length;
		if(count <= 1){
			cmpOBJ.push( myObj );
		}else{
				cmpOBJ.splice(0, 1);
			cmpOBJ.push( myObj );
		}
		createCookie("cmpJSON", JSON.stringify(cmpOBJ), 1);
	}
	$('#modal-compare').on('shown.bs.modal', function () {
		log("á");
		var cmpJSON = readCookie("cmpJSON"); 
		if( cmpJSON == 'null'){
			var cmpOBJ = [];
		}else{
			var cmpOBJ = [];
			var cmpOBJ = JSON.parse(cmpJSON);
		}
		var str = '<ul class="list-group">'; 
		for(var k in cmpOBJ) {
			str += '<li class="list-group-item justify-content-between">'
			+ cmpOBJ[k].name + '<button onclick="removeCompare('+cmpOBJ[k].id+')" type="button" class="btn btn-action" > <i class="fa fa-times red-text icon-btn-action"></i></button>'
			+ '</li>';
			   console.log(k, cmpOBJ[k]);
		}
		str += '</ul>';
		log(str);
		$("#list-compare").html(str); 
	})
	function removeCompare(a){
		var cmpJSON = readCookie("cmpJSON");
		log("Read: =" + cmpJSON + "-");
		var cmpOBJ = null;
		if( cmpJSON == "null" || cmpJSON === "null" || cmpJSON == null){
			cmpOBJ = [];
			log("Rỗng");
		}else{
			log("Có");
			cmpOBJ = JSON.parse(cmpJSON);
		}
	  	var count = Object.keys(cmpOBJ).length;
	  	log("Dem: " + count);
	  	for(i = 0; i < count; i++){
	  		if(cmpOBJ[i].id == a){
 				cmpOBJ.splice(i, 1);
 				break;
	  		}
	  	}
	  	var count1 = Object.keys(cmpOBJ).length;
	  	log("Con lai: " + count1);
	  	if(count1 == 0){
			eraseCookie("cmpJSON");
	  	}else{
			createCookie("cmpJSON", JSON.stringify(cmpOBJ), 1);
	  	}
		
		//Cap nhap

		var cmpJSON = readCookie("cmpJSON"); 
		if( cmpJSON == 'null'){
			var cmpOBJ = [];
		}else{
			var cmpOBJ = [];
			var cmpOBJ = JSON.parse(cmpJSON);
		}
		var str = '<ul class="list-group">'; 
		for(var k in cmpOBJ) {
			str += '<li class="list-group-item justify-content-between">'
				+ cmpOBJ[k].name + '<button onclick="removeCompare('+cmpOBJ[k].id+')" type="button" class="btn btn-action" > <i class="fa fa-times red-text icon-btn-action"></i></button>'
			+ '</li>';
			   console.log(k, cmpOBJ[k]);
		}
		str += '</ul>';
		$("#list-compare").html(str); 
	}
	function clearCompare(){
		$('#modal-compare').toggle ();
		$("#list-compare").html("");
		eraseCookie("cmpJSON");
	}
	function compare(){
		var cmpJSON = readCookie("cmpJSON");
		log("Read: =" + cmpJSON + "-");
		var cmpOBJ = null;
		if( cmpJSON == "null" || cmpJSON === "null" || cmpJSON == null){
			cmpOBJ = [];
			alert("Không có sản phẩm để so sánh");
			log("Rỗng");
		}else{
			log("Có");
			cmpOBJ = JSON.parse(cmpJSON);
		}
	  	var count = Object.keys(cmpOBJ).length;
	  	if(count == 1){
	  		alert("Cần có đủ 2 sản phẩm để so sánh");
	  	}else{
	  		thread1Id = cmpOBJ[0].id;
	  		thread2Id = cmpOBJ[1].id;
			var curentUrl = window.location.href;
			var index = curentUrl.lastIndexOf("/");
			var url = curentUrl.substring(0, index);
			window.location.href = url + "/compare-thread-action.do?thread1Id="+thread1Id + "&thread2Id="+thread2Id; 
	  	}
	  	log("Dem: " + count);
	}
</script>
