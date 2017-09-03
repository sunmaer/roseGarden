<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>蔷薇花园</title> 
    <meta name="keywords" content="月季, 植物, 蔷薇花园, 华中农业大学园艺园林学院"> 
	<meta name="description" content="蔷薇花园，赠人玫瑰，手有余香。">
	<link rel="shortcut icon" href="<%=path%>/images/rose.ico" mce_href="<%=path%>/images/rose.ico" type="image/x-icon">
    <!-- css reset -->
    <link href="css/reset-rose.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
  </head>
  <body>

    <!-- 登录注册弹出框 -->
    <div id="login-mask" class="mask">
      <div class="login-box">
        <div class="login-nav">
          <a id="item-login" class="active" href="javascript:void(0);">登录</a>
          <a id="item-register" href="javascript:void(0);">注册</a>
          <i id="close-box" class="fa fa-close fa-lg"></i>
        </div>
        <form id="login-form" class="login-form">
          <input id="loginUid" name="uid" type="text" placeholder="请输入登录学/工号">
          <input id="loginPassword" name="password" type="password" placeholder="请输入登录密码">
          <input type="submit" value="登录">
        </form>
        <form id="register-form" class="login-form">
          <input id="registerUid" name="uid" type="text" placeholder="请输入注册学/工号">
          <input name="name" type="text" placeholder="请输入用户名">
          <input id="registerPassword" name="password" type="password" placeholder="请输入注册密码">
          <input name="conPassword" type="password" placeholder="请确认注册密码">
          <input name="telephone" type="text" placeholder="请输入手机号码">
          <input type="submit" value="注册">
        </form>
      </div>
    </div>
   

    <div id="top-nav">
      <div class="top-container">
        <p class="welcome">欢迎您访问蔷薇花园&nbsp;&nbsp;赠人玫瑰&nbsp;&nbsp;手有余香！</p>
        <ul>
            <!-- 用户权限，通过判断session来控制界面  -->
            <% String uid = ((String)session.getAttribute("uid"));
	            String login,user,showTheme,hideTheme,showDiscuss,hideDiscuss;
	            if(uid==null){
		          	login = "style = \'display: inline-block\'";
		          	user = "style = \'display: none\'";
		          	showTheme = "style = \'display: none\'";
		          	hideTheme = "style = \'display: table-row\'";
		          	showDiscuss = "style = \'display: none\'";
		          	hideDiscuss = "style = \'display: block\'";
		       } else { 
	          		login = "style = \'display: none\'";
		          	user = "style = \'display: inline-block\'";
		          	showTheme = "style = \'display: table-row\'";
		          	hideTheme = "style = \'display: none\'";
		          	showDiscuss = "style = \'display: block\'";
		          	hideDiscuss = "style = \'display: none\'";
          	} %>
          	<li <%= login %> id="isLogin"><a id="login" href="javascript:void(0);">登录</a> / <a id="register" href="javascript:void(0);">注册</a></li>
          	<li <%= user %>><span id="userName"></span></li>
          	<li <%= user %>><a id="admin" href="userInfo">个人中心</a></li>
           	<li <%= user %>><a href="myFavorite"><!--  <i class="fa fa-heart"></i>  -->我的收藏</a></li>
           	<li <%= user %>><a href="userOut">注销登录</a></li>
        </ul>
      </div>
    </div>

    <div class="container"> 
      <header>
        <a href="" id="site-index">
          <img src="images/logo.png" alt="蔷薇花园">
          <!-- <h3>蔷薇花园</h3> -->
        </a>
        <div class="search">
          <form id="roseSearch">
          	<input type="text" id="search-specie" name="specie" placeholder="请输入月季中文名或拼音首字母"><i id="all-search" class="fa fa-search"></i>
          </form>
        </div>
      </header> 
