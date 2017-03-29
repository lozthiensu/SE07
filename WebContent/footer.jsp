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
						id="emailLog" class="form-control" maxlength="40"> <label
						for="form2">Email</label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="passwordLog" class="form-control" maxlength="32"> <label
						for="form3">Mật khẩu</label>
				</div>
				<div class="text-center">
					<button class="btn btn-primary btn-lg green" onclick="loginAjax();">Đăng
						nhập</button>
				</div>

			</div>
			<!--Footer-->
			<!-- 			<div class="modal-footer"> 
				<button type="button" class="btn btn-warning ml-auto"
					data-dismiss="modal">Đóng</button>
			</div> -->
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
				<div id="list-compare"></div>
				<div class="text-center">
					<button class="btn btn-primary  ml-auto green" onclick="compare();">Bắt
						đầu</button>
					<button type="button" class="btn btn-warning ml-auto"
						onclick="clearCompare();" data-dismiss="modal">Xóa</button>
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
		<div class="modal-content">
			<div class="modal-header flex-column">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="w-100">
					<i class="fa fa-user"></i> Đăng ký
				</h3>
			</div>
			<div class="modal-body">
				<div class="md-form">
					<i class="fa fa-user-circle-o prefix"></i> <input type="text"
						id="nameReg" class="form-control" maxlength="50"> <label
						for="form2">Họ tên <font color="red">*</font></label><span
						id="labelName"></span>
				</div>

				<div class="md-form">
					<i class="fa fa-envelope prefix"></i> <input type="text"
						id="emailReg" class="form-control" maxlength="40"> <label
						for="form2">Email <font color="red">*</font></label><span
						id="labelEmail"></span>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="passwordReg" class="form-control" maxlength="32"> <label
						for="form3">Mật khẩu <font color="red">*</font></label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="re-passwordReg" class="form-control" maxlength="32"> <label
						for="form4">Nhập lại mật khẩu <font color="red">*</font></label>
				</div>

				<div class="text-center">
					<button onclick="return registerAjax();"
						class="btn btn-primary btn-lg green">Đăng ký</button>
				</div>
			</div>
		</div>
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
		name = $("#nameReg").val();
		email = $("#emailReg").val();
		password = $("#passwordReg").val();
		re_password = $("#re-passwordReg").val();

		if (name.length < 1) {
			showError("Họ tên không được bỏ trống hoặc quá ngắn");
			return false;
		} else if (email.length < 1) {
			showError("Email không được bỏ trống hoặc quá ngắn");
			return false;
		} else if (password.length < 1) {
			showError("Mật khẩu không được bỏ trống hoặc quá ngắn");
			return false;
		} else if (password != re_password) {
			showError("Mật khẩu không khớp");
			return false;
		} else if (password == undefined || password.length < 6) {
			showAlert("Mật khẩu không được bỏ trống hoặc quá ngắn");
			return false;
		} else if (validateEmail(email) == false) {
			showError("Email không hợp lệ");
			return false;
		}
		$.ajax({
			type : "POST",
			url : "/Mock_SE7/home-account-action.do",
			data : "email=" + email + "&name=" + name + "&password=" + password
					+ "&action=register",
			success : function(res) {
				if (res == "success") {
					showSuccess("Đăng ký thành công");
					return true;
				} else {
					showError("Đăng ký thất bại");
					return false;
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
	function validateEmail(email) {
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
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
						var objAccount = JSON.parse(res);
						log(objAccount);
						if (objAccount.accountId > 0) {
							if (typeof getRates == 'function') {
								getRates();
							}
							eraseCookie("avatar");
							//showSuccess("Đăng nhập thành công");
							createCookie("email", objAccount.email, 1);
							createCookie("password", objAccount.password, 1);
							createCookie("accountId", objAccount.accountId, 1);
							createCookie("avatar", objAccount.avatar, 1);
							$("#imgAva").attr("src", objAccount.avatar);
							$("#imgAvaCMT").attr("src", objAccount.avatar);
							$("#welcomeText").html("Chào " + email);
							$("#modal-login").modal('hide');
							getNotification();
							$("#notificationBag").show();
							$("#btnReg").hide();
							$("#btnLog").hide();
							$("#imgAva").show();
							$("#menuAcc").show();
							$('#btnAddRate').prop('disabled', false); //TO DISABLED
							$('#newContentRate').prop('disabled', false); //TO DISABLED
							$('input[name=newScoreRate]').prop('disabled',
									false); //TO DISABLED 
							$('input[name=newScoreRate]:checked').prop(
									'checked', false);
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
		$
				.ajax({
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
							$("#labelEmail")
									.html(
											"<font color='red' style='margin-left: 50px'><b>Email đã tồn tại</b></font>");
							return false;
						}
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
	}
	function slug(str) {
		str = str.toLowerCase();
		str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
		str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
		str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
		str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
		str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
		str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
		str = str.replace(/đ/g, "d");
		return str;
	}
	function logout() {

		$.ajax({
			type : "POST",
			url : "/Mock_SE7/home-account-action.do",
			data : "action=logout",
			success : function(res) {
				if (typeof getRates == 'function') {
					getRates();
				}
				log("Logout");
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
		eraseCookie("email");
		eraseCookie("password");
		$("#welcomeText").html("");
		$("#btnReg").show();
		$("#btnLog").show();
		$("#imgAva").hide();
		$("#notificationBag").hide();
		$("#menuAcc").hide();
		$('#btnAddRate').prop('disabled', true); //TO DISABLED
		$('#newContentRate').prop('disabled', true); //TO DISABLED
		$('input[name=newScoreRate]').prop('disabled', true); //TO DISABLED 
		$('input[name=newScoreRate]:checked').prop('checked', false);
		$("#welcomeToRate").html("Chức năng yêu cầu đăng nhập");
		$("#imgAvaCMT").attr("src", "image/avatar.jpg");
	}
	function getNotification() {
		$
				.ajax({
					type : "POST",
					url : "/Mock_SE7/home-account-action.do",
					data : "action=getNotification",
					success : function(res) {
						obj = JSON.parse(res);
						unRead = 0;
						n = obj.length;
						str = "";
						for (i = 0; i < n; i++) {
							un = '';
							if (obj[i].bit != 1) {
								unRead++;
								un = 'item-unread';
							}
							str += '<a onclick="read('
									+ obj[i].notificationId
									+ ','
									+ obj[i].threadId
									+ ','
									+ obj[i].rateId
									+ ')" class="" >'
									+ '<div class="row item-noti '+ un +'" style="min-width: 400px;">'
									+ '	<div class="col-2">'
									+ '		<img src="'
									+ obj[i].avatar
									+ '"'
									+ '			style=" height: 50px; width: 50px; border-radius: 50%;">'
									+ '	</div>'
									+ '	<div class="col-10">'
									+ '	<div style="max-width: 400px;"> '
									+ '		<span'
							+'			style="word-wrap: break-word; word-break: break-all;">'
									+ obj[i].content
									+ '		</span>'
									+ '		<br><span'
							+'			style="word-wrap: break-word; word-break: break-all;">'
									+ obj[i].timeCount + '		</span>'
									+ '	</div>' + '	</div>' + '</div>' + '</a>';
						}
						$('#numMessUnread').html(unRead);
						if(n == 0)
							str = "Không có thông báo";
						$('#listNoti').html(str);
					},
					error : function(e) {
						alert('Error: ' + e);
					}
				});
	}
	function read(notificationId, threadId, rateId) {
		log(notificationId + " " + threadId + " " + rateId);
		$.ajax({
			type : "POST",
			url : "/Mock_SE7/home-account-action.do",
			data : "action=read" + "&notificationId=" + notificationId,
			success : function(res) {
				if (res == "success") {
					getNotification();
					$
					.ajax({
						type : "POST",
						url : "/Mock_SE7/search-thread.do",
						data : "threadId=" + threadId + "&action=checkThreadStatus",
						success : function(res) {
							log(res);
							if (res == "success") {
								var strRate = "";
								if(rateId > 0)
									strRate = '#rate-' + rateId;
								var curentUrl = window.location.href;
								var index = curentUrl.lastIndexOf("/");
								var url = curentUrl.substring(0, index);
								window.location.href = url
								+ "/view-thread-action.do?threadId=" + threadId
								+ strRate;
							} else {
								showError("Bài viết chưa được duyệt, xin hãy chờ!");
								return false;
							}
						},
						error : function(e) {
							alert('Error: ' + e);
						}
					});
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});

	}
	$(document).ready(function() {
		getNotification();
		$("#emailReg").keyup(function() {
			checkEmail();
		});
		$("#emailReg").keyup(function() {
			checkEmail();
		});

		/* If login success, show avatar, hide button reg, log */
		email = readCookie('email');
		//log(email);
		if (email != undefined && email.length > 6) {
			$("#welcomeText").html("Chào " + email);
			$("#imgAva").show();
			$("#notificationBag").show();
			$("#menuAcc").show();
			$("#btnReg").hide();
			$("#btnLog").hide();
			$('#btnAddRate').prop('disabled', false); //TO DISABLED
			$("#imgAva").attr("src", readCookie("avatar"));
			$("#imgAvaCMT").attr("src", readCookie("avatar"));
			$("#welcomeToRate").html("");
		} else {
			$("#btnReg").show();
			$("#btnLog").show();
			$("#imgAva").hide();
			$("#notificationBag").hide();
			$("#menuAcc").hide();
			$("#welcomeText").html("");
			$('#btnAddRate').prop('disabled', true); //TO DISABLED
			$('#newContentRate').prop('disabled', true); //TO DISABLED
			$("#welcomeToRate").html("Chức năng yêu cầu đăng nhập");
			$("#imgAvaCMT").attr("src", "image/avatar.jpg");
		}
	});
	function showError(text) {
		sweetAlert("Lỗi", text, "error");
	}
	function showSuccess(text) {
		sweetAlert("Thành công", text, "success");
	}
	function addToCompare(threadId, name) {
		var cmpJSON = readCookie("cmpJSON");
		var cmpOBJ = null;
		if (cmpJSON == "null" || cmpJSON === "null" || cmpJSON == null) {
			cmpOBJ = [];
			log("Rỗng");
		} else {
			log("Có");
			cmpOBJ = JSON.parse(cmpJSON);
		}
		var myObj = {
			"id" : threadId,
			"name" : name
		};
		var count = Object.keys(cmpOBJ).length;
		if (count <= 1) {
			var them = true;
			for (var key in cmpOBJ) {
				if (cmpOBJ[key].id == threadId) {
					them = false;
					break;
				}
			}
			if (them == true) {
				cmpOBJ.push(myObj);
				showSuccess("Đã thêm vào giỏ so sánh");
			} else {
				showError("Đã tồn tại trong giỏ");
			}
		} else {
			var them = true;
			for (var key in cmpOBJ) {
				if (cmpOBJ[key].id == threadId) {
					them = false;
					break;
				}
			}
			if (them == true) {
				cmpOBJ.splice(0, 1);
				cmpOBJ.push(myObj);
				showSuccess("Đã thêm vào giỏ so sánh");
			} else {
				showError("Đã tồn tại trong giỏ");
			}
		}
		createCookie("cmpJSON", JSON.stringify(cmpOBJ), 1);
	}
	$('#modal-compare')
			.on(
					'shown.bs.modal',
					function() {
						log("á");
						var cmpJSON = readCookie("cmpJSON");
						if (cmpJSON == 'null') {
							var cmpOBJ = [];
						} else {
							var cmpOBJ = [];
							var cmpOBJ = JSON.parse(cmpJSON);
						}
						var str = '<ul class="list-group">';
						for ( var k in cmpOBJ) {
							str += '<li class="list-group-item justify-content-between">'
									+ cmpOBJ[k].name
									+ '<button onclick="removeCompare('
									+ cmpOBJ[k].id
									+ ')" type="button" class="btn btn-action" > <i class="fa fa-times red-text icon-btn-action"></i></button>'
									+ '</li>';
							console.log(k, cmpOBJ[k]);
						}
						str += '</ul>';
						log(str);
						$("#list-compare").html(str);
					})
	function removeCompare(a) {
		var cmpJSON = readCookie("cmpJSON");
		log("Read: =" + cmpJSON + "-");
		var cmpOBJ = null;
		if (cmpJSON == "null" || cmpJSON === "null" || cmpJSON == null) {
			cmpOBJ = [];
			log("Rỗng");
		} else {
			log("Có");
			cmpOBJ = JSON.parse(cmpJSON);
		}
		var count = Object.keys(cmpOBJ).length;
		log("Dem: " + count);
		for (i = 0; i < count; i++) {
			if (cmpOBJ[i].id == a) {
				cmpOBJ.splice(i, 1);
				break;
			}
		}
		var count1 = Object.keys(cmpOBJ).length;
		log("Con lai: " + count1);
		if (count1 == 0) {
			eraseCookie("cmpJSON");
		} else {
			createCookie("cmpJSON", JSON.stringify(cmpOBJ), 1);
		}

		//Cap nhap

		var cmpJSON = readCookie("cmpJSON");
		if (cmpJSON == 'null') {
			var cmpOBJ = [];
		} else {
			var cmpOBJ = [];
			var cmpOBJ = JSON.parse(cmpJSON);
		}
		var str = '<ul class="list-group">';
		for ( var k in cmpOBJ) {
			str += '<li class="list-group-item justify-content-between">'
					+ cmpOBJ[k].name
					+ '<button onclick="removeCompare('
					+ cmpOBJ[k].id
					+ ')" type="button" class="btn btn-action" > <i class="fa fa-times red-text icon-btn-action"></i></button>'
					+ '</li>';
			console.log(k, cmpOBJ[k]);
		}
		str += '</ul>';
		$("#list-compare").html(str);
	}
	function clearCompare() {
		$('#modal-compare').toggle();
		$("#list-compare").html("");
		eraseCookie("cmpJSON");
	}
	function compare() {
		var cmpJSON = readCookie("cmpJSON");
		log("Read: =" + cmpJSON + "-");
		var cmpOBJ = null;
		if (cmpJSON == "null" || cmpJSON === "null" || cmpJSON == null) {
			cmpOBJ = [];
			showError("Không có sản phẩm để so sánh");
			log("Rỗng");
		} else {
			log("Có");
			cmpOBJ = JSON.parse(cmpJSON);
		}
		var count = Object.keys(cmpOBJ).length;
		if (count == 1) {
			showError("Cần có đủ 2 sản phẩm để so sánh");
		} else {
			thread1Id = cmpOBJ[0].id;
			thread2Id = cmpOBJ[1].id;
			var curentUrl = window.location.href;
			var index = curentUrl.lastIndexOf("/");
			var url = curentUrl.substring(0, index);
			window.location.href = url + "/compare-thread-action.do?thread1Id="
					+ thread1Id + "&thread2Id=" + thread2Id;
		}
		log("Dem: " + count);
	}
</script>
