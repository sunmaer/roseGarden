<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %> 
      <nav id="all-nav">
        <% if(!(uid==null)){%>
          	<ul style="width: 650px;" class="all-action">
          <%} else {%>
          	<ul style="width: 520px;" class="all-action">
          <%}%>
        
          <li><a class="all-nav-a active" href="home/index.jsp">主页</a></li>
          <li><a class="all-nav-a" href="home/chineseIndex.jsp">中文索引</a></li>
          
          <% if(!(uid==null)){%>
          	<li><a class="all-nav-a" href="home/seniorIndex.jsp">高级检索</a></li>
          <%}%>
          <li><a class="all-nav-a" href="showTheme">月季论坛</a></li>
          <li><a class="all-nav-a" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main">

        <div class="content">
          <!-- 轮播图样式 -->
          <div id="container">
            <div id="list" style="left: -710px;">
                <img src="images/5.jpg" alt="1"/>
                <img src="images/1.jpg" alt="1"/>
                <img src="images/2.jpg" alt="2"/>
                <img src="images/3.jpg" alt="3"/>
                <img src="images/4.jpg" alt="4"/>
                <img src="images/5.jpg" alt="5"/>
                <img src="images/1.jpg" alt="5"/>
            </div>
            <div id="buttons">
                <p id="picture_dec">瓶插月季</p>
                <span index="1" class="on">1</span>
                <span index="2">2</span>
                <span index="3">3</span>
                <span index="4">4</span>
                <span index="5">5</span>
            </div>
            <a href="javascript:;" id="prev" class="arrow">&lt;</a>
            <a href="javascript:;" id="next" class="arrow">&gt;</a>
          </div>

          <article>
            <h4>关于我们</h4>
            <span class="dec">园艺林学学院</span>
            <p>
              &nbsp; &nbsp;&nbsp; &nbsp;蔷薇花园是一个关于蔷薇属植物的综合性网站，旨在更科学、更具体地描述蔷薇属植物的各项园艺性状以及更专业的介绍月季知识，可方便、快捷地搜索对应感兴趣性状的月季品种。蔷薇花园不只是月季研究的基础性网站，更是一个弘扬月季花文化的交流平台，同时满足各地研究者和月季爱好者交流的需要。<br/>
			  &nbsp; &nbsp;&nbsp; &nbsp;我们从用户角度出发，用最专业的知识、最人性化的服务、最负责的态度打造一个专业的月季网站。在这里，不但有详尽的品种资料库——对每一个月季品种，从花到叶，从茎到果，乃至抗性都有具体的描述，并辅以大量图片作为参考，力求完善准确。同时，鉴于繁多的月季品种，还开发了功能强大的检索工具，可以通过具体性状定向找到相应月季品种，并与其他月季横向对比，避免遗漏。最后，作为一个综合性网站，支持并鼓励线上线下交流，开设专门论坛区，欢迎大家各抒己见。<br/>
			  &nbsp; &nbsp;&nbsp; &nbsp;想要找相关的月季品种资料，就到蔷薇花园吧！想要找志同道合的月季花友，就到蔷薇花园吧！<br/>
			  &nbsp; &nbsp;&nbsp; &nbsp;PS：网站初建，资料有限，如有意者，共同完善，谢谢！

            </p>
          </article>
        </div>
        <div class="aside">
          <div class="item item-rose">
            <h4>常见月季
              <a href="home/chineseIndex.jsp">
                <img src="images/more.png">
              </a>
            </h4>
            <ul>
              <li>
                <a href="showRose?specie=月月红">月月红</a>
                <span>古老月季</span>
              </li>
              <li>
                <a href="showRose?specie=月月粉">月月粉</a>
                <span>古老月季</span>
              </li>
              <li>
                <a href="showRose?specie=粉团蔷薇">粉团蔷薇</a>
                <span>蔷薇属原种</span>
              </li>
              <li>
                <a href="showRose?specie=玫瑰">玫瑰</a>
                <span>蔷薇属原种</span>
              </li>
              <li>
                <a href="showRose?specie=红双喜">红双喜</a>
                <span>现代月季</span>
              </li>
              <li>
                <a href="showRose?specie=和平">和平</a>
                <span>现代月季</span>
              </li>
              <li>
                <a href="showRose?specie=小伊甸园">小伊甸园</a>
                <span>现代月季</span>
              </li>
              <li>
                <a href="showRose?specie=龙沙宝石">龙沙宝石</a>
                <span>现代月季</span>
              </li>
              <li>
                <a href="showRose?specie=万众瞩目">万众瞩目</a>
                <span>现代月季</span>
              </li>
              <li>
                <a href="showRose?specie=朱丽叶">朱丽叶</a>
                <span>现代月季</span>
              </li>
              <li>
                <a href="showRose?specie=烟花波浪">烟花波浪</a>
                <span>现代月季</span>
              </li>
            </ul>
          </div>
          <div id="friend-link" class="item">
            <h4>校内连接</h4>
            <ul>
              <li><a href="http://www.hzau.edu.cn/" target="_blank">华中农业大学</a></li>
              <li><a href="http://linx.hzau.edu.cn/" target="_blank">华中农业大学园艺林学学院</a></li>
              <li><a href="http://hortilab.hzau.edu.cn/" target="_blank">园艺植物生物教育部重点实验室</a></li>
              <li><a href="http://lib.hzau.edu.cn/" target="_blank">华中农业大学图书馆</a></li>
            </ul>
            <h4>友情链接</h4>
            <ul>
              <li><a href="http://frps.eflora.cn/" target="_blank">中国植物志</a></li>
              <li><a href="http://www.plantphoto.cn/" target="_blank">中国植物图像库</a></li>
              <li><a href="http://www.whiob.ac.cn/" target="_blank">中科院武汉植物园</a></li>
              <li><a href="http://roses.flowerorder.net/forum.php?gid=71" target="_blank">中国月季网</a></li>
              <li><a href="http://www.helpmefind.com/" target="_blank">Help Me Find</a></li>
            </ul>
            <!-- <h4>加入我们</h4>
            <img src="images/code.gif" alt="二维码">
            <p>扫一扫，加入我们</p> -->
          </div>
        </div><!-- aside -->
      </div><!-- main -->
      
    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/Carousel.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {

          // 主页两列等高
          /* 获取外部导入css样式 */
          function getStyle(obj){

            if(obj.currentStyle){
              return obj.currentStyle;
            }
            else if(window.getComputedStyle)
              return document.defaultView.getComputedStyle(obj,null);
            return null;
          }
          var content = document.getElementsByClassName("content")[0];
          var friendLink = document.getElementById("friend-link");
          friendLink.style.height = parseInt(getStyle(content).height) - 370 +'px';

        })();

    </script>
      
<%@ include file="public/footer.jsp" %>