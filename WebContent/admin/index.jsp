<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="public/header.jsp" %> 
<%@ include file="public/aside.jsp" %> 

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 系统首页
    </span>
  </p>
  <div class="main">
    <div id="warning" class="warning">
      <p>欢迎使用 蔷薇花园 后台管理系统，如果您在使用过程中遇到什么问题可以联系我们，希望您使用愉快！</p>
      <i id="close" class="fa fa-close"></i>
    </div> <!-- warning -->
    
    <div class="main-box">
      <div class="box-title">系统首页</div>
      <div class="description">
        <p>
        本系统所有功能请参考左侧菜单，点击菜单将进入对应的管理页面。各个页面都有相应的版块说明，描述了该版块的内容、功能以及使用方法。本系统实行分级管理，管理员分为超级管理员、普通管理员。不同等级的管理员可以使用的功能有所不同。首页主要展示了网站的基本信息、服务器信息、系统开发信息。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">网站基本信息</div>
      <table>
        <tr>
          <td>月季总数：</td>
          <td><strong>${requestScope.rosecount }</strong></td>
          <td>蔷薇属原种：</td>
          <td><strong>${requestScope.rosecount2 }</strong></td>
          <td>古老月季：</td>
          <td><strong>${requestScope.rosecount3 }</strong></td>
          <td>现代月季：</td>
          <td><strong>${requestScope.rosecount1 }</strong></td>
        </tr>
        <tr>
          <td>用户总数：</td>
          <td><strong>${requestScope.usercount }</strong></td>
          <td>待审核用户：</td>
          <td><strong>${requestScope.registerusercount }</strong></td>
          <td>超级管理员：</td>
          <td><strong>2</strong></td>
          <td>普通管理员：</td>
          <td><strong>${requestScope.admincount }</strong></td>
        </tr>
      </table>
    </div> <!-- main-box -->

    <div class="left-box">
      <div class="box-title">服务器信息</div>
      <table>
        <tr>
          <td>JSP 版本：</td>
          <td>2.0</td>
          <td>MYSQL 版本：</td>
          <td>5.6</td>
        </tr>
        <tr>
          <td>服务器操作系统：</td>
          <td>Windons</td>
          <td>Web 服务器：</td>
          <td>Tomcat 7.0</td>
        </tr>
        <tr>
          <td>文件上传限制：</td>
          <td>2M</td>
          <td>GD 库支持：</td>
          <td>是</td>
        </tr>
      </table>
    </div> <!-- left-box -->

    <div class="right-box">
      <div class="box-title">系统开发</div>
      <table>
        <tr>
          <td>github地址：</td>
          <td>http://github/sunmaer/roseManage</td>
        </tr>
        <tr>
          <td>开发人员：</td>
          <td>孙梦海&nbsp;&nbsp; <i class="fa fa-qq"></i> 878131732&nbsp;&nbsp; <i class="fa fa-wechat"></i> SMH878131732 </td>
        </tr>
        <tr>
          <td>开发人员：</td>
          <td>段理政&nbsp;&nbsp; <i class="fa fa-qq"></i> 1025360660&nbsp;&nbsp; <i class="fa fa-wechat"></i> dlz1025 </td>
        </tr>
        
      </table>
    </div> <!-- right-box -->
    
    <script>

      /* 警告框关闭 */
      document.getElementById("close").addEventListener("click",function() {
        document.getElementById("warning").style.display = "none";
      },false);
      
    </script>

<%@ include file="public/footer.jsp" %>