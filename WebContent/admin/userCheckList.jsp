<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 用户管理
	    <i class="fa fa-angle-right fa-lg"></i> 用户审核
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
       		 你可以在本版块审核注册用户, <i class="fa fa-check fa-lg"></i> 表示批量通过， <i class="fa fa-close fa-lg"></i> 表示批量拒绝。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">审核列表
		<!-- <a class="add" href=""> <i class="fa fa-plus"></i> &nbsp;增加月季</a> -->
      </div>
      
      <table id="table-resgister" class="list">
      	<tr>
      		<th><input id="multiChecked" type="checkBox"></th>
      		<!-- <th>#</th> -->
      		<th>学/工号</th>
      		<th>用户名</th>
      		<th>手机号码</th>
      		<th>操作</th>
      	</tr>
      	<c:forEach items="${requestScope.registerUsers}" var="registeruser" varStatus="status">
           <c:if test="${status.count%2==0}" >
               <tr style="background-color: #F0F0F0;">
              <td><input type="checkBox"></td>
             <%--  <td>${status.count }</td> --%>
              <td>${registeruser.uid }</td>
              <td>${registeruser.name }</td>
              <td>${registeruser.telephone }</td>
              <td class="action">
              	<a class="passUser" href="javascript:void(0);">通过</a><!--
              	--><a class="refuseUser" href="javascript:void(0);">拒绝</a>
              </td>
            </tr>
            </c:if>
            <c:if test="${status.count%2!=0}">
            <tr>
              <td><input type="checkBox"></td>
             <%--  <td>${status.count }</td> --%>
              <td>${registeruser.uid }</td>
              <td>${registeruser.name }</td>
              <td>${registeruser.telephone }</td>
              <td class="action">
              	<a class="passUser" href="javascript:void(0);">通过</a><!--
              	--><a class="refuseUser" href="javascript:void(0);">拒绝</a>
              </td>
            </tr></c:if>
        </c:forEach>
           <tr class="tfoot">
		  	<td class="page page-pdl" colspan="5">
		  		<div id="multiYes" class="multiDelete" title="批量审核"> <i class="fa fa-check fa-lg"></i> </div>
        		<div id="multiNo" class="multiDelete" title="批量拒绝"> <i class="fa fa-close fa-lg"></i> </div>
		  		共${page.totalCount}条记录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条记录&nbsp;
		  		<c:choose>
		  		<c:when test="${requestScope.page.hasPrePage}">
              		<a href="registerUserList?currentPage=1">首页</a> | 
              		<a href="registerUserList?currentPage=${page.currentPage - 1}">上一页</a> | 
             	</c:when>
             	<c:otherwise>
             		首页  | 上一页  | 
             	</c:otherwise>
             	</c:choose>
             	<c:choose>
             	<c:when test="${requestScope.page.hasNextPage}">
              		<a href="registerUserList?currentPage=${page.currentPage + 1}">下一页</a> | 
              		<a href="registerUserList?currentPage=${page.totalPage}">尾页</a>
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
		
		/* 单个用户审核--事件委托  */
		document.getElementById("table-resgister").onclick = function( e ) {
        e = e || window.event;
        var t = e.target || e.srcElement;  //t:目标对象
        var className = t.className;//class名称
         if( className == "passUser" ) { //审核通过用户
        	var table = t.parentNode.parentNode.parentNode;
        	var tr = t.parentNode.parentNode;
        	var uid = tr.childNodes[3].innerText;
        	
 			var r=confirm("是否确定审核通过该用户？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","passUser",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("uid="+uid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							/* alert(xhr.responseText); */ 
 							if(xhr.responseText == "success") {
 								/* table.removeChild(tr); */
 								//重新刷新页面
 								window.location.reload(); 
 							} else if(xhr.responseText == "fail") {
 								alert("审核失败！");
 							}
 						
 						} else {
 							alert("Request was unsuccessful:"+xhr.status);
 						}
 					}
 				}
 			} 
          } else if( className == "refuseUser" ) { //拒绝用户
	          	var table = t.parentNode.parentNode.parentNode;
	        	var tr = t.parentNode.parentNode;
	        	var uid = tr.childNodes[3].innerText;
	        	console.log("用户ID："+uid);
	        	
	 			var r=confirm("是否确定拒绝该用户？");
	 			if (r==true)
	 			{
	 				//建立XMLHttpRequest对象
	 				var xhr = new XMLHttpRequest();
	 				//使用OPEN方法与服务器建立连接
	 				xhr.open("post","refuseUser",true);
	 				//向服务器端发送数据
	 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 				xhr.send("uid="+uid);
	 				//回调函数中针对不同的响应状态进行处理 
	 				xhr.onreadystatechange = function() {
	 					if(xhr.readyState == 4) { //判断交互是否成功
	 						if(xhr.status == 200) { //获取服务器返回的数据
	 							/* alert(xhr.responseText); */ 
	 							if(xhr.responseText == "success") {
	 								/* table.removeChild(tr); */
	 								//重新刷新页面
	 								window.location.reload();
	 							} else if(xhr.responseText == "fail") {
	 								alert("拒绝失败！");
	 							}
	 						
	 						} else {
	 							alert("Request was unsuccessful:"+xhr.status);
	 						}
	 					}
	 				}
	 			}  
          }
        };
        
        /* 批量通过用户*/
        document.getElementById("multiYes").onclick = function() {
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
        	
        	var r=confirm("是否确定批量审核通过用户？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiPassUser",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("uids="+uid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							/* alert(xhr.responseText); */ 
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
 								alert("审核失败！");
 							}
 						
 						} else {
 							alert("Request was unsuccessful:"+xhr.status);
 						}
 					}
 				}
 			}
        };	
        
        /* 批量拒绝用户*/
        document.getElementById("multiNo").onclick = function() {
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
        	
        	var r=confirm("是否确定批量拒绝用户？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiRefuseUser",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("uids="+uid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							/* alert(xhr.responseText); */ 
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
 								alert("拒绝失败！");
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