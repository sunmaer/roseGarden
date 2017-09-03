<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 管理员
	    <i class="fa fa-angle-right fa-lg"></i> 管理员列表
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	超级管理员可以在本版块查看所有普通管理员, <i class="fa fa-exchange fa-lg"></i> 表示批量取消用户普通管理员权限。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">管理员列表
		<!-- <a class="add" href=""> <i class="fa fa-plus"></i> &nbsp;增加月季</a> -->
      </div>
      
      <table id="table-admin" class="userList list">
      	<tr>
      		<th><input id="multiChecked" type="checkBox"></th>
      		<!-- <th>#</th> -->
      		<th>学/工号</th>
      		<th>用户名</th>
      		<th>角色</th>
      		<th>电话</th>
      		<th>操作</th>
      	</tr>
      	 <c:forEach items="${requestScope.adminlist}" var="admin" varStatus="status" >
	        <c:if test="${status.count%2==0}" >
               <tr style="background-color: #F0F0F0;">
	     	 <td><input type="checkBox"></td>
	     	<%--  <td>${status.count }</td> --%>
	         <td>${admin.aid}</td>
	         <td>${admin.name }</td>
	         <td>${admin.role}</td>
	         <td>${admin.telephone }</td>
	         <td class="action">
              	<a href="javascript:void(0);" style="padding: 0;border: none;">撤销管理员</a>
              </td>
	      </tr>
	      </c:if>
	      <c:if test="${status.count%2!=0}" >
               <tr>
	     	 <td><input type="checkBox"></td>
	     	 <%-- <td>${status.count }</td> --%>
	         <td>${admin.aid}</td>
	         <td>${admin.name }</td>
	         <td>${admin.role}</td>
	         <td>${admin.telephone }</td>
	         <td class="action">
              	<a href="javascript:void(0);" style="padding: 0;border: none;">撤销管理员</a>
              </td>
	      </tr>
	      </c:if>
	      </c:forEach> 
        <tr class="tfoot">
        	<td id="multiDelete" class="multiDelete" title="批量撤销权限"> <i class="fa fa-exchange fa-lg"></i> </td>

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
		
		/* 单个撤销管理员--事件委托  */
		document.getElementById("table-admin").onclick = function( e ) {
        e = e || window.event;
        var t = e.target || e.srcElement;  //t:目标对象
        var tagName = t.tagName;//tagName标签名称
         if( tagName == 'A' ) {
        	var table = t.parentNode.parentNode.parentNode;
        	var tr = t.parentNode.parentNode;
        	var aid = tr.childNodes[3].innerText;
        	console.log("删除管理员ID："+aid);
        	
 			var r=confirm("是否确定撤销该管理员权限？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","deleteAdmin",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("adminID="+aid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							/* alert(xhr.responseText); */ 
 							if(xhr.responseText == "success") {
 								table.removeChild(tr);
 							} else if(xhr.responseText == "fail") {
 								alert("撤销失败！");
 							}
 						
 						} else {
 							alert("Request was unsuccessful:"+xhr.status);
 						}
 					}
 				}
 			} 
          }
        };
        
        /* 批量撤销管理员 */
        document.getElementById("multiDelete").onclick = function() {
        	var aids = new Array();
        	var aid;
        	var trs = document.getElementsByTagName("tr");
        	for (var i=1;i<trs.length-1;i++) {
        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
            		aids.push(trs[i].childNodes[3].innerText);
            	}
        	}
        	/* 数组转换为字符串 */
        	aid = aids.join('-');
        	
        	var r=confirm("是否确定批量撤销该管理员权限？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiDeleteAdmin",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("aid="+aid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							/* alert(xhr.responseText); */ 
 							if(xhr.responseText == "success") {
 								//因为NodeList的时效性，所以从末尾开始删除
 								for (var i=trs.length-1;i>0;i--) {
 					        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
 						        		trs[i].parentNode.removeChild(trs[i]);
 						            }
 						        }
 							} else if(xhr.responseText == "fail") {
 								alert("撤销失败！");
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