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
	    <i class="fa fa-angle-right fa-lg"></i> 月季筛选
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看筛选的月季品种，并且可以对月季进行增加、修改、删除等操作， <i class="fa fa-trash fa-lg"></i> 表示批量删除。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">月季筛选
		<a class="add" href="roseList"> <i class="fa fa-reply"></i> &nbsp;返回上一层</a>
      </div>
      
	  <form action=""  id="table-rose">
      <table class="list">
      	<tr>
      		<th><input id="multiChecked" type="checkBox"></th>
      		<th>#</th>
      		<th>品种名</th>
      		<th>分类</th>
      		<th>株型</th>
      		<th>株高</th>
      		<th>评论</th>
      		<th>操作</th>
      	</tr>
      	<c:forEach items="${requestScope.roselist}" var="rose" >
	      <tr>
	     	 <td><input type="checkBox"></td>
              <td>${rose.rid }</td>
              <td>${rose.specie }</td>
              <td>${rose.classification }</td>
              <td>${rose.height }</td> 
              <td>${rose.type }</td>
              <td class="action">
              	<a style="border: none;" href="commentList?rid=${rose.rid}">浏览</a>
              </td>     
              <td class="action">
              	<a href="findRose?rid=${rose.rid}">编辑</a>
              	<a href="javascript:void(0);" class="deleteRose">删除</a>
              </td>
	      </tr>
	      </c:forEach> 
	      <tr class="tfoot">
	      <td id="multiDelete" class="multiDelete" title="批量删除"> <i class="fa fa-trash fa-lg"></i> </td>
			  <td colspan="8" class="page">
			  		共${page.totalCount}条记录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条记录&nbsp;
			  		<c:choose>
			  		<c:when test="${request.page.hasPrePage}">
               		<a href="roseList?currentPage=1">首页</a> | 
               		<a href="roseList?currentPage=${page.currentPage - 1}">上一页</a> | 
              		</c:when>
              		<c:otherwise>
              		首页 | 上一页 | 
              		</c:otherwise>
              		</c:choose>
              		<c:choose>
              		<c:when test="${request.page.hasNextPage}">
               		<a href="roseList?currentPage=${page.currentPage + 1}">下一页</a> | 
               		<a href="roseList?currentPage=${page.totalPage}">尾页</a>
              		</c:when>
              		<c:otherwise>
              		下一页 | 尾页
              		</c:otherwise>
              		</c:choose>
			  	</td>
		 </tr>	  
      </table>
      </form>
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