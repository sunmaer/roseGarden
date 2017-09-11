<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="public/header.jsp" %> 
      <nav id="all-nav">
        <% if(!(uid==null)){%>
          	<ul style="width: 650px;" class="all-action">
          <%} else {%>
          	<ul style="width: 520px;" class="all-action">
          <%}%>
        
          <li><a class="all-nav-a" href="home/index.jsp">主页</a></li>
          <li><a class="all-nav-a" href="home/chineseIndex.jsp">中文索引</a></li>
          
          <% if(!(uid==null)){%>
          	<li><a class="all-nav-a" href="home/seniorIndex.jsp">高级检索</a></li>
          <%}%>
          <li><a class="all-nav-a active" href="showTheme">月季论坛</a></li>
          <li><a class="all-nav-a" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main">
        <div class="discuss">
            <table>
                <tr>
                    <th>全部主题 最新 精华 热帖</th>
                    <th>作者</th>
                    <th>时间</th>
                    <th>回复</th>
                </tr>
              <c:forEach items="${requestScope.themelist}" var="theme" varStatus="status">
	            <tr>
	             <td><i class="fa fa-folder fa-lg"></i>
	               <a href="showDiscuss?tid=${theme.tid }">${theme.theme }</a> </td>
	               
	              <td>${theme.name}</td>
	              <td>${theme.time }</td> 
	              <td>${requestScope.count[status.index] }</td>
	            </tr>
       		  </c:forEach>
              <tr class="discuss-page">
                  <td colspan="4">
                      <div class="page">
                        	  共<strong> ${page.totalCount} </strong>条发帖 &nbsp;<span class="curPage">${page.currentPage}</span>/${page.totalPage}
                      <c:choose>
		  			<c:when test="${requestScope.page.hasPrePage}">
		            		<a href="showTheme?currentPage=1">首页</a> &nbsp;|&nbsp; 
		            		<a href="showTheme?currentPage=${page.currentPage - 1}">上一页 &nbsp;|&nbsp;</a>  
		           	</c:when>
		           	<c:otherwise>
		           		首页  &nbsp;|&nbsp; 上一页  &nbsp;|&nbsp; 
		           	</c:otherwise>
		           	</c:choose>
		           	<c:choose>
		           	<c:when test="${requestScope.page.hasNextPage}">
		            		<a href="showTheme?currentPage=${page.currentPage + 1}">下一页 </a> &nbsp;|&nbsp; 
		            		<a href="showTheme?currentPage=${page.totalPage}">尾页</a>
		           	</c:when>
		           	<c:otherwise>
		           		下一页  &nbsp;|&nbsp; 尾页
		           	</c:otherwise>
		           </c:choose>
                   </div>
                  </td>
              </tr>
            </table>
        </div>

        <table class="add-discuss">
                <tr>
                    <th>快速发帖</th>
                </tr>
		    	<tr <%= showTheme %>>
                    <td>
                        <input id="theme" name="theme" type="text" placeholder="主题">
                    </td>
                </tr>
                <tr <%= showTheme %>>
                    <td>
                        <textarea name="content" id="content" class="comment-content"></textarea>
                    </td>
                </tr>
                <tr <%= showTheme %>>
                    <td>
				        <button id="submitTheme">发表帖子</button>
                    </td>
                </tr>     
             	<tr <%= hideTheme %>>
                   <td style="line-height: 60px;">
			                     您好， 登录后才能发表帖子
                   </td>
                </tr>
                
                
            </table>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
    <!-- 防止 XSS 攻击 -->
    <script src="https://raw.github.com/leizongmin/js-xss/master/dist/xss.js"></script>
	<script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {
        	document.getElementById("submitTheme").onclick = function() {
        		
        		var theme = document.getElementById("theme");
        		var content = document.getElementById("content");
        		if(theme.value == "" || content.value == "") {
        			alert("请输入帖子主题和正文");
        		} else {
        			var xhr = new XMLHttpRequest();
            		xhr.open("post","addTheme",true);
	        		var data="theme="+filterXSS(theme.value)+"&content="+filterXSS(content.value);
	        		alert(data);
	        		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        		xhr.send(data);
	        		xhr.onreadystatechange = function() {
	        			if(xhr.readyState == 4) { //判断交互是否成功
	        				if(xhr.status == 200) { //获取服务器返回的数据
	        					if(xhr.responseText == "success") {
	        						
	        						//刷新当前页面
	        						window.location.reload();
	        						
	        						theme.value = "";
	        						content.value = "";
	        						
	        					} else {
	        						alert("发表失败");
	        					}
	        				} else {
	        					alert("Request was unsuccessful:"+xhr.status);
	        				}
	        			}
	        		} 
        		
        		}
        	}
        	
        })();

    </script>
      
<%@ include file="public/footer.jsp" %>