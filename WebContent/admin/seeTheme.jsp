<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 论坛管理
	    <i class="fa fa-angle-right fa-lg"></i> 帖子列表
	    <i class="fa fa-angle-right fa-lg"></i> 帖子内容
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看具体的帖子内容，但是不能对帖子内容进行修改。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">帖子内容
		<a class="add" href="javascript:void(0);" onClick="javascript :history.back(-1);"> <i class="fa fa-reply"></i> &nbsp;返回上一层</a>
      </div>
      
      <table class="see addRose list">
      	<tr>
          <td>用户名</td>
          <td><input type="text" readonly="readonly" value="${theme.name }"></td>
        </tr>
        <tr>
          <td>学/工号</td>
          <td><input type="text" readonly="readonly" value="${theme.uid}"></td>
        </tr>
        <tr>
          <td>主题</td>
          <td><input type="text" readonly="readonly" value="${theme.theme }"></td>
        </tr>
        <tr>
          <td>时间</td>
          <td><input type="text" readonly="readonly" value="${theme.time }"></td>
        </tr>
		<tr>
		  <td class="valign-top" valign="top">内容</td>
		  <td>
		  	<textarea name="remark" id="remark" readonly="readonly">${theme.content }</textarea>
		  </td>
		</tr>

      </table>
    </div> <!-- main-box -->

<%@ include file="public/footer.jsp" %>