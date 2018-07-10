<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>   
        <title>userList</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

        <!-- VENDOR CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
        <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="assets/css/main.css">
       
        <!-- GOOGLE FONTS -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">

        <link href= "communityList.css" type="text/css" rel="stylesheet" />
        <!-- ICONS -->
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    </head>


    <body>
	<%
		List<User> ulist = (List<User>) session.getAttribute("ulist");
		User user = (User)session.getAttribute("curUser");
	%>
       <!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>

			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>


				<div class="navbar-btn navbar-btn-right">
					<a class="btn btn-success update-pro" href="login.do?action=out" title="" target="">
						<i class="fa fa-rocket"></i>
						<span>退出登录</span></a>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->

		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
                <div class="sidebar-scroll">
                    <nav>
                        <ul class="nav">
                            
                            
                             <li>
                                <a href="login.do?action=reflash" class="active">
                                    <i class="lnr lnr-user"></i>
                                    <span>用户列表</span></a>
                            </li>

                            <li>
                                <a href="applicationReview.html" class="">
                                    <i class="lnr lnr-alarm"></i>
                                    <span>申请审核</span></a>
                            </li>

                            <li>
                                <a href="comList.html" class="">
                                    <i class="lnr lnr-dice"></i>
                                    <span>社团列表</span></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
		<!-- END LEFT SIDEBAR -->

		<div class="main">
          <!-- MAIN CONTENT -->
            <div class="main-content">
              <div class="container-fluid">
				  <h3 class="page-title">用户列表&nbsp <a href="login.do?action=reflash"><i class="lnr lnr-sync"></i></a></h3>

                            <div class="col-md-9"><!--搜索框+用户列表-->
                             
                                <!--
                                	描述：用户搜索框
                                -->
                                <form action="/login.do" method="post">
                                <div class="input-group">
										<input class="form-control" type="text" id="search" name="searchUname">
										<span class="input-group-btn"><button class="btn btn-primary" type="submit" name="action" value="search">搜索用户</button></span>
									</div>
								</form>
								
								<br>
								<br>
								<!--
                                	描述：用户信息列表
                                -->
                                <form action="#" method="get">
                                	<div class="panel">
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>ID</th>
												<th>用户名</th>
												<th>姓名</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
										<%
											for(User tUser : ulist)
											{
										%>
											<tr>
												<td><%=tUser.getStuNum()%></td>
												<td><%=tUser.getStuName()%></td>
												<td><%=tUser.getStuName()%></td>
												<td><a href="login.do?deleteNum=<%=tUser.getStuNum()%>&action=delete">删除</a></td>
											</tr>
										<%
											}
										%>
										</tbody>
									</table>
										</div>
									</div>
                                </form>
									
									
							</div>
                    </div>
                    
                  </div>
                </div>
             </div>


      
      <!-- Javascript -->
      <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
	  <script src="assets/vendor/jquery/jquery.min.js"></script>
	  <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	  <script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	  <script src="assets/scripts/klorofil-common.js"></script>
	  <script>
	     $("#btn-arrow").click(function(){

	     	$("#arrow").prev().toggle();
	     	if( $("#ico-arrow").hasClass("lnr-chevron-down"))
	     	   $("#ico-arrow").removeClass("lnr-chevron-down").addClass("lnr-chevron-up");
	     	else
	     		$("#ico-arrow").removeClass("lnr-chevron-up").addClass("lnr-chevron-down");



	     });
	  </script>
    </body>
</html>