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
          <li><a class="all-nav-a" href="showTheme">月季论坛</a></li>
          <li><a class="all-nav-a" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main">
        <div class="showDiscuss">
            <h4>${requestScope.theme.theme }</h4>
            <div class="showDiscuss-info">
                	<span id="tid" style="display: none;">${requestScope.theme.tid }</span>
                	作者：${requestScope.theme.name } &nbsp;|&nbsp; 发表于${requestScope.theme.time }
            </div>
            <div class="showDisscuss-content">
                &nbsp; &nbsp;${requestScope.theme.content }
            </div>
            
        </div>

        <!-- 用户评论 -->
        <div class="comment">
            <div class="add-comment">
                <div class="add-comment-header">
                    <span class="add-comment-title">发表评论</span>
                    <span class="add-comment-dec">以下用户评论只代表其个人观点，不代表 蔷薇花园 的观点或立场。</span>
                </div>
               	<div <%= showDiscuss %> id="Smohan_FaceBox">
                    <textarea name="content" id="content" class="comment-content"></textarea>
                    <p>
                        <a href="javascript:void(0)" class="face" title="表情"></a>
                        <button id="submitComment">评论</button>
                    </p>
                </div>
               	<div <%= hideDiscuss %> class="hideDiscuss">
				             您好， 登录后才能发表评论
				</div>
            </div>

            <div class="list-comment">
                <div class="list-comment-header">
                    <span> &nbsp;最新评论&nbsp; </span>
                </div>
               <c:forEach items="${requestScope.discusslist}" var="discuss" varStatus="status">
            <div class="list-comment-item">
                    <img src="images/user.png" alt="">
                    <div class="list-comment-item-info">
                        <div class="list-comment-item-header">
                            <span class="username">${discuss.name }</span>
                            <span class="datetime">${discuss.time }</span>
                            <span class="floor"> ${status.count} F</span>
                        </div>
                        <div class="list-comment-item-text">
                         			${discuss.content }
                        </div>
                    </div>
                </div>
       </c:forEach>
                
                
               
            </div>
        </div>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
	<script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {
        	document.getElementById("submitComment").onclick = function() {
        		var xhr = new XMLHttpRequest();
        		xhr.open("post","addDiscuss",true);
        		var tid = document.getElementById("tid");
        		var content = document.getElementById("content");
        		var data="tid="+tid.innerHTML+"&content="+content.value;
        		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        		xhr.send(data);
        		xhr.onreadystatechange = function() {
        			if(xhr.readyState == 4) { //判断交互是否成功
        				if(xhr.status == 200) { //获取服务器返回的数据
        					if(xhr.responseText == "success") {
        						
        						//刷新当前页面
        						window.location.reload();
        						
        					} else {
        						alert("发表失败");
        					}
        				} else {
        					alert("Request was unsuccessful:"+xhr.status);
        				}
        			}
        		} 
        	}
        })();

    </script>
      
<%@ include file="public/footer.jsp" %>