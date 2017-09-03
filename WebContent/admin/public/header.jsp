<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>蔷薇花园 管理中心</title>  
	<link rel="shortcut icon" href="<%=path%>/images/rose.ico" mce_href="<%=path%>/images/rose.ico" type="image/x-icon">
    <!-- css reset -->
    <link href="css/reset-rose.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
  </head>
  <body>
  
    <header>
      <div class="logo">
        <a href=""> <i class="fa fa-leaf"></i> &nbsp;&nbsp;蔷薇花园 </a>
      </div>

      <nav>
        <ul class="ul-left">
          <li><a href="home/index.jsp">前台首页</a></li>
          <li><a href="admin/roseImport.jsp">数据导入</a></li>
          <li><a href="roseExport">数据导出</a></li>
          <li><a  href="datamodel.xls">数据模板</a></li>
        </ul>

        <ul class="ul-right">
          <li><a href="javascript:void(0);">${sessionScope.admin.role }</a></li>
          <li><a href="javascript:void(0);">${sessionScope.admin.aid }  &nbsp;<i class="fa fa-caret-down fa-lg"></i></a>
            <div class="admin-action">
              <a href="findAdmin">个人中心</a>
              <a href="adminLoginOut">注销登录</a>
            </div>
          </li>
          <li><a href="adminLoginOut">退出</a></li>
        </ul>
      </nav>
    </header>
