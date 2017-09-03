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

        <h4 class="search-head" style="margin-bottom: 10px;border-bottom: 1px dotted #E0E0E0;"> &nbsp;我的收藏</h4>
		
        <div class="showRose">
		<div style="height: 40px;line-height: 40px;color: red;font-size: 13px;">${requestScope.tip}</div>
        <c:forEach var="item" items="${requestScope.specieTopic}">   
           <div class="showRose-item">
              <a href="showRose?specie=${item.key}"><img src="${item.value }"></a><div class="rose-info"><p class="rose-specie"><a href="showRose?specie=${item.key}">${item.key}</a></p>
                <span class="delete-favorite">取消收藏</span>
                <span class="add-compare">加入对比</span>
              </div>
            </div>
          </c:forEach> 
           
        </div>   
        
        <div class="senior-action">
            <div class="page">
             
                  	 共<strong> ${page.totalCount} </strong>种月季 &nbsp;<span class="curPage">${page.currentPage}</span>/${page.totalPage}
                      <c:choose>
		  			<c:when test="${requestScope.page.hasPrePage}">
		            		<a href="myFavorite?currentPage=1">首页</a> &nbsp;|&nbsp; 
		            		<a href="myFavorite?currentPage=${page.currentPage - 1}">上一页 &nbsp;|&nbsp;</a>  
		           	</c:when>
		           	<c:otherwise>
		           		首页  &nbsp;|&nbsp; 上一页  &nbsp;|&nbsp; 
		           	</c:otherwise>
		           	</c:choose>
		           	<c:choose>
		           	<c:when test="${requestScope.page.hasNextPage}">
		            		<a href="myFavorite?currentPage=${page.currentPage + 1}">下一页 &nbsp;|&nbsp;</a>
		            		<a href="myFavorite?currentPage=${page.totalPage}">尾页</a>
		           	</c:when>
		           	<c:otherwise>
		           		下一页  &nbsp;|&nbsp; 尾页
		           	</c:otherwise>
		           </c:choose>
            </div>
        </div>

        <!-- 对比栏 -->
        <div class="compare-box">
          <h4>
                                  对比栏
            <span id="close-compareBox">隐藏</span>
          </h4>
          <div class="compare-all">

            <div class="compare-action">
              <a id="compare" href="javascript:void(0);">对比</a>
              <span id="compare-all-reset">清空对比栏</span>
            </div>
          </div>
        </div>
        
        <!-- 创建一个隐藏form表单，提交对比月季品种名 -->
        <form id="compareForm" action="compareRose" style="display: none;">
        	<input type="text" name="species" id="compareInput"/>
        </form>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
	<script src="js/roseAction.js"></script>
      
<%@ include file="public/footer.jsp" %>