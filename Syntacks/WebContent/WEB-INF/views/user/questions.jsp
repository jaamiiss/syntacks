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
					
					<!-- Page Content -->
					<div class="col-md-9 page-content">
						
						<div class="tabs-section">
							
							<!-- Nav Tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab-1" data-toggle="tab">Questions</a></li>
							</ul>
							
							<!-- Tab panels -->
							<div class="tab-content">
								<!-- Tab Content 1 -->
								<div class="tab-pane fade in active" id="tab-1">
									 <div class="container">
  										<div class="col-md-8">
  											<div class="nav nav-tabs">
						                        <!-- /.panel-heading -->
						                        <div class="panel-body">
						                            <div class="table-responsive">
						                                <table class="table table-striped">
						                                    <thead>
						                                        <tr>
																	<th></th>
						                                            <th></th>
						                                        </tr>
						                                    </thead>
						                                    <tbody>
						                                    <c:forEach var="question" items="${listquestions}">
						                                        <tr>
						                                            <td style="text-align:center;">
							                                            <div class="col-md-offset-2 row votes-answers-views">
																			<div class="post-row">
																				<div class="left-meta-post">
																					<div class="post-v"><span class="value">0</span><span class="label">Votes</span></div>
																					<div class="post-answers"><span class="value">2</span><span class="label">Answers</span></div>
																					<div class="post-v"><span class="value">100</span><span class="label">Views</span></div>
																				</div>
																			</div>  
																		</div>
						                                            </td>
						                                            <td>
						                                            	<div class="row latest-posts-classic">
																			<div class="col-md-12 post-row">
																				<h3 class="post-title"><a href="/Syntacks/view?id=${question.title_id}">${question.title}</a></h3>
																				<div class="post-content">
																					<p>${question.content}</p>
																				</div>
																			</div>  
																		</div>
																	    <div class="row" style="height:50px;">
																	    	<div style="height:48px;" class="col-md-9 sidebar right-sidebar">
																			<div class="widget widget-tags">
																				<div class="tagcloud">
																		<c:forEach var="tag" items="${(fn:split(question.tags,','))}">
																					<a href="#">${tag}</a>
																		</c:forEach>																							
																				</div>
																			</div>
																			</div>
																			<div style="height:48px;">
																				<div>${question.date_time}</div>
																				<div><img src="resources/images/author.png" style="width:30px;height:25px;"> ${question.username}</div>
						                                            		</div>
						                                            	</div>
						                                            
						                                            </td>
						                                        </tr>
						                                      </c:forEach>
						                                    </tbody>
						                                </table>
						                            </div>
						                            <!-- /.table-responsive -->
						                        </div>
					                        <!-- /.panel-body -->
					                    </div>
					                    <!-- /.panel -->
					                </div>
								</div>
								
								</div>
							</div>
							<!-- End Tab Panels -->
							
						</div>
						
					</div>
					<!-- End Page Content -->
					
					
					<!--Sidebar-->
					<div class="col-md-3 sidebar right-sidebar">
						<div class="counter-item">
                        	<div class="timer" id="item3" data-to="2945139" data-speed="5000"></div>
                        	<h4>questions</h4> 
                        </div>
						<div class="widget widget-tags">
							<h4>Related Tags <span class="head-line"></span></h4>
							<div class="tagcloud">
								<a href="#">Java</a>
								<a href="#">Javascript</a>
								<a href="#">C#</a>
								<a href="#">PHP</a>
								<a href="#">Android</a>
								<a href="#">Jquery</a>
								<a href="#">Python</a>
								<a href="#">C++</a>
								<a href="#">HTML</a>
								<a href="#">IOS</a>
							</div>
							<a href="">more related tags</a>
						</div>
					</div>
					<!--End sidebar-->
					
				</div>
			</div>
		</div>
		<!-- End Content -->
		
		<jsp:include page="include/footer.jsp"/>
		</div>
			<!-- Go To Top Link -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>	
</body>
</html>