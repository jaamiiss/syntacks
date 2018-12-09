<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ask - Syntacks</title>
	<jsp:include page="include/styles.jsp"/>
	<jsp:include page="include/header.jsp"/>	
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
						<a class="navbar-brand" href="${pageContext.request.contextPath}"><img alt="" src="/Syntacks/resources/images/margo.png"></a>
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
								<a href="/Syntacks/questions">Questions</a>
							</li>
							<li>
								<a href="/Syntacks/tags">Tags</a>
							</li>
							<li>
								<a href="/Syntacks/users">Users</a>
							</li>
							<li>
								<a href="/Syntacks/unanswered">Unanswered</a>
							</li>
							<li>
								<a class="active" href="/Syntacks/questions/ask">Ask a Questions</a>
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
									<li><a href="../<c:url value='logout'/>">Logout</a></li>
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
			<div	 class="container">
			<div class="row">
			    <section id="promo" class="promo section offset-header">
			     <div class="cta-container">
				           <div class="container">
				           		<%
				           			String title = request.getParameter("title");
				           			String content = request.getParameter("content");
				           			String tags = request.getParameter("tags");
				           			String action = request.getParameter("action");
				           			String actionName = "update";
				           			
				           			if(action == null) {
				           				action = "POST QUESTION";
				           				actionName = "post";
				           			}
				           			if(title == null)
				           				title = "";
				           			if(content == null)
				           				content = "";
				           			if(tags == null)
				           				tags = "Sample";
				           			
				           			System.out.println("hello:");
				           			System.out.println(request.getParameter("title_id"));
				           		%>
				           		
				           		<c:if test="${not empty message}">
									<div class="msg">${message}</div>
								</c:if>
				                <form action="/Syntacks/questions/ask/post" method="post">
				                    <div class="form-group input-group col-sm-8">
				                        <span class="input-group-addon">Title</span>
				                        <input type="text" name ="title" class="form-control" value="<%= title %>" placeholder="Enter title here...">
				                    </div>
				                
				                <!-- EDITOR -->
				                <textarea id="pagedownMe" name="content" class="form-control" rows="10"><%= content %></textarea>
				                <!-- EDITOR -->    
				                <!-- TAGS -->
				                    <div class="example example_markup">
				                      <div class="bs-example">
				                        <h4>Tags</h4>
				                        <input type="text" name="tags" value="<%= tags %>" data-role="tagsinput">
				                        <input type="hidden" name="id" value="<%= request.getParameter("title_id") %>">
				                        <input type="hidden" name="username" readOnly=true value="${pageContext.request.userPrincipal.name}">
				                      </div>
				                    </div>
				                <!-- TAGS -->
								
				
				                <div class="container col-sm-8">
				                    <input type="submit" name="<%=actionName %>" value="<%=action%>">
				                </div>
				                </form>
				                <div class="container">
				                    <hr></hr>
				                </div>
				            </div>
				            <script type="text/javascript">
				                (function () {
				
				                    $("textarea#pagedownMe").pagedownBootstrap();
				
				                    $("textarea#pagedownMeDangerously").pagedownBootstrap({
				                        'sanitize': false,
				                        'help': function () { alert("Do you need help?"); },
				                        'hooks': [
				                            {
				                                'event': 'preConversion',
				                                'callback': function (text) {
				                                    return text.replace(/\b(a\w*)/gi, "*$1*");
				                                }
				                            },
				                            {
				                                'event': 'plainLinkText',
				                                'callback': function (url) {
				                	                    return "This is a link to " + url.replace(/^https?:\/\//, "");
				                                }
				                            }
				                        ]
				                    });
				
				                    $('.wmd-preview').addClass('well');
				
				                })();
				            </script> 

        </div>
        </section>
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