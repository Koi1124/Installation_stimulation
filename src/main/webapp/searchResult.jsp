<%--
  Created by IntelliJ IDEA.
  User: 林
  Date: 2018/7/10
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="service.CommunityService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User client=(User)session.getAttribute("curUser");
    CommunityService communityService=new CommunityService();
%>
<html>
<head>
    <title>社团部落-查询结果</title>
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

    <link href= "assets/css/communityList.css" type="text/css" rel="stylesheet" />
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>


<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="homepage.jsp"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>

        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>

            <form class="navbar-form navbar-left" action="Search" method="post">
                <div class="input-group">
                    <input type="text" value="" name="search" class="form-control" placeholder="请输入要查询的内容">
                    <span class="input-group-btn">
                                <button type="submit" class="btn btn-primary">搜索</button></span>
                </div>
            </form>

            <div class="navbar-btn navbar-btn-right">
                <a class="btn btn-success update-pro" href="login.do?action=out" title="Upgrade to Pro" target="_blank">
                    <i class="fa fa-rocket"></i>
                    <span>退出登录</span></a>
            </div>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
                            <i class="lnr lnr-alarm"></i>
                            <span class="badge bg-danger">5</span>
                        </a>
                        <ul class="dropdown-menu notifications">
                            <li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
                            <li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
                            <li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
                            <li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
                            <li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
                            <li><a href="#" class="more">See all notifications</a></li>
                        </ul>
                    </li>


                    <li class="dropdown">
                        <a href="UserInfo.jsp">
                            <img src="<%=client.getStuSrc()%>" class="img-circle" alt="Avatar">
                            <span><%=client.getuName()%></span>
                        </a>

                    </li>
                </ul>
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
                        <a href="homepage.jsp" class="">
                            <i class="lnr lnr-home"></i>
                            <span>主页</span></a>
                    </li>
                    <li>
                        <a href="Community.jsp" class="">
                            <i class="lnr lnr-location"></i>
                            <span>我的社团</span></a>
                    </li>

                    <li>
                        <a href="UserInfo.jsp" class="">
                            <i class="lnr lnr-cog"></i>
                            <span>个人信息</span></a>
                    </li>
                    <li>
                        <a href="CommunityList.jsp" class="">
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
                <h3 class="page-title">搜索结果</h3>
                <!-- 搜索到的用户 -->
                <div class="col-md-10">
                    <h4>用户</h4></br>
                    <form method="post" action="User">
                        <div class="panel">
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th >用户名</th>
                                        <th >姓名</th>
                                        <th style="width:200px;">学校</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int j=0;j<(Integer) request.getAttribute("usercount");j++){
                                    %>
                                    <tr>
                                        <td>
                                            <a href=User?stuNum=<%=request.getAttribute("num"+j)%>> <%=request.getAttribute("username"+j)%></a>
                                        </td>
                                        <td><%=request.getAttribute("name"+j)%></td>
                                        <td><%=request.getAttribute("school"+j)%></td>
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
                <!-- 搜索到的活动 -->
                <div class="col-md-10">
                    <h4>活动</h4></br>
                    <form method="post" action="Activity">
                        <div class="panel">
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th >标题</th>
                                        <th >发布社团</th>
                                        <th style="width:200px;">发布时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int k=0;k<(Integer)request.getAttribute("actcount");k++){ String commName=communityService.getCNameByCommID((String)request.getAttribute("coNum"+k));
                                    %>
                                    <tr>
                                        <td>
                                            <a href="Activity?aNum=<%=request.getAttribute("actNum"+k)%>" target="_blank"> <%=request.getAttribute("actTitle"+k)%></a>
                                        </td>
                                        <td><%=commName%></td>
                                        <td><%=request.getAttribute("actDate"+k)%></td>
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


                <!-- 搜索到的社团 -->

                <div class="col-md-10">
                    <h4>社团</h4></br>
                    <form action="Community">
                        <input type="hidden" name="type" value="normal">
                     <%
                         for(int m=0;m<(Integer) request.getAttribute("comcount");m++){
                             int state=communityService.getUStateByNum(client.getStuNum(),(String) request.getAttribute("cNum"+m));

                             if (state==3){}
                             else {
                     %>

                        <div class="panel" style="border-radius: 5px 5px 0 0;">
                            <div style="background-color: #CCCCCC ;border-radius: 5px 5px 0 0;">

                                <div align="right">
                                    <%
                                        if (state==2){
                                    %>
                                    <button type="button" class="btn btn-success">
                                        加入</button>
                                    <%
                                        } else if (state==1) {
                                    %>
                                    <button type="button" class="btn btn-default" disabled="disabled">已加入</button>
                                    <%
                                    }else if (state==0){
                                    %>
                                    <button type="button" class="btn btn-default" disabled="disabled">申请审核中</button>
                                    <%
                                        }
                                    %>
                                    <button type="submit" name="getCNum" class="btn btn-info" value="<%=(String) request.getAttribute("cNum"+m)%>">
                                        更多</button>
                                </div>
                            </div>

                            <div class="panel-heading">
                                <h3 class="panel-title"><%=request.getAttribute("cName"+m)%></h3>
                            </div>

                            <div class="panel-body" style="display: none;">
                                <div style="display: inline-block ">
                                    <img src="<%=request.getAttribute("cSrc"+m)%>" height="120" width="120" style="vertical-align: -120%" />
                                </div>
                                <div style="display: inline-block  " align="left" >
                                    <span class="label label-success">类型</span>
                                    <a><%=request.getAttribute("cType"+m)%></a>
                                    </br>
                                    <span class="label label-warning">成立时间</span>
                                    <a><%=request.getAttribute("cStartTime"+m)%></a>
                                    </br>
                                </div>

                                <div></br>
                                    <span class="label label-info">简介</span>
                                    <a><%=request.getAttribute("Syn"+m)%></a>
                                </div>
                            </div>

                            <div id="arrow<%=m%>" class="arrow">
                                <button type="button" id="btn-arrow<%=m%>" class=" btn-arrow" >
                                    <i id="ico-arrow<%=m%>" class="lnr lnr-chevron-down "></i>
                                </button>
                            </div>
                        </div><!-- END PANEL -->
                        <%
                                }
                         }
                        %>
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
        <%
         for (int i=0;i<(Integer) request.getAttribute("comcount");i++) {
         %>
        $("#btn-arrow<%=i%>").click(function(){

            $("#arrow<%=i%>").prev().toggle();
            if( $("#ico-arrow<%=i%>").hasClass("lnr-chevron-down"))
                $("#ico-arrow<%=i%>").removeClass("lnr-chevron-down").addClass("lnr-chevron-up");
            else
                $("#ico-arrow<%=i%>").removeClass("lnr-chevron-up").addClass("lnr-chevron-down");
        });
        <%
        }
        %>
    </script>
</body>
</html>