<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="public/header.jsp" %> 
      <nav id="all-nav">
        <% if(!(uid==null)){%>
          	<ul style="width: 650px;" class="all-action">
          <%} else {%>
          	<ul style="width: 520px;" class="all-action">
          <%}%>
        
          <li><a class="all-nav-a" href="home/index.jsp">主页</a></li>
          <li><a class="all-nav-a" href="home/chineseIndex.jsp">中文索引</a></li>
          
          <% if(!(uid==null)){%>
          	<li><a class="all-nav-a" href="home/seniorIndex.jsp">高级检索</a></li>
          <%}%>
          <li><a class="all-nav-a" href="showTheme">月季论坛</a></li>
          <li><a class="all-nav-a" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main">
	    <div class="admin rose">
            <h4>个人信息</h4>
            <span style="line-height: 25px;font-size: 12px;">个人信息修改成功后会跳转到首页，请重新登录</span>
	        <form id="admin-form" class="login-form">
	          <input name="uid" type="text" disabled="disabled" placeholder="学号" value="${user.uid }">
	          <input name="name" type="text" value="${user.name }" placeholder="用户名">
	          <input id="adminPassword" name="password"  type="password" placeholder="请输入新密码">
	          <input name="conPassword" type="password" placeholder="请确认新密码">
	          <input name="telephone" type="text" value="${user.telephone }" placeholder="手机号码">
	          <input type="submit" value="确认修改">
	        </form>
	      </div>
	    </div>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
      
<%@ include file="public/footer.jsp" %>