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
          <li><a class="all-nav-a active" href="home/chineseIndex.jsp">中文索引</a></li>
          
          <% if(!(uid==null)){%>
          	<li><a class="all-nav-a" href="home/seniorIndex.jsp">高级检索</a></li>
          <%}%>
          <li><a class="all-nav-a" href="showTheme">月季论坛</a></li>
          <li><a class="all-nav-a" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main chineseIndex">
          <h4>蔷薇花园 中文索引</h4>
          <div id="letter">
              <a class="letter-active" href="javascript:void(0);">A</a>
              <a href="javascript:void(0);">B</a>
              <a href="javascript:void(0);">C</a>
              <a href="javascript:void(0);">D</a>
              <a href="javascript:void(0);">E</a>
              <a href="javascript:void(0);">F</a>
              <a href="javascript:void(0);">G</a>
              <a href="javascript:void(0);">H</a>
              <a href="javascript:void(0);">I</a>
              <a href="javascript:void(0);">J</a>
              <a href="javascript:void(0);">K</a>
              <a href="javascript:void(0);">L</a>
              <a href="javascript:void(0);">M</a>
              <a href="javascript:void(0);">N</a>
              <a href="javascript:void(0);">O</a>
              <a href="javascript:void(0);">P</a>
              <a href="javascript:void(0);">Q</a>
              <a href="javascript:void(0);">R</a>
              <a href="javascript:void(0);">S</a>
              <a href="javascript:void(0);">T</a>
              <a href="javascript:void(0);">U</a>
              <a href="javascript:void(0);">V</a>
              <a href="javascript:void(0);">W</a>
              <a href="javascript:void(0);">X</a>
              <a href="javascript:void(0);">Y</a>
              <a href="javascript:void(0);">Z</a>
          </div>
          <div class="letter-all">
            
          </div>
		 
	
      </div><!-- main -->
      
    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {

          var letter = document.getElementById("letter");
          var letterAll = document.getElementsByClassName("letter-all")[0];
          
          //默认显示A
          var XHR = new XMLHttpRequest();
          XHR .open("post","chineseIndex",true);
		  //向服务器端发送数据
		  XHR .setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		  XHR .send("letter="+"a");
		  XHR .onreadystatechange = function() {
			if(XHR .readyState == 4) { //判断交互是否成功
				if(XHR .status == 200) { //获取服务器返回的数据
					if(XHR.responseText == "fail") {
						//删除上一个字母下的所有月季
						letterAll.innerHTML = "";
						//提示没有检索到月季
						var p = document.createElement('p');
						p.innerHTML = "未检索到品种名以字母A开头的月季";
						p.style.lineHeight = "40px";
						p.style.marginLeft = "80px";
						p.style.fontSize = "14px";
						p.style.color = "red";
						letterAll.appendChild(p);
					}
					else {
						
						//生成字母A的月季
						var array = XHR.responseText.split(',');
						var length = array.length;
						for(var i=0;i<length;i++) {
							var a = document.createElement('a');
							a.setAttribute("href","showRose?specie='"+array[i]+"'");
							a.innerHTML = array[i];
							letterAll.appendChild(a);
						}
						
					} 
				} 
			}
		  }
          
          letter.onclick = function(event) {
              var e = event || window.event;
              var target = e.target || e.srcElement;
              if(target.tagName == 'A') {
                  //清空letter-active类
                  var a = letter.getElementsByTagName("a");
                  var len = a.length;
                  for(var i=0;i<len;i++) {
                    a[i].className = "";
                  }
                  //为当前元素加letter-active类
                  target.className = "letter-active";

                    //中文检索
                    var xhr = new XMLHttpRequest();
					xhr.open("post","chineseIndex",true);
					//向服务器端发送数据
	 				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	 				xhr.send("letter="+target.innerHTML.toLowerCase());
					xhr.onreadystatechange = function() {
						if(xhr.readyState == 4) { //判断交互是否成功
							if(xhr.status == 200) { //获取服务器返回的数据
								if(xhr.responseText == "fail") {
									//删除上一个字母下的所有月季
									letterAll.innerHTML = "";
									var p = document.createElement('p');
									//提示没有检索到月季
									p.innerHTML = "未检索到品种名以字母"+target.innerHTML+"开头的月季";
									p.style.lineHeight = "40px";
									p.style.marginLeft = "80px";
									p.style.fontSize = "14px";
									p.style.color = "red";
									letterAll.appendChild(p);
								}
								else {
									
									//删除上一个字母下的所有月季
									letterAll.innerHTML = "";
									
									//重新生成当前字母的月季
									var array = xhr.responseText.split(',');
									var length = array.length;
									for(var i=0;i<length;i++) {
										var a = document.createElement('a');
										a.setAttribute("href","showRose?specie="+array[i]+"");
										a.innerHTML = array[i];
										letterAll.appendChild(a);
									}
								} 
							} 
						}
					} 
              }
          }

        })();

    </script>
      
<%@ include file="public/footer.jsp" %>