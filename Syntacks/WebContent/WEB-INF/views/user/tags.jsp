<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tags - Syntacks</title>
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
								<a class="active" href="tags">Tags</a>
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
				
				<!--Sidebar-->
					<div class="col-md-10 col-md-offset-1 sidebar right-sidebar">
						
						<h4 class="classic-title"><span>Tags</span></h4>
						<h6>A tag is a keyword or label that categorizes your question with other, similar questions. Using the right tags makes it easier for others to find and answer your question. </h6><br>
						
						<!-- Search Widget -->
						<div class="widget widget-search">
							<form action="/Syntacks/searchTags" method="get">
								<input type="text" name="query" placeholder="Type to find tags.." />
								<button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
							</form>
						</div>

						<!-- Tags Widget -->
						<div class="widget widget-tags">
							
                            <c:forEach var="tag" items="${listtags}">       
							<div class="tagcloud">
								<c:forEach var="tag" items="${(fn:split(tag.tags,','))}">
									<div class="col-md-3">
										<a href="#">${tag}</a> x10200
										<h6>JavaScript (not to be confused with Java) is a dynamic weakly typed interpreted language typically used for client-side</h6>
										<div class="hr1" style="margin-bottom:30px;"></div>
									</div>
								</c:forEach>
							</div>
							</c:forEach>
						</div>

					</div>
					<!--End sidebar-->
					
				</div>
			</div>
		</div>
		<!-- End Content -->

		<jsp:include page="include/footer.jsp"/>
		</div>
		
</body>
</html>