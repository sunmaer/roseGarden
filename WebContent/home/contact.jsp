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
          <li><a class="all-nav-a active" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main">
        <div class="rose">
            <h4>联系我们</h4>
            <span class="dec"> 园艺林学学院 </span>

            <div class="contact-content">
		      <img src="images/2.jpg" alt="" />
              <div class="right">
				 邮箱：hyh2010@mail.hzau.edu.cn<br/>
				 邮箱：fuxiaopeng@mail.hzau.edu.cn<br/>
				 地址：<a href="http://j.map.baidu.com/avlaI" target="_blank">湖北省武汉市狮子山街道1号华中农业大学</a><br/><br/>
                                             网站初建，还不甚完善，希望各界人士提出宝贵意见。如有意进一步交流合作，请联系我们 <i class="fa fa-smile-o fa-lg"></i>！
              </div>
            </div>
            
        </div>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
      
<%@ include file="public/footer.jsp" %>