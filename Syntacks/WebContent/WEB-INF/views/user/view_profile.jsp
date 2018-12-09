<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions - Syntacks</title>
	
	<jsp:include page="include/styles.jsp"/>
	<link href="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap.css" rel="stylesheet">
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
								<a href="users">Users</a>
							</li>
							<li>
								<a href="ask">Ask a Questions</a>
							</li>
							<li>
								<sec:authorize ifNotGranted="ROLE_USER">
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
						<h2></h2>
					</div>
					<div class="col-md-6">
						<ul class="breadcrumbs">
							<li><a href="profile">Profile</a></li>
							<li>${pageContext.request.userPrincipal.name}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Banner -->
		
			<!-- Start Content -->
		<div id="content">
			<div class="container">
				<div class="row blog-page">
					
					
					<!--Sidebar-->
					<div class="col-md-3 sidebar left-sidebar">
						
						<!-- Categories Widget -->
						<div class="widget widget-categories">
							<h4>User <span class="head-line"></span></h4>
							<ul>
								<li>
									<a href="#">Profile</a>
								</li>
								<li>
									<a href="#">Questions</a>
								</li>
							</ul>
						</div>


					</div>
					<!--End sidebar-->
					
					
					<!-- Start Blog Posts -->
					<div class="col-md-9 blog-box">
						
						<!-- Start Post -->
						<div class="blog-post image-post">
							<!-- Post Thumb -->
							<div class="post-head">
								     <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example-2">
                                    <thead>
                                        <tr>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>
                                            	<div class="post-content">
													<div class="post-type"><i class="fa fa-picture-o"></i></div>
													<h2><a href="#">Image Box With Nice Lightbox</a></h2>
													<ul class="post-meta">
														<li>By <a href="#">iThemesLab</a></li>
														<li>December 30, 2013</li>
														<li><a href="#">WordPress</a>, <a href="#">Graphic</a></li>
														<li><a href="#">4 Comments</a></li>
													</ul>
													<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
													<a class="main-button" href="#">Read More <i class="fa fa-angle-right"></i></a>
												</div>
											</td>
                                        </tr>
                                    </tbody>
                                    </table>
                                    </div>
                            
							</div>
							
						
						<!-- Start Post -->
						<div class="blog-post quote-post">
							<!-- Post Content -->
							<div class="post-content">
								<div class="post-type"><i class="fa fa-quote-left"></i></div>
								<div class="qoute-box">
									<a href="#">
										<h2>Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.</h2>
										<div class="qoute-author">John Kennedy</div>
									</a>
								</div>
								<ul class="post-meta">
									<li>By <a href="#">iThemesLab</a></li>
									<li>December 30, 2013</li>
									<li><a href="#">WordPress</a>, <a href="#">Graphic</a></li>
									<li><a href="#">4 Comments</a></li>
								</ul>
							</div>
						</div>
						<!-- End Post -->
					</div>
					<!-- End Blog Posts -->
					
					
				</div>
			</div>
		</div>
		<!-- End Content -->
		
					
				</div>
			</div>
		</div>
		<!-- End Content -->
		
		<jsp:include page="include/footer.jsp"/>
		</div>
			<!-- Go To Top Link -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
	
  	<script src="${pageContext.request.contextPath}/resources/datatables/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/datatables/dataTables.bootstrap.js"></script>
    <script>
    	$(document).ready(function() {
    	    $('#dataTables-example-2').dataTable();
    });
    </script>
		
</body>
</html>