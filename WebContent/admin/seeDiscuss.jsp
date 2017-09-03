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
	    <i class="fa fa-angle-right fa-lg"></i> 帖子评论
	    <i class="fa fa-angle-right fa-lg"></i> 评论内容
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
       		 你可以在本版块查看具体的帖子评论内容，但是不能对评论内容进行修改。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">评论内容
			<a class="add" href="javascript:void(0);" onClick="javascript :history.back(-1);"> <i class="fa fa-reply"></i> &nbsp;返回上一层</a>
      </div>
   
      <table class="see addRose list">
        <tr>
          <td>评论者</td>
          <td><input id="specie" name="specie" type="text" value="${discuss.name }" readonly="readonly"></td>
        </tr>
        <tr>
          <td>学/工号</td>
          <td><input id="specie" name="specie" type="text" value="${discuss.uid }" readonly="readonly"></td>
        </tr>
        <tr>
          <td>主题</td>
          <td><input id="specie" name="specie" type="text" value=" ${discuss.theme }" readonly="readonly"></td>
        </tr> 
        <tr>
          <td>时间</td>
          <td><input id="specie" name="specie" type="text" value=" ${discuss.time }" readonly="readonly"></td>
        </tr>
		<tr>
		  <td class="valign-top" valign="top">评论内容</td>
		  <td>
		  	<textarea name="remark" id="remark" readonly="readonly">${discuss.content }</textarea>
		  </td>
		</tr>

      </table>
    </div> <!-- main-box -->

<%@ include file="public/footer.jsp" %>