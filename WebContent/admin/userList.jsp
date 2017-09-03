<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 用户管理
	    <i class="fa fa-angle-right fa-lg"></i> 用户列表
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看所有的用户，超级管理员和普通管理员可以删除用户， <i class="fa fa-trash fa-lg"></i> 表示批量删除用户；超级管理员还可以将用户提升为普通管理员。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">用户列表
      </div>
      
      <table id="table-user" class="userList list">
      	<tr>
      		<th><input id="multiChecked" type="checkBox"></th>
      		<!-- <th>#</th> -->
      		<th>学/工号</th>
      		<th>用户名</th>
      		<th>手机号码</th>
      		<th>操作</th>
      	</tr>
        <c:forEach items="${requestScope.users}" var="user" >
           
               <tr>
              <td><input type="checkBox"></td>
             
              <td>${user.uid }</td>           
              <td>${user.name }</td>
              <td>${user.telephone }</td>
              <% if(role.equals("超级管理员")){%>
	       		<td class="action userAction">
              		<a class="promoteUser" href="javascript:void(0);">设置管理员</a><!--
              		--><a class="deleteUser" href="javascript:void(0);">删除</a>
              	</td>
	          <%} else {%>
              	<td class="action">
              		<a class="deleteUser" style="border: none;" href="javascript:void(0);">删除</a>
              	</td>
              <%}%>
             </tr>
                       
        </c:forEach>
        <tr class="tfoot">
        	<td id="multiDelete" class="multiDelete" title="批量删除"> <i class="fa fa-trash fa-lg"></i> </td>
		  	<td class="page" colspan="11">
		  		共${page.totalCount}条记录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条记录&nbsp;
		  		<c:choose>
		  		<c:when test="${requestScope.page.hasPrePage}">
              		<a href="userList?currentPage=1">首页</a> | 
              		<a href="userList?currentPage=${page.currentPage - 1}">上一页</a> | 
             	</c:when>
             	<c:otherwise>
             		首页  | 上一页  | 
             	</c:otherwise>
             	</c:choose>
             	<c:choose>
             	<c:when test="${requestScope.page.hasNextPage}">
              		<a href="userList?currentPage=${page.currentPage + 1}">下一页</a> | 
              		<a href="userList?currentPage=${page.totalPage}">尾页</a>
             	</c:when>
             	<c:otherwise>
             		下一页  | 尾页
             	</c:otherwise>
             	</c:choose>
		  	</td>
        </tr>
      </table>
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
		document.getElementById("table-user").onclick = function( e ) {
        e = e || window.event;
        var t = e.target || e.srcElement;  //t:目标对象
        var className = t.className;//class名称
         if( className == "promoteUser" ) { //设置管理员
        	var table = t.parentNode.parentNode.parentNode;
        	var tr = t.parentNode.parentNode;
        	var uid = tr.childNodes[3].innerText;
        	console.log("用户ID："+uid);
        	
 			var r=confirm("是否确定提升该用户为管理员？");
 			if (r==true)
 			{
 				//判断用户是否已经是管理员
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","isAdminID",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("uid="+uid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							if(xhr.responseText == "success") {
 								alert("该用户已经是管理员");
 							} else if(xhr.responseText == "fail") {
 								
 								//提升用户为管理员
 								var xhr1 = new XMLHttpRequest();
 								xhr1.open("post","promoteUser",true);
 								xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				 				xhr1.send("uid="+uid);
 				 				xhr1.onreadystatechange = function() {
 				 					if(xhr1.readyState == 4) { //判断交互是否成功
 				 						if(xhr1.status == 200) { //获取服务器返回的数据 
 				 							if(xhr1.responseText == "success") {
 				 								alert("设置成功");
 				 							} else if(xhr1.responseText == "fail") {
 				 								alert("设置失败");
 				 							}
 				 						
 				 						} else {
 				 							alert("Request was unsuccessful:"+xhr1.status);
 				 						}
 				 					}
 				 				}
 							}
 						
 						} else {
 							alert("Request was unsuccessful:"+xhr.status);
 						}
 					}
 				}
 			} 
          } else if( className == "deleteUser" ) { //單個刪除用戶
	          	var table = t.parentNode.parentNode.parentNode;
	        	var tr = t.parentNode.parentNode;
	        	var uid = tr.childNodes[3].innerText;
	        	console.log("删除用户ID："+uid);
	        	
	 			var r=confirm("是否确定删除该用户？");
	 			if (r==true)
	 			{
	 				//建立XMLHttpRequest对象
	 				var xhr = new XMLHttpRequest();
	 				//使用OPEN方法与服务器建立连接
	 				xhr.open("post","deleteUser",true);
	 				//向服务器端发送数据
	 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 				xhr.send("uid="+uid);
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
        
        /* 批量删除用户*/
        document.getElementById("multiDelete").onclick = function() {
        	var uids = new Array();
        	var uid;
        	var trs = document.getElementsByTagName("tr");
        	for (var i=1;i<trs.length-1;i++) {
        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
            		uids.push(trs[i].childNodes[3].innerText);
            	}
        	}
        	/* 数组转换为字符串 */
        	uid = uids.join('-');
        	console.log(uid);
        	
        	var r=confirm("是否确定批量删除用户？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiDeleteUser",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("uids="+uid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							if(xhr.responseText == "success") {
 								//因为NodeList的时效性，所以从末尾开始删除
 								/* for (var i=trs.length-1;i>0;i--) {
 					        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
 						        		trs[i].parentNode.removeChild(trs[i]);
 						            }
 						        } */
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