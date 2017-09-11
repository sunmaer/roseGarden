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
        <div class="rose">
            <h4>月季信息</h4>
            <span class="dec">${rose.specie}详细资料 &nbsp;|&nbsp; 
                                            本页面所有长度性状单位均为㎝ &nbsp;|&nbsp;
                <a href="showTheme">去月季论坛讨论</a>
            </span>
            <table>
                <span id="rid" style="display: none;">${rose.rid}</span>
                <tr>
                    <td>品种名</td>
                    <td>${rose.specie}</td>
                    <td>分类</td>
                    <td>${rose.classification}</td>
                </tr> 
                
                <tr>
                    <td>现代月季</td>
                    <td>${rose.nowrose}</td>
                    <td>培育地</td>
                    <td>${rose.cultivate}</td>
                </tr>

                <tr>
                    <td>引种地</td>
                    <td>${rose.introduction}</td>
                    <td>株型</td>
                    <td>${rose.type}</td>
                </tr>

                <tr>
                    <td>生长势</td>
                    <td>${rose.growthpotential}</td>
                    <td>株高</td>
                    <td>${rose.height}</td>
                </tr>

                <tr>
                    <td>茎干粗度</td>
                    <td>${rose.stemroughness}</td>
                    <td>节间长</td>
                    <td>${rose.sectionlong}</td>
                </tr> 
                    
                <tr>
                    <td>枝条曲直</td>
                    <td>${rose.isbranchestraight}</td>
                    <td>分枝角度</td>
                    <td>${rose.branchangle}</td>
                </tr>	
                
                <tr>
                    <td>嫩枝颜色</td>
                    <td>${rose.twigscolor}</td>
                    <td>有无刺</td>
                    <td>${rose.hasthorn}</td>
                </tr>

                <tr>
                    <td>刺形状</td>
                    <td>${rose.thornshape}</td>
                    <td>刺密度</td>
                    <td>${rose.thorndensity}</td>
                </tr>

                <tr>
                    <td>长刺数量</td>
                    <td>${rose.longthornnumber}</td>
                    <td>短刺数量</td>
                    <td>${rose.shortthornnumber}</td>
                </tr>

                <tr>
                    <td>小叶数量</td>
                    <td>${rose.lobularnumber}</td>
                    <td>小叶形态</td>
                    <td>${rose.lobularshape}</td>
                </tr>

                <tr>
                    <td>顶端小叶大小</td>
                    <td>${rose.leafarea}</td>
                    <td>顶端小叶长</td>
                    <td>${rose.topleafletslong}</td>
                    
                </tr>

                <tr>
                    <td>顶端小叶宽</td>
                    <td>${rose.topleafletswide}</td>
                    <td>顶端小叶长宽比</td>
                    <td>${rose.topleaflets}</td>
                    
                </tr>

                <tr>
                    <td>叶片质地</td>
                    <td>${rose.leaftexture}</td>
                    <td>叶片光泽</td>
                    <td>${rose.leaveluster}</td>
                </tr>

                <tr>
                    <td>新叶叶色</td>
                    <td>${rose.newleafcolor}</td>
                    <td>老叶叶色</td>
                    <td>${rose.oldleafcolor}</td>
                </tr>

                <tr>
                    <td>叶缘锯齿形状</td>
                    <td>${rose.serrat}</td>
                    <td>开花时间</td>
                    <td>${rose.flowertime}</td>
                </tr>

                <tr>
                    
                    <td>始花期</td>
                    <td>${rose.flowerstart}</td>
                    <td>盛花期</td>
                    <td>${rose.flowerbloom}</td>
                </tr>
                
                <tr>
                    <td>末花期</td>
                    <td>${rose.flowerend}</td>
                    <td>单朵花花期</td>
                    <td>${rose.singleflowerperiod}</td> 
                </tr>

                <tr>
                    <td>花量</td>
                    <td>${rose.floweramount}</td>
                    <td>花序</td>
                    <td>${rose.inflorescence}</td>
                </tr>
                
                <tr>
                    <td>花色</td>
                    <td>${rose.flowercolor}</td>
                    <td>单色</td>
                    <td>${rose.singlecolor}</td>
                </tr>

                <tr>
                    <td>复色</td>
                    <td>${rose.multiplycolor}</td>
                    <td>花香</td>
                    <td>${rose.floral}</td>
                </tr>
                
                <tr>
                    <td>花径</td>
                    <td>${rose.flowerdiameter}</td>
                    <td>单重瓣</td>
                    <td>${rose.singledoublepetal}</td>
                </tr>

                <tr>
                    <td>花型</td>
                    <td>${rose.flowerpattern}</td>
                    <td>花眼</td>
                    <td>${rose.flowereye}</td>
                </tr>

                <tr>
                    <td>花瓣翻卷</td>
                    <td>${rose.flowerroll}</td>
                    <td>花瓣形状</td>
                    <td>${rose.petalshape}</td>
                </tr>

                <tr>
                    <td>花瓣有无绒光</td>
                    <td>${rose.petalvelvet}</td>
                    <td>花瓣硬度</td>
                    <td>${rose.petalshardness}</td>
                </tr>

                <tr>
                    <td>结实性</td>
                    <td>${rose.firmness}</td>
                    <td>花粉量</td>
                    <td>${rose.pollenamount}</td>
                </tr>

                <tr>
                    <td>花粉活力</td>
                    <td>${rose.pollenvitality}</td>
                    <td>田间综合表现</td>
                    <td>${rose.fieldperformance}</td>
                </tr>
                
                <tr>
                    <td>耐热性</td>
                    <td>${rose.heatresistance}</td>
                    <td>耐寒性</td>
                    <td>${rose.coldresistance}</td>
                </tr>

                <tr>
                    <td>白粉病抗性</td>
                    <td>${rose.powderymildew}</td>
                    <td>黑斑病抗性</td>
                    <td>${rose.blackspot}</td> 
                </tr> 

                <tr>
                    <td class="valign-top" valign="top">图片</td>
                    <td colspan="3" class="td-picture">
                        <div id="showPicture">
                           <c:forEach items="${requestScope.path}" var="item" >
                              <div class="roseItem">
                                <img src="${item}" alt="${item}" />
                              </div>
                           </c:forEach>
                        </div>
                    </td>
		        </tr>
 
                <tr>
                <td class="valign-top" valign="top">备注</td>
                <td colspan="3">
                    <textarea disabled name="remark" id="remark">${rose.remark}</textarea>
                </td>
                </tr>
            </table>
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
                <c:forEach items="${requestScope.comments}" var="comment" varStatus="status">
            <div class="list-comment-item">
                    <img src="images/user.png" alt="">
                    <div class="list-comment-item-info">
                        <div class="list-comment-item-header">
                            <span class="username">${comment.name }</span>
                            <span class="datetime">${comment.time }</span>
                            <span class="floor"> ${status.count} F</span>
                        </div>
                        <div class="list-comment-item-text">
                         			${comment.content }
                        </div>
                    </div>
                </div>
      		 </c:forEach>
      		
          </div>

        <!-- 查看大图 -->
        <div id="mask">
            <div id="picture-box">
                <img id="img" src=""/>
                <button id="closeBox">
                    <i  class="fa fa-remove"></i>
                </button>
            </div>
        </div>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
    <!-- 防止 XSS 攻击 -->
    <script src="js/xss.min.js"></script>
	<script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {

        /* 获取css样式 */
        function getStyle(ele) {
            var style = null;
            
            if(window.getComputedStyle) {
                style = window.getComputedStyle(ele, null);
            }else{
                style = ele.currentStyle;
            }
            
            return style;
        }

        var showPicture = document.getElementById("showPicture");
        var mask = document.getElementById("mask");
        var pictureBox = document.getElementById("picture-box");
        var img = document.getElementById("img");
        
        /*大图垂直居中函数*/
        function middle() {
            var screenHeight = window.innerHeight;
            var height = parseInt(getStyle(pictureBox).height);
            console.log(screenHeight);
            console.log(height);
            pictureBox.style.marginTop = (screenHeight - height)/2 + 'px';
            console.log((screenHeight - height)/2);
            window.onresize = function() {
                var screenHeight = document.body.clientHeight;
                var height = parseInt(getStyle(pictureBox).height);
                pictureBox.style.marginTop = (screenHeight - height)/2 + 'px';
            }
        }

        //查看大图
        showPicture.onclick = function(e) {
            e = e || window.event;
            var t = e.target || e.srcElement;  //t:目标对象
            var className = t.className;//class名称
            var tagName = t.tagName;
            if( tagName=="IMG") {
                //把缩略图的地址给大图的src
                img.src = t.src;
                mask.style.display = "block";
                middle();
            }
        }

        //关闭查看大图
        document.getElementById("closeBox").onclick = function() {
            mask.style.display = "none";
        }
        
        //如果td内容为空显示'-'
        var tds = document.getElementsByTagName("td");
        var length = tds.length;
        for(var i=0;i<length;i++) {
        	if(tds[i].innerHTML == "") {
        		tds[i].innerHTML = "-";
        	}
        }
        
        document.getElementById("submitComment").onclick = function() {
    		var xhr = new XMLHttpRequest();
    		xhr.open("post","addComment",true);
    		var rid = document.getElementById("rid");
    		var content = document.getElementById("content");
    		var data="rid="+rid.innerHTML+"&content="+content.value;
    		var data = filterXSS(data, {
		  whiteList:          [],        // 白名单为空，表示过滤所有标签
		  stripIgnoreTag:     true,      // 过滤所有非白名单标签的HTML
		  stripIgnoreTagBody: ['script'] // script标签较特殊，需要过滤标签中间的内容
		});
    		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    		xhr.send(data);
    		xhr.onreadystatechange = function() {
    			if(xhr.readyState == 4) { //判断交互是否成功
    				if(xhr.status == 200) { //获取服务器返回的数据
    					
    					if(xhr.responseText == "success") {
    						
    						content.value = "";
    						
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