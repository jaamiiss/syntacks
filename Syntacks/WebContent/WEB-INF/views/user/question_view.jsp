<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Syntacks</title>
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
								<a class="active" href="questions">Questions</a>
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
								<sec:authorize ifNotGranted="ROLE_USER">
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
								<sec:authorize ifNotGranted="ROLE_USER">
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
		
		<!-- Start Page Banner -->
			<div class="page-banner no-subtitle">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<h2>Question</h2>
						</div>
						<div class="col-md-6">
							<ul class="breadcrumbs">
								<li><a href="${pageContext.request.contextPath}">Home</a></li>
								<li></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		<!-- End Page Banner -->
		
		<!-- Start Content -->
		<div id="content">
			<div class="container">
				<div class="row sidebar-page">
					
					
					<!-- Page Content -->
					<div class="col-md-9 page-content">
						
						<!-- Classic Heading -->
						<h4 class="classic-title"><span><b>${sessionQuestion.title}</b></span></h4>
						<div class="panel-group">
							<div class="panel panel-default">
								<div id="" class="panel-collapse collapse in">
								<div class="panel-footer"><i class="fa fa-user"></i> ${sessionQuestion.username} <a style="float:right;">Asked on ${sessionQuestion.date_time}</a></div>
									<div class="panel-body">
										${sessionQuestion.content}
									</div>
									<div class="panel-footer" style="height:50px;">
										<div class="sidebar">
											<div class="widget widget-tags">
												<div class="tagcloud">
													<c:forEach var="tag" items="${(fn:split(sessionQuestion.tags,','))}">
														<a href="#">${tag}</a>
													</c:forEach>																							
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Some Text -->
						
						<!-- Divider -->
						<div class="hr5" style="margin-top:30px; margin-bottom:45px;"></div>
					<c:forEach var="listreply" items="${listreplies}"> 
					
						<!-- Accordion -->
						<div class="panel-group" id="accordion">
							
							<!-- Start Accordion 1 -->
							
							<div class="panel panel-default">
								<!-- Toggle Heading -->
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-parent="#accordion" href="#collapse-4">
											
											
											<i class="fa fa-user"></i> ${listreply.user}
										</a>
										<a style="float:right"> Replied on ${listreply.date_reply}</a>
									</h4>
								</div>
								<!-- Toggle Content -->
								<div id="collapse-4" class="panel-collapse collapse in">
									<div class="panel-body">${listreply.comments} </div>
									
								</div>
							
							</div>
								
							<!-- End Accordion 3 -->
							
						</div>
						</c:forEach>
						<!-- End Accordion -->
						<div class="hr5" style="margin-top:30px; margin-bottom:45px;"></div>
						<sec:authorize ifAnyGranted="ROLE_USER">
						<div class="panel">
							<form method="post" action="/Syntacks/reply">
								<textarea class="form-control" rows="3" name="comments" id="comment"></textarea>
								<button style="float:right" type="submit" name="replyquestion">add comment</button>
								<input type="hidden" value="${sessionQuestion.title_id}" name="topic_id"/>
								
								<input type="hidden" value="${pageContext.request.userPrincipal.name}" name="user"/>
							</form>
						</div>
						</sec:authorize>
						<div class="hr5" style="margin-top:30px; margin-bottom:45px;"></div>
					</div>
					<!-- End Page Content-->
					
					
					<!--Sidebar-->
					<div class="col-md-3 sidebar right-sidebar">

						<!-- Categories Widget -->
						<div class="widget widget-categories">
							<h4>Categories <span class="head-line"></span></h4>
							<ul>
								<li>
									<a href="#">Spring</a>
								</li>
								<li>
									<a href="#">Spring Hibernate</a>
								</li>
								<li>
									<a href="#">Spring Maven</a>
								</li>
								<li>
									<a href="#">Spring MVC</a>
								</li>
							</ul>
						</div>

						<!-- Popular Posts widget -->
						<div class="widget widget-popular-posts">
							<h4>Popular Post <span class="head-line"></span></h4>
							<ul>
								<li>
									<div class="widget-thumb">
										<a href="#"><img src="images/blog-mini-01.jpg" alt="" /></a>
									</div>
									<div class="widget-content">
										<h5><a href="#">How To Download The Google Fonts Catalog</a></h5>
										<span>Jul 29 2013</span>
									</div>
									<div class="clearfix"></div>
								</li>
								<li>
									<div class="widget-thumb">
										<a href="#"><img src="images/blog-mini-02.jpg" alt="" /></a>
									</div>
									<div class="widget-content">
										<h5><a href="#">How To Download The Google Fonts Catalog</a></h5>
										<span>Jul 29 2013</span>
									</div>
									<div class="clearfix"></div>
								</li>
								<li>
									<div class="widget-thumb">
										<a href="#"><img src="images/blog-mini-03.jpg" alt="" /></a>
									</div>
									<div class="widget-content">
										<h5><a href="#">How To Download The Google Fonts Catalog</a></h5>
										<span>Jul 29 2013</span>
									</div>
									<div class="clearfix"></div>
								</li>
							</ul>
						</div>
						
					</div>
					<!--End sidebar-->
					
					
				</div>
			</div>
		</div>
		<!-- End Content -->

		<jsp:include page="include/footer.jsp"/>
		
	</div>
	<!-- End Container -->
	
	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

</body>
</html>