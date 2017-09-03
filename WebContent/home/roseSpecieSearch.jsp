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

        <h4 class="search-head" style="margin-bottom: 10px;border-bottom: 1px dotted #E0E0E0;"> &nbsp;搜索结果</h4>
		<div style="line-height: 40px;color: red;font-size: 13px;">${requestScope.tip}</div>
        <div class="showRose">
      
           <c:forEach var="item" items="${requestScope.specieTopic}">   
           <div class="showRose-item">
              <a href="showRose?specie=${item.key}"><img src="${item.value }"></a><div class="rose-info"><p class="rose-specie"><a href="showRose?specie=${item.key}">${item.key}</a></p>
                <span class="add-favorite">加入收藏</span>
                <span class="add-compare">加入对比</span>
              </div>
            </div>
          </c:forEach> 
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
      
    <script>
    	(function() {
    		var XHR = new XMLHttpRequest();
			XHR.open("get","getFavorite",true);
			XHR.send();
			XHR.onreadystatechange = function() {
	  			if(XHR.readyState == 4) { //判断交互是否成功
	  				if(XHR.status == 200) { //获取服务器返回的数据
	  					//判断是否已经收藏
	  					var favorites = XHR.responseText; //我的收藏
	  				    var spans = document.getElementsByClassName("add-favorite"); //加入收藏
	  				    var len= spans.length;
	  					//将筛选后的每一项在我的收藏里匹配，如果匹配成功，表示该月季已收藏，否则未收藏
	  				    for(var i=len-1;i>=0;i--) { //考虑nodelist的时效性
  				    		var specie = spans[i].parentNode.childNodes[0].firstChild.innerHTML;
  				    		if(favorites.indexOf(specie) != -1) {
  				    			//改变当前项的收藏属性->已收藏
  		  						spans[i].innerHTML = "取消收藏";
  		  						spans[i].className = "delete-favorite";
  				    		}
  				    	}
	  					
	  				}
	  			}
	  		}
    	})();
    </script>
      
<%@ include file="public/footer.jsp" %>