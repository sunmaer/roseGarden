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
	    <i class="fa fa-angle-right fa-lg"></i> 月季评论
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看所有的用户对   <strong>${requestScope.comments[0].specie}</strong> 的评论，并且可以对非法评论进行删除操作， <i class="fa fa-trash fa-lg"></i> 表示批量删除。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">评论列表
      	<a class="add" href="roseList"> <i class="fa fa-reply"></i> &nbsp;返回上一层</a>
      </div>
    <form id="table-comment" method="post">
      <table class="fixed list">
      	<tr>
      		<th><input id="multiChecked" type="checkBox"></th>
      		<th>#</th>
      		<th>用户名</th>
      		<th>月季品种名</th>
      		<th class="content">评论内容</th>
      		<th>时间</th>
      		<th>操作</th>
      	</tr>
        <c:forEach items="${requestScope.comments}" var="comment">
            <tr>
              <td><input type="checkBox"></td>
              <td>${comment.cid }</td>
              <td>${comment.name }</td>
              <td>${comment.specie }</td>
              <td>${comment.content }</td>
              <td>${comment.time }</td>
              <td class="action">
              	<a href="showComment?cid=${comment.cid }">查看</a><!--
              	--><a class="deleteComment" href="javascript:void(0);">删除</a>
              </td>
            </tr>
        </c:forEach>
        <tr class="tfoot">
        	<td id="multiDelete" class="multiDelete" title="批量删除"> <i class="fa fa-trash fa-lg"></i> </td>
		  	<td class="page" colspan="11">
		  		共${page.totalCount}条记录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条记录&nbsp;
		  		<c:choose>
		  		<c:when test="${requestScope.page.hasPrePage}">
              		<a href="commentList?currentPage=1">首页</a> | 
              		<a href="commentList?currentPage=${page.currentPage - 1}">上一页</a> | 
             	</c:when>
             	<c:otherwise>
             		首页  | 上一页  | 
             	</c:otherwise>
             	</c:choose>
             	<c:choose>
             	<c:when test="${requestScope.page.hasNextPage}">
              		<a href="commentList?currentPage=${page.currentPage + 1}">下一页</a> | 
              		<a href="commentList?currentPage=${page.totalPage}">尾页</a>
             	</c:when>
             	<c:otherwise>
             		下一页  | 尾页
             	</c:otherwise>
             	</c:choose>
		  	</td>
        </tr>
      </table>
      </form>
    </div> <!-- main-box -->

	
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
		
		/* 事件委托  */
		document.getElementById("table-comment").onclick = function( e ) {
        e = e || window.event;
        var t = e.target || e.srcElement;  //t:目标对象
        var className = t.className;//class名称
         if( className == "deleteComment" ) { //单个删除评论
	          	var table = t.parentNode.parentNode.parentNode;
	        	var tr = t.parentNode.parentNode;
	        	var cid = tr.childNodes[3].innerText;
	        	console.log("删除评论ID："+cid);
	        	
	 			var r=confirm("是否确定删除该评论？");
	 			if (r==true)
	 			{
	 				//建立XMLHttpRequest对象
	 				var xhr = new XMLHttpRequest();
	 				//使用OPEN方法与服务器建立连接
	 				xhr.open("post","deleteComment",true);
	 				//向服务器端发送数据
	 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 				xhr.send("cid="+cid);
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
        
        /* 批量删除评论*/
        document.getElementById("multiDelete").onclick = function() {
        	var cids = new Array();
        	var cid;
        	var trs = document.getElementsByTagName("tr");
        	for (var i=1;i<trs.length-1;i++) {
        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
            		cids.push(trs[i].childNodes[3].innerText);
            	}
        	}
        	/* 数组转换为字符串 */
        	cid = cids.join('-');
        	console.log(cid);
        	
        	var r=confirm("是否确定批量删除评论？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiDeleteComment",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("cids="+cid);
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