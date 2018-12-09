<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>404 Page Not Found - Syntacks</title>
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
								<a href="/Syntacks/signup">Signup</a>
								</sec:authorize>
							</li>
							<li>
								<sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
									<a class="active" href="/Syntacks/profile?user=${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a>
									<ul class="dropdown">
									<li><a href="/Syntacks/<c:url value='logout'/>">Logout</a></li>
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
				<div class="page-content">
					
					
					<div class="error-page">
						<h1>404</h1>
						<h3>Page not Found</h3>
						<p>We're sorry, but the page you were looking for doesn't exist.</p>
						<div class="text-center"><a href="${pageContext.request.contextPath}" class="btn-system btn-small">Back To Home</a></div>
					</div>
					

				</div>
			</div>
		</div>
		<!-- End Content -->
		
	</div>
	<!-- End Container -->
	<jsp:include page="include/footer.jsp"/>
		<!-- Go To Top Link -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
</body>
</html>