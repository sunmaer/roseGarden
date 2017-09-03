<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 月季管理
	    <i class="fa fa-angle-right fa-lg"></i> 月季列表
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看所有的月季品种，并且可以分类显示月季，还可以根据筛选条件搜索具体的月季品种，还可以对月季进行增加、修改、删除等操作， <i class="fa fa-trash fa-lg"></i> 表示批量删除。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">月季列表
		<!-- <a class="add" href="roseList"> <i class="fa fa-reply"></i> &nbsp;返回上一层</a> -->
      </div>
      
      <div class="search">
      	<div>
      	<form  action="searchRoseBySpecie" method="post">
      		<input id="specie" name="specie" type="text" placeholder="品种名">
      		<input id="search" class="btn" type="submit" value="搜索">
      	</form>
      	</div>
      </div> <!-- search -->
	  <p class="search-error">对不起，未搜索到相应品种的月季，请尝试重新搜索。</p>
    </div> 


	<script>
		/* 复选框批量选中 */
		var multiCheckBox = document.getElementById("multiChecked");
		var trs = document.getElementsByTagName("tr");
		multiCheckBox.addEventListener("click",function() {
			for (var i=1;i<trs.length-1;i++) {
				if(multiCheckBox.checked) {
					trs[i].childNodes[1].childNodes[0].checked = true;
				} else {
					trs[i].childNodes[1].childNodes[0].checked = false;
				}
			}
		},false);
		
		/* 分类显示月季 */
		document.getElementById("classification").onchange = function() {
			document.getElementById("table-class").submit();
		}
		
		/* 事件委托  */
		document.getElementById("table-rose").onclick = function( e ) {
        e = e || window.event;
        var t = e.target || e.srcElement;  //t:目标对象
        var className = t.className;//class名称
         if( className == "deleteRose" ) { //单个删除月季
	          	var table = t.parentNode.parentNode.parentNode;
	        	var tr = t.parentNode.parentNode;
	        	var rid = tr.childNodes[3].innerText;
	        	console.log("删除月季ID："+rid);
	        	
	 			var r=confirm("是否确定删除该月季？");
	 			if (r==true)
	 			{
	 				//建立XMLHttpRequest对象
	 				var xhr = new XMLHttpRequest();
	 				//使用OPEN方法与服务器建立连接
	 				xhr.open("post","deleteRose",true);
	 				//向服务器端发送数据
	 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 				xhr.send("rid="+rid);
	 				//回调函数中针对不同的响应状态进行处理 
	 				xhr.onreadystatechange = function() {
	 					if(xhr.readyState == 4) { //判断交互是否成功
	 						if(xhr.status == 200) { //获取服务器返回的数据 
	 							if(xhr.responseText == "success") {
	 								/* table.removeChild(tr); */
	 								//重新刷新页面
	 								window.location.reload();
	 							} else if(xhr.responseText == "fail") {
	 								alert("删除失败！");
	 							}
	 						
	 						} else {
	 							alert("Request was unsuccessful:"+xhr.status);
	 						}
	 					}
	 				}
	 			} 
          }
        };
        
        /* 批量删除月季*/
        document.getElementById("multiDelete").onclick = function() {
        	var rids = new Array();
        	var rid;
        	var trs = document.getElementsByTagName("tr");
        	for (var i=1;i<trs.length-1;i++) {
        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
            		rids.push(trs[i].childNodes[3].innerText);
            	}
        	}
        	/* 数组转换为字符串 */
        	rid = rids.join('-');
        	console.log(rid);
        	
        	var r=confirm("是否确定批量删除月季？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiDeleteRose",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("rids="+rid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							if(xhr.responseText == "success") {
 								//重新刷新页面
 								window.location.reload();
 						        for (var i=1;i<trs.length-1;i++) {
 									trs[i].childNodes[1].childNodes[0].checked = false;
 								}
 							} else if(xhr.responseText == "fail") {
 								alert("删除失败！");
 							}
 						
 						} else {
 							alert("Request was unsuccessful:"+xhr.status);
 						}
 					}
 				}
 			}
        };
	</script>

<%@ include file="public/footer.jsp" %>