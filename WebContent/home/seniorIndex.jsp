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
          	<li><a class="all-nav-a active" href="home/seniorIndex.jsp">高级检索</a></li>
          <%}%>
          <li><a class="all-nav-a" href="showTheme">月季论坛</a></li>
          <li><a class="all-nav-a" href="home/contact.jsp">联系我们</a></li>
        </ul>
      </nav>

      <div class="main">

        <div class="main">
		<form id="rose-form">
        <h4 class="search-head"> &nbsp;筛选条件</h4>
        <div class="search-box">
            <p>
                <span class="search-condition">园艺学分类：</span>
                <select id="classification" name="classification">
	          		<option value="">分类</option>
	          		<option value="蔷薇属原种">蔷薇属原种</option>
	          		<option value="古老月季">古老月季</option>
	          		<option value="现代月季">现代月季</option>
	          		<option value="其他">其他</option>
          		</select>
                
            	<select id="nowrose" name="nowrose">	
	          		<option value="">现代月季分类</option>
	          		<option value="灌丛月季">灌丛月季</option>
	          		<option value="杂交茶香月季">杂交茶香月季</option>
	          		<option value="丰花月季">丰花月季</option>
	          		<option value="微型月季">微型月季</option>
	          		<option value="藤本月季">藤本月季</option>
	          		<option value="地被月季">地被月季</option>
	          		<option value="小姐妹月季">小姐妹月季</option>
	          		<option value="壮花月季">壮花月季</option>
          		</select>
            </p>

            <p>
                <span class="search-condition">植物整体概况：</span>
                <select id="type" name="type">
	          		<option value="">株型</option>
	          		<option value="灌木">灌木</option>
	          		<option value="藤本">藤本</option>
	          		<option value="微型">微型</option>
	          		<option value="匍匐">匍匐</option>
          		</select>
                <select id="growthpotential" name="growthpotential">
	          		<option value="">生长势</option>
	          		<option value="强">强</option>
	          		<option value="中">中</option>
	          		<option value="弱">弱</option>
          		</select>
                <select id="height" name="height">
	          		<option value="">株高</option>
	          		<option value="高">高</option>
	          		<option value="中">中</option>
	          		<option value="矮">矮</option>
          		</select>
            </p>
            <p>
                <span class="search-condition">茎：</span>
                <select id="sectionlong" name="sectionlong">
			  		<option value="">节间长</option>
			  		<option value="长">长</option>
			  		<option value="短">短</option>
		  		</select>
                <select id="isbranchestraight" name="isbranchestraight">
			  		<option value="">枝条曲直</option>
			  		<option value="直">直</option>
			  		<option value="曲">曲</option>
		  		</select>
            	<select id="branchangle" name="branchangle">
			  		<option value="">分枝角度</option>
			  		<option value="直立">直立</option>
			  		<option value="半直立">半直立</option>
			  		<option value="开张">开张</option>
		  		</select>
	            <select id="twigscolor" name="twigscolor">
			  		<option value="">嫩枝颜色</option>
			  		<option value="红色">红色</option>
			  		<option value="绿色">绿色</option>
			  		<option value="其他">其他</option>
			  	</select>
            </p>
            <p>
                <span class="search-condition">刺：</span>
                <select id="hasthorn" name="hasthorn">
			  		<option value="">有无刺</option>
			  		<option value="有">有</option>
			  		<option value="无">无</option>
		  		</select>
	            <select id="thornshape" name="thornshape">
			  		<option value="">刺形状</option>
			  		<option value="平直刺">平直刺</option>
			  		<option value="斜直刺">斜直刺</option>
			  		<option value="弯刺">弯刺</option>
			  		<option value="钩刺">钩刺</option>
			  	</select>
            	<select id="thorndensity" name="thorndensity">
			  		<option value="">刺密度</option>
			  		<option value="稠密">稠密</option>
			  		<option value="中等">中等</option>
			  		<option value="稀疏">稀疏</option>
		  		</select>
                <select  id="longthornnumber" name="longthornnumber">
			  		<option value="">长刺数量</option>
			  		<option value="无">无</option>
			  		<option value="少">少</option>
			  		<option value="中">中</option>
			  		<option value="多">多</option>
			  		<option value="很多">很多</option>
			  	</select>
            	<select  id="shortthornnumber" name="shortthornnumber">
			  		<option value="">短刺数量</option>
			  		<option value="无">无</option>
			  		<option value="少">少</option>
			  		<option value="中">中</option>
			  		<option value="多">多</option>
			  		<option value="很多">很多</option>
		  		</select>
            </p>
            <p>
                <span class="search-condition">叶：</span>
                <select id="lobularnumber" name="lobularnumber">
			  		<option value="">小叶数量</option>
			  		<option value="3">3</option>
			  		<option value="3-5">3-5</option>
			  		<option value="5">5</option>
			  		<option value="5-7">5-7</option>
			  		<option value="7">7</option>
			  		<option value="7-9">7-9</option>
			  		<option value=">9">>9</option>
			  	</select>
            	<select id="lobularshape" name="lobularshape">
			  		<option value="">小叶形态</option>
			  		<option value="披针形">披针形</option>
			  		<option value="卵">卵形</option>
			  		<option value="圆形">圆形</option>
			  	</select>
            	<select id="leafarea" name="leafarea">
			  		<option value="">顶端小叶大小</option>
			  		<option value="大">大</option>
			  		<option value="中">中</option>
			  		<option value="小">小</option>
			  	</select>
	            <select id="leaftexture" name="leaftexture">
			  		<option value="">叶片质地</option>
			  		<option value="光滑">光滑</option>
			  		<option value="皱缩">皱缩</option>
			  	</select>
	            <select id="leaveluster" name="leaveluster">
			  		<option value="">叶片光泽</option>
			  		<option value="强">强</option>
			  		<option value="中">中</option>
			  		<option value="弱">弱</option>
			  		<option value="无">无</option>
			  	</select>
            </p>
            <p>
                <span class="search-condition"></span>
	            <select id="newleafcolor" name="newleafcolor">
			  		<option value="">新叶叶色</option>
			  		<option value="绿色">绿色</option>
			  		<option value="红色">红色</option>
			  		<option value="其他">其他</option>
			  	</select>
	            <select id="oldleafcolor" name="oldleafcolor">
			  		<option value="">老叶叶色</option>
			  		<option value="绿色">绿色</option>
			  		<option value="红色">红色</option>
			  		<option value="其他">其他</option>
			  	</select>
	            <select id="serrat" name="serrat">
			  		<option value="">叶缘锯齿形状</option>
			  		<option value="锯齿">锯齿</option>
			  		<option value="细锯齿">细锯齿</option>
			  		<option value="重锯齿">重锯齿</option>
			  		<option value="圆锯齿">圆锯齿</option>
			  		<option value="其他">其他</option>
			  	</select>
            </p>
            <p>
                <span class="search-condition">花：</span>
                <select id="flowertime" name="flowertime">
			  		<option value="">开花时间</option>
			  		<option value="一季">一季</option>
			  		<option value="两季">两季</option>
			  		<option value="多季">多季</option>
			  	</select>
	            <select id="floweramount" name="floweramount">
			  		<option value="">花量</option>
			  		<option value="大">大</option>
			  		<option value="中">中</option>
			  		<option value="小">小</option>
			  	</select>
	            <select id="inflorescence" name="inflorescence">
			  		<option value="">花序</option>
			  		<option value="单花序">单花序</option>
			  		<option value="聚伞花序">聚伞花序</option>
			  		<option value="伞形花序">伞形花序</option>
			  		<option value="圆锥花序">圆锥花序</option>
			  		<option value="伞房花序">伞房花序</option>
			  	</select>
	            <select id="flowercolor" name="flowercolor">
			  		<option value="">花色</option>
			  		<option value="单色">单色</option>
			  		<option value="复色">复色</option>
			  		<option value="变色">变色</option>
			  		<option value="其他">其他</option>
			  	</select>
	            <select id="singleColor" name="singlecolor">
			  		<option value="">单色</option>
			  		<option value="白色">白色</option>
			  		<option value="黄色">黄色</option>
			  		<option value="橙色">橙色</option>
			  		<option value="粉红色">粉红色</option>
			  		<option value="朱红色">朱红色</option>
			  		<option value="红色">红色</option>
			  		<option value="蓝紫色">蓝紫色</option>
			  	</select>
	            <select id="multiplyColor" name="multiplycolor">
			  		<option value="">复色</option>
			  		<option value="条纹">条纹</option>
			  		<option value="表里">表里</option>
			  		<option value="彩晕">彩晕</option>
			  		<option value="心斑">心斑</option>
			  		<option value="结构引起的色差">结构引起的色差</option>
			  	</select>
	            <select id="floral" name="floral">
			  		<option value="">花香</option>
			  		<option value="无">无</option>
			  		<option value="淡">淡</option>
			  		<option value="浓">浓</option>
			  	</select>
            </p>
            <p>
                <span class="search-condition"></span>
                <select id="singledoublepetal" name="singledoublepetal">
			  		<option value="">单重瓣</option>
			  		<option value="单瓣">单瓣</option>
			  		<option value="半重瓣">半重瓣</option>
			  		<option value="重瓣">重瓣</option>
			  		<option value="完全重瓣">完全重瓣</option>
			  	</select>
	            <select id="flowerpattern" name="flowerpattern">
			  		<option value="">花型</option>
			  		<option value="平展">平展</option>
			  		<option value="盘状">盘状</option>
			  		<option value="杯状">杯状</option>
			  		<option value="坛状">坛状</option>
			  		<option value="牡丹型">牡丹型</option>
			  		<option value="菊花型">菊花型</option>
			  		<option value="莲座型">莲座型</option>
			  		<option value="四分莲座型">四分莲座型</option>
			  		<option value="绒球型">绒球型</option>
			  		<option value="突心">突心</option>
			  		<option value="其他型">其他型</option>
			  	</select>
	            <select id="flowereye" name="flowereye">
			  		<option value="">花眼</option>
			  		<option value="无">无</option>
			  		<option value="纽扣眼">纽扣眼</option>
			  		<option value="绿眼">绿眼</option>
			  	</select>
	            <select id="flowerroll" name="flowerroll">
			  		<option value="">花瓣翻卷</option>
			  		<option value="外翻">外翻</option>
			  		<option value="平展">平展</option>
			  		<option value="内兜">内兜</option>
			  		<option value="内折">内折</option>
			  		<option value="翘角">翘角</option>
			  	</select>
	            <select id="petalshape" name="petalshape">
			  		<option value="">花瓣形状</option>
			  		<option value="阔瓣">阔瓣</option>
			  		<option value="圆瓣">圆瓣</option>
			  		<option value="椭圆瓣">椭圆瓣</option>
			  		<option value="尖瓣">尖瓣</option>
			  		<option value="扇形瓣">扇形瓣</option>
			  		<option value="突尖瓣">突尖瓣</option>
			  		<option value="樱花瓣">樱花瓣</option>
			  		<option value="波形瓣">波形瓣</option>
			  		<option value="齿形瓣">齿形瓣</option>
			  		<option value="畸形瓣">畸形瓣</option>
			  		<option value="其他">其他</option>
			  	</select>
	            <select id="petalvelvet" name="petalvelvet">
			  		<option value="">花瓣有无绒光</option>
			  		<option value="有">有</option>
			  		<option value="无">无</option>
			  	</select>
	            <select id="petalshardness" name="petalshardness">
			  		<option value="">花瓣硬度</option>
			  		<option value="软">软</option>
			  		<option value="中">中</option>
			  		<option value="硬">硬</option>
			  	</select>
            </p>
            <p>
                <span class="search-condition">育性：</span>
                <select id="firmness" name="firmness">
			  		<option value="">结实性</option>
			  		<option value="易结">易结实</option>
			  		<option value="可结实">可结实</option>
			  		<option value="不易结实">不易结实</option>
			  		<option value="不结实">不结实</option>
			  	</select>
	            <select id="pollenamount" name="pollenamount">
			  		<option value="">花粉量</option>
			  		<option value="多">多</option>
			  		<option value="中">中</option>
			  		<option value="少">少</option>
			  	</select>
            </p>
            <p>
                <span class="search-condition">抗性：</span>
	            <select id="fieldperformance" name="fieldperformance">
			  		<option value="">田间综合表现</option>
			  		<option value="强">强</option>
			  		<option value="中">中</option>
			  		<option value="弱">弱</option>
			  		<option value="待定">待定</option>
			  	</select>
	            <select id="heatresistance" name="heatresistance">
			  		<option value="">耐热性</option>
			  		<option value="强">强</option>
			  		<option value="中">中</option>
			  		<option value="弱">弱</option>
			  		<option value="待定">待定</option>
			  	</select>
	            <select id="coldresistance" name="coldresistance">
			  		<option value="">耐寒性</option>
			  		<option value="强">强</option>
			  		<option value="中">中</option>
			  		<option value="弱">弱</option>
			  		<option value="待定">待定</option>
			  	</select>
	            <select id="powderymildew" name="powderymildew">
			  		<option value="">白粉病抗性</option>
			  		<option value="强">强</option>
			  		<option value="中">中</option>
			  		<option value="弱">弱</option>
			  		<option value="待定">待定</option>
			  	</select>
	            <select id="blackspot" name="blackspot">
			  		<option value="">黑斑病抗性</option>
			  		<option value="强">强</option>
			  		<option value="中">中</option>
			  		<option value="弱">弱</option>
			  		<option value="待定">待定</option>
			  	</select>
            </p>
        </div>
        </form>

        <div class="senior-action">
            <a id="senior-search" href="javascript:void(0);">确认筛选</a>
            <a id="reset" href="javascript:void(0);">重新筛选</a>
        </div>

        <div class="showRose">
            
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
	<script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {

        	//分类
        	/* var classification = document.getElementById("classification");
        	var nowrose = document.getElementById("nowrose");
        	if(classification.value == "现代月季") {
        		nowrose.disabled = false;
        	} else {
        		nowrose.disabled = true;
        	}
        	classification.onchange = function() {
        		if(classification.value == "现代月季") {
        			nowrose.disabled = false;
        		} else {
        			nowrose.disabled = true;
        		}
        	}

        	//有无刺
        	var hasthorn = document.getElementById("hasthorn");
        	var thornshape = document.getElementById("thornshape");
        	var thorndensity = document.getElementById("thorndensity");
        	var longthornnumber = document.getElementById("longthornnumber");
        	var shortthornnumber = document.getElementById("shortthornnumber");
        	if(hasthorn.value == "有") {
        		thornshape.disabled = false;
        		thorndensity.disabled = false;
        		longthornnumber.disabled = false;
        		shortthornnumber.disabled = false;
        	} else {
        		thornshape.disabled = true;
        		thorndensity.disabled = true;
        		longthornnumber.disabled = true;
        		shortthornnumber.disabled = true;
        	}
        	hasthorn.onchange = function() {
        		if(hasthorn.value == "有") {
        			thornshape.disabled = false;
        			thorndensity.disabled = false;
        			longthornnumber.disabled = false;
        			shortthornnumber.disabled = false;
        		} else {
        			thornshape.disabled = true;
        			thorndensity.disabled = true;
        			longthornnumber.disabled = true;
        			shortthornnumber.disabled = true;
        		}
        	}

        	//花色二级菜单
        	var flowercolor = document.getElementById("flowercolor");
        	var singleColor = document.getElementById("singleColor");
        	var multiplyColor = document.getElementById("multiplyColor");
        	subColor();
        	flowercolor.onchange = function() {
        		subColor();
        	}
        	function subColor() {
        		if(flowercolor.value == "单色") {
        			singleColor.disabled = false;
        			multiplyColor.disabled = true;
        		} else if(flowercolor.value == "复色") {
        			singleColor.disabled = true;
        			multiplyColor.disabled = false;
        		} else {
        			singleColor.disabled = true;
        			multiplyColor.disabled = true;
        		}
        	}  */
          
        	var form = document.getElementById("rose-form");
            //筛选
		     document.getElementById("senior-search").onclick = function() {
		    	var xhr = new XMLHttpRequest();
				xhr.open("post","superSearch",true);
				var fd = new FormData(form);
				xhr.send(fd);
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4) { //判断交互是否成功
						if(xhr.status == 200) { //获取服务器返回的数据
							if(xhr.responseText == "fail") {
							
								//先清空
								showRose.innerHTML = "";
								
								alert("未筛选到相关月季");
								
							} else {
								//先清空
								showRose.innerHTML = "";
												
								var roseArray = xhr.responseText.split(",");
								var len = roseArray.length;
								
								for(var i=0;i<len;i++) {
									//展示筛选出的月季
									var specie = roseArray[i].split("-")[0];
									var src = roseArray[i].split("-")[1];
									var div = document.createElement('div');
									div.className = "showRose-item";
									div.innerHTML = "<a href='showRose?specie="+specie+"'><img src='"+src+"' alt=''></a>"+
						              "<div class='rose-info'>"+
						                "<p class='rose-specie'><a href='showRose?specie="+specie+"'>"+specie+"</a></p>"+
						                "<span class='add-favorite'>加入收藏</span>"+
						                "<span class='add-compare'>加入对比</span>"+
						              "</div>";
						            showRose.appendChild(div);
								}
								
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
							}
						} 
					}
				} 
		     }	
       
		     //重新筛选
       	     document.getElementById("reset").onclick = function() {
		    	 //重置select表单
		    	 form.reset();
		    	 //清楚筛选结果
		    	 showRose.innerHTML = ""; 
		     }
        
       	    
        })();

    </script>
      
<%@ include file="public/footer.jsp" %>