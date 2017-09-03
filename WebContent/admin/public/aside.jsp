<%@page import="po.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<aside>
  <ul class="sideBar">
    <li><a href="findInfo"><i class="fa fa-home"></i>系统首页</a></li>

    <li class="submenu"><a href="javascript:void(0);"><i class="fa fa-folder"></i>月季管理  
      <i class="fa fa-angle-down fa-lg"></i> </a>
      <ul>
        <li><a href="roseList"><i class="fa fa-caret-right"></i>月季列表</a></li>
        <li><a href="admin/addRose.jsp"><i class="fa fa-caret-right"></i>添加月季</a></li>
      </ul>
    </li>

    <li class="submenu"><a href="javascript:void(0);"><i class="fa fa-file-text"></i>论坛管理
      <i class="fa fa-angle-down fa-lg"></i> </a>
      <ul>
        <li><a href="themeList"><i class="fa fa-caret-right"></i>帖子列表</a></li>
      </ul>
    </li>
    
    <li class="submenu"><a href="javascript:void(0);"><i class="fa fa-users"></i>用户管理
      <i class="fa fa-angle-down fa-lg"></i> </a>
      <ul>
        <li><a href="registerUserList"><i class="fa fa-caret-right"></i>用户审核</a></li>
        <li><a href="userList"><i class="fa fa-caret-right"></i>用户列表</a></li>
        <li><a href="admin/addUser.jsp"><i class="fa fa-caret-right"></i>添加用户</a></li>
      </ul>
    </li>

    <li class="submenu"><a href="javascript:void(0);"><i class="fa fa-cog"></i>管理员
      <i class="fa fa-angle-down fa-lg"></i> </a>
      <ul>
        <li><a href="findAdmin"><i class="fa fa-caret-right"></i>个人中心</a></li>
        
   		<!-- 获取管理员权限,超级管理员才拥有以下权限 -->
		<% String role = ((Admin)session.getAttribute("admin")).getRole();
		if(role.equals("超级管理员")){%>
       		<li><a href="adminList"><i class="fa fa-caret-right"></i>管理员列表</a></li>
       		<li><a href="admin/addAdmin.jsp"><i class="fa fa-caret-right"></i>添加管理员</a></li>
        <%}%>
      </ul>
    </li>
  </ul>
  <span id="closeBar"><i id="closeLogo" class="fa fa-caret-left"></i></span>
</aside>

    