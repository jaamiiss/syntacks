<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login - Syntacks</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="SyntaxError">
	<meta name="author" content="MMC">
	
	<jsp:include page="include/styles.jsp"/>

</head>
<body>

	<!-- Container -->
	<div id="container">
		
		<!-- Start Header -->
		<div class="hidden-header"></div>
		
		<header class="clearfix">
			
			<!-- Start Top Bar -->
					<jsp:include page="include/styles.jsp"/>
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
								<a href="signup">Signup</a>
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
				<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
					<!-- Classic Heading -->
					<h4 class="classic-title"><span>Login</span></h4>
				
					<!-- Start Login Form -->
					<div id="contact-form" class="contatct-form">
						<div class="loader"></div>
						<form action="<c:url value= 'j_spring_security_check'/>" class="contactForm" name="cform" method="post">
							<input id="username" name="j_username" type="text" value="" size="30" placeholder="Username">
							<input id="password" class="form-cotrol" name="j_password" type="password" value="" size="30" placeholder="Password">
							<button type="submit" value="Login" name="login" class="btn btn-danger btn-block">Login</button>
						</form>
					</div>
					<!-- End Login Form -->
					
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