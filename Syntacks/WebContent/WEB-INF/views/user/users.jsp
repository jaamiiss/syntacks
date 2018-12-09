<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users - Syntacks</title>
<jsp:include page="include/styles.jsp"/>
</head>
<body>
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
								<a class="active" href="users">Users</a>
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
								<sec:authorize ifAnyGranted="ROLE_USER">
									<a class="active" href="/Syntacks/profile?user=${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a>
									<ul class="dropdown">
									<li><a href="<c:url value='logout'/>">Logout</a></li>
									</ul>
								</sec:authorize>
								<sec:authorize ifAnyGranted="ROLE_ADMIN">
									<a class="active" href="/Syntacks/view-questions">${pageContext.request.userPrincipal.name}</a>
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
				<div class="row sidebar-page">
				
					<div class="col-md-10 col-md-offset-1 sidebar right-sidebar">
						
						<h4 class="classic-title"><span>Users</span></h4>
						
						<div class="widget widget-search">
							<form action="/Syntacks/searchUser">
								<input type="search" name="search" placeholder="Type to find users.." />
								<button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
							</form>
						</div>

						<div class="widget widget-tags">
							<c:forEach var="user" items="${listusers}">
							<div class="col-md-4 service-box service-icon-left-more">
									<div class="service-icon">
										<img style="width:50px;height:50px" src="resources/images/author.png">
									</div>
									<div>
										<a href="#">${user.username}</a><br>
										<h6>${user.email}</h6>
									</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<!-- End Content -->

		<jsp:include page="include/footer.jsp"/>
		</div>
		<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
</body>
</html>