<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 数据导入
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块导入月季数据，导入前请确认文件格式与数据模板一致;而且品种名不能重复，必填字段填写完整，否则导入失败。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">数据导入</div>
      
	  <form id="table-import" >
	  	<label for="roseFile">导入文件：</label>
	  	<input type="file" id="roseFile" name="importFile"/>
	  	<input id="roseImport" class="btn" type="submit" value="确定">
	  </form>
      
    </div> <!-- main-box -->

<script>
	/* 数据导入 */
 	document.getElementById("roseImport").onclick = function() {
	var xhr = new XMLHttpRequest();
	xhr.open("post","importRose",true);
	var form = document.getElementById("table-import");
	var fd = new FormData(form);
	xhr.send(fd); 
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) { //判断交互是否成功
			if(xhr.status == 200) { //获取服务器返回的数据
				if(xhr.responseText == "success") {
					alert("导入成功");
					//表单清空包括input和select
				} else if(xhr.responseText == "fail") {
					alert("导入失败");
				}
			} else {
				alert("Request was unsuccessful:"+xhr.status);
			}
		}
	}  
	return false;
	}   
</script>
<%@ include file="public/footer.jsp" %>