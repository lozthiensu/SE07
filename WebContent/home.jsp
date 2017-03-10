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
</head>
<body>

	<jsp:include page="header.jsp" />
	<!--Carousel Wrapper-->
	<div class="container-fluid"
		style="margin-left: -15px; margin-right: -15px;">
		<div id="carousel-example-2" class="carousel slide carousel-fade"
			data-ride="carousel">
			<!--Indicators-->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-2" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-2" data-slide-to="1"></li>
				<li data-target="#carousel-example-2" data-slide-to="2"></li>
			</ol>
			<!--/.Indicators-->
			<!--Slides-->

			<%
				int first = 0;
			%>
			<div class="carousel-inner" role="listbox">
				<logic:iterate name="homeViewForm" property="viewHighest" id="item">
					<%
						first++;
					%>
					<div
						class="carousel-item <%if (first == 1)
					out.println("active");%> ">
						<div class="view hm-black-light">
							<img src="<bean:write name="item" property="imageThumb" />"
								alt="First slide">
						</div>
						<div class="carousel-caption">
							<h3 class="h3-responsive">
								<bean:write name="item" property="name" />
							</h3>
							<p>
								Giá:
								<bean:write name="item" property="price" />
								đ
							</p>
						</div>
					</div>
				</logic:iterate>
			</div>
			<!--/.Slides-->
			<!--Controls-->
			<a class="carousel-control-prev" href="#carousel-example-2"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carousel-example-2"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			<!--/.Controls-->
		</div>
	</div>

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

				<logic:iterate name="homeViewForm" property="categories" id="item">
					<li class="nav-item"><a class="nav-link"><bean:write
								name="item" property="name" /></a></li>
				</logic:iterate>

			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="search.jsp" class="nav-link">Tìm kiếm</a></li>
			</ul>
		</div>
		</nav>

	</div>
	<br>
	<br>
	<br>
	<!--Navbar-->

	<div class="container container-white">
		<div class="row">
			<div class="col-lg-12">

				<logic:iterate name="homeViewForm" property="categoryWithThreads"
					id="item">
					<!--Slide new start -->
					<div class="slide-new">
						<h1 class="h1-title">
							<bean:write name="item" property="name" />
						</h1>
						<!--Carousel Wrapper-->
						<div
							id="owl-demo-<bean:write name="item" property="categoryId" />"
							class="owl-carousel">
							<logic:iterate name="item" property="threads" id="thread">
								<!--Card-->
								<div class="card card-cascade hoverable"
									style="margin-top: 40px;">
									<!--Card image-->
									<div class="view overlay hm-white-slight"
										style="border-radius: 10px; margin-top: -20px; width: 90%; margin-left: 5%; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12);">
										<img class="img-fluid"
											src="<bean:write name="thread" property="imageThumb" />"
											style="border-radius: 10px; width: 100%;"> <a href="#!">
											<div class="mask waves-effect waves-light"></div>
										</a>
									</div>
									<!--/Card image-->
									<!--Card content-->
									<div class="card-block text-center">
										<!--Title-->
										<h4 class="card-title">
											<strong>Giá: <bean:write name="thread"
													property="price" /> đ
											</strong>
										</h4>
										<h5>
											Diện tích:
											<bean:write name="thread" property="area" />
											m&#178;
										</h5>
										<p class="card-text truncase-detail">
											<bean:write name="thread" property="content" />
										</p>
										<bean:define id="threadId" name="thread" property="threadId"></bean:define>
										<html:link styleClass="btn btn-success"
											action="/view-thread-action?threadId=${threadId}">Chi
											tiết</html:link>
									</div>
									<!--/.Card content-->
								</div>
								<!--/.Card-->
							</logic:iterate>
						</div>
					</div>
				</logic:iterate>

			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/tether.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<logic:iterate name="homeViewForm" property="categoryWithThreads"
		id="cwt">
		<script>
			$(document).ready(function() {
				var str = '<bean:write name="cwt" property="categoryId" />';
				$("#owl-demo-" + str).owlCarousel({
					loop : true,
					margin : 10,
					navigation : true,
					responsiveClass : true,
					responsive : {
						0 : {
							items : 1,
							nav : true
						},
						600 : {
							items : 3,
							nav : true
						},
						1000 : {
							items : 6,
							nav : true,
							nav : true,
							margin : 20
						}
					}
				});
			});
		</script>
	</logic:iterate>
</body>

</html>