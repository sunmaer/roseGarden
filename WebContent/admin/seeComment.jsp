<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 月季管理
	    <i class="fa fa-angle-right fa-lg"></i> 月季列表
	    <i class="fa fa-angle-right fa-lg"></i> 月季评论
	    <i class="fa fa-angle-right fa-lg"></i> 评论内容
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
       		 你可以在本版块查看具体评论内容，但是不能对评论内容进行修改。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">评论内容
		<a class="add" href="javascript:void(0);" onClick="javascript :history.back(-1);"> <i class="fa fa-reply"></i> &nbsp;返回上一层</a>
      </div>
      
      <table class="see addRose list">
      <tr>
          <td>评论月季</td>
          <td><input type="text" value="${comment.specie }" readonly="readonly"></td>
        </tr>
        <tr>
          <td>评论者</td>
          <td><input type="text" value="${comment.name }" readonly="readonly"></td>
        </tr>
        <tr>
          <td>学/工号</td>
          <td><input type="text" value="${comment.uid }"readonly="readonly"></td>
        </tr>
        <tr>
          <td>时间</td>
          <td><input type="text"  value="${comment.time }" readonly="readonly"></td>
        </tr>
		<tr>
		  <td class="valign-top" valign="top">评论内容</td>
		  <td>
		  	<textarea readonly="readonly">${comment.content}  </textarea>
		  </td>
		</tr>

      </table>
    </div> <!-- main-box -->

<%@ include file="public/footer.jsp" %>