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
	</span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看所有论坛帖子，并且可以对非法帖子进行删除操作， <i class="fa fa-trash fa-lg"></i> 表示批量删除。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">帖子列表
		<!-- <a class="add" href=""> <i class="fa fa-plus"></i> &nbsp;增加月季</a> -->
      </div>

      <table id="table-discuss" class="fixed list">
      	<tr>
      		<th><input id="multiChecked" type="checkBox"></th>
      		<th>#</th>
      		<th>主题</th>
      		<th>发帖者</th>
      		<th class="content">内容</th>
      		<th class="time">时间</th>
      		<th>用户评论</th>
      		<th>操作</th>
      	</tr>
       <c:forEach items="${requestScope.themelist}" var="theme" varStatus="status">
            <c:if test="${status.count%2==0}" >
               <tr style="background-color: #F0F0F0;">
              <td><input type="checkBox"></td>
              <td style="display:none;">${theme.tid }</td>
              <td>${status.count}</td>
              <td>${theme.theme }</td>
              <td>${theme.name }</td>
              <td class="content">${theme.content }</td>         
              <td>${theme.time }</td>
              <td class="action">
              	<a style="border: none;" href="discussList?tid=${theme.tid}">浏览</a>
              </td>
              <td class="action">
              	<a href="seeTheme?tid=${theme.tid}">查看</a><!--
              	--><a class="deleteTheme" href="javaScript:void(0);">删除</a>
              </td>
             </tr>
			 </c:if>
			  <c:if test="${status.count%2!=0}" >
                <tr> 
                 <td><input type="checkBox"></td>
              <td style="display:none;">${theme.tid }</td>
              <td>${status.count}</td>
              <td>${theme.theme }</td>
              <td>${theme.name }</td>
              <td class="content">${theme.content }</td>         
              <td>${theme.time }</td>
              <td class="action">
              	<a style="border: none;" href="discussList?tid=${theme.tid}">浏览</a>
              </td>
              <td class="action">
              	<a href="seeTheme?tid=${theme.tid}">查看</a><!--
              	--><a class="deleteTheme" href="javaScript:void(0);">删除</a>
              </td>
              </tr>
              </c:if>      
       </c:forEach>
        <tr class="tfoot">
        	<td id="multiDelete" class="multiDelete" title="批量删除"> <i class="fa fa-trash fa-lg"></i> </td>
		  	<td class="page" colspan="11">
		  		共${page.totalCount}条记录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条记录&nbsp;
		  		<c:choose>
		  		<c:when test="${requestScope.page.hasPrePage}">
              		<a href="themeList?currentPage=1">首页</a> | 
              		<a href="themeList?currentPage=${page.currentPage - 1}">上一页</a> | 
             	</c:when>
             	<c:otherwise>
             		首页  | 上一页  | 
             	</c:otherwise>
             	</c:choose>
             	<c:choose>
             	<c:when test="${requestScope.page.hasNextPage}">
              		<a href="themeList?currentPage=${page.currentPage + 1}">下一页</a> | 
              		<a href="themeList?currentPage=${page.totalPage}">尾页</a>
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
		document.getElementById("table-discuss").onclick = function( e ) {
        e = e || window.event;
        var t = e.target || e.srcElement;  //t:目标对象
        var className = t.className;//class名称
         if( className == "deleteTheme" ) { //单个删除帖子
	          	var table = t.parentNode.parentNode.parentNode;
	        	var tr = t.parentNode.parentNode;
	        	var tid = tr.childNodes[3].innerText;
	        	console.log("删除帖子ID："+tid);
	        	
	 			var r=confirm("是否确定删除该帖子？");
	 			if (r==true)
	 			{
	 				//建立XMLHttpRequest对象
	 				var xhr = new XMLHttpRequest();
	 				//使用OPEN方法与服务器建立连接
	 				xhr.open("post","deleteTheme",true);
	 				//向服务器端发送数据
	 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 				xhr.send("tid="+tid);
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
        
        /* 批量删除帖子*/
        document.getElementById("multiDelete").onclick = function() {
        	var tids = new Array();
        	var tid;
        	var trs = document.getElementsByTagName("tr");
        	for (var i=1;i<trs.length-1;i++) {
        		if(trs[i].childNodes[1].childNodes[0].checked == true) {
            		tids.push(trs[i].childNodes[3].innerText);
            	}
        	}
        	/* 数组转换为字符串 */
        	tid = tids.join('-');
        	console.log(tid);
        	
        	var r=confirm("是否确定批量删除帖子？");
 			if (r==true)
 			{
 				//建立XMLHttpRequest对象
 				var xhr = new XMLHttpRequest();
 				//使用OPEN方法与服务器建立连接
 				xhr.open("post","multiDeleteTheme",true);
 				//向服务器端发送数据
 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
 				xhr.send("tids="+tid);
 				//回调函数中针对不同的响应状态进行处理 
 				xhr.onreadystatechange = function() {
 					if(xhr.readyState == 4) { //判断交互是否成功
 						if(xhr.status == 200) { //获取服务器返回的数据
 							if(xhr.responseText == "success") {
 								//重新刷新页面
 								window.location.reload();
 						        for (var i=0;i<trs.length-1;i++) {
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