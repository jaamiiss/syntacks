<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup - Syntacks</title>
	<jsp:include page="include/styles.jsp"/>
</head>
<body>
	<!-- Container -->
	<div id="container">
		
		<!-- Start Header -->
		<div class="hidden-header"></div>
		<header class="clearfix">
			
			<!-- Start Top Bar -->
					<jsp:include page="include/socialmedia.jsp"/>
			<!-- End Top Bar -->
			
			<!-- Start Header ( Logo & Naviagtion ) -->
			<div class="navbar navbar-default navbar-top">
				<div class="container">
					<div class="navbar-header">
						<!-- Stat Toggle Nav Link For Mobiles -->
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
						<!-- End Toggle Nav Link For Mobiles -->
						<a class="navbar-brand" href="${pageContext.request.contextPath}"><img alt="" src="resources/images/margo.png"></a>
					</div>
					<div class="navbar-collapse collapse">
						<!-- Stat Search -->
						<div class="search-side">
							<a href="#" class="show-search"><i class="fa fa-search"></i></a>
							<div class="search-form">
								<form autocomplete="off" role="search" method="get" class="searchform" action="/Syntacks/search">
									<input type="text" value="" name="query" id="s" placeholder="Search the site...">
								</form>
							</div>
						</div>
						<!-- End Search -->
						<!-- Start Navigation List -->
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="${pageContext.request.contextPath}">Home</a>
							</li>
							<li>
								<a href="questions">Questions</a>
							</li>
							<li>
								<a href="tags">Tags</a>
							</li>
							<li>
								<a href="users">Users</a>
							</li>
							<li>
								<a href="questions/ask">Ask a Questions</a>
							</li>
							<li>
								<sec:authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">
									<a href="signup">Signup</a>
								</sec:authorize>
							</li>
							<li>
								<sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
									<a class="active" href="/Syntacks/profile?user=${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a>
									<ul class="dropdown">
									<li><a href="<c:url value='logout'/>">Logout</a></li>
									</ul>
								</sec:authorize>
								<sec:authorize ifNotGranted="ROLE_USER,ROLE_ADMIN">
									<a href="login">Login</a>
								</sec:authorize>
							</li>
						</ul>
						<!-- End Navigation List -->
					</div>
				</div>
			</div>
			<!-- End Header ( Logo & Naviagtion ) -->
			
		</header>
		<!-- End Header -->	
		
		<!-- Start Content -->
		<div id="content">
			<div class="container">
		
				<div class="row">
					
					
						
					<div class="col-md-4 col-md-offset-4">
						<h4><c:if test="${not empty message}">
							${message}<br>
						</c:if></h4><br>
						
					<!-- Classic Heading -->
					<h4 class="classic-title"><span>Signup</span></h4>
				
					<!-- Start Signup Form -->
					<div id="contact-form" class="contact-form">
						<div class="loader"></div>
						<form action="/Syntacks/register" class="contactForm" name="cform" method="post">
							<input id="username" name="username" type="text" value="" size="30" placeholder="Username">
							<input id="email" name="email" type="email" value="" size="30" placeholder="Email">
							<input id="password" name="password" type="password" value="" size="30" placeholder="Password">
							<input id="cpassword" name="cpassword" type="password" value="" size="30" placeholder="Confirm Password">
							<button type="submit" name="signup" class="btn btn-danger btn-block">Signup</button>
						</form>
					</div>
					<!-- End Signup Form -->
				
				</div>
			</div>
		</div>
	</div>
	<!-- End content -->
		
		<jsp:include page="include/footer.jsp"/>	
	</div>
	<!--  End container -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
</body>
</html>