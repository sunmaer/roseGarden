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
        <div class="compare">
            <h4>月季比较</h4>
            <table>
                <tr>
                    <td>品种名</td>
                    <td>${requestScope.roses.get(0).specie }</td>
                    <td>${requestScope.roses.get(1).specie }</td>
                    <td>${requestScope.roses.get(2).specie }</td>
                    <td>${requestScope.roses.get(3).specie }</td>
                </tr>
                <tr>
                    <td>分类</td>
                   <td>${requestScope.roses.get(0).classification }</td>
                    <td>${requestScope.roses.get(1).classification }</td>
                    <td>${requestScope.roses.get(2).classification }</td>
                    <td>${requestScope.roses.get(3).classification }</td>
                </tr>
                <tr>
                    <td>现代月季</td>
                    <td>${requestScope.roses.get(0).nowrose }</td>
                    <td>${requestScope.roses.get(1).nowrose }</td>
                    <td>${requestScope.roses.get(2).nowrose }</td>
                    <td>${requestScope.roses.get(3).nowrose }</td>
                </tr>
                <tr>
                    <td>培育地</td>
                    <td>${requestScope.roses.get(0).cultivate }</td>
                    <td>${requestScope.roses.get(1).cultivate }</td>
                    <td>${requestScope.roses.get(2).cultivate }</td>
                    <td>${requestScope.roses.get(3).cultivate }</td>
                </tr>
                </tr>
                <tr>
                    <td>引种地</td>
                    <td>${requestScope.roses.get(0).introduction }</td>
                    <td>${requestScope.roses.get(1).introduction }</td>
                    <td>${requestScope.roses.get(2).introduction }</td>
                    <td>${requestScope.roses.get(3).introduction }</td>
                </tr>
                <tr>
                    <td>株型</td>
                    <td>${requestScope.roses.get(0).type }</td>
                    <td>${requestScope.roses.get(1).type }</td>
                    <td>${requestScope.roses.get(2).type }</td>
                    <td>${requestScope.roses.get(3).type }</td>
                </tr>
                <tr>
                    <td>生长势</td>
                    <td>${requestScope.roses.get(0).growthpotential }</td>
                    <td>${requestScope.roses.get(1).growthpotential }</td>
                    <td>${requestScope.roses.get(2).growthpotential }</td>
                    <td>${requestScope.roses.get(3).growthpotential }</td>
                </tr>
                <tr>
                    <td>株高</td>
                    <td>${requestScope.roses.get(0).height }</td>
                    <td>${requestScope.roses.get(1).height }</td>
                    <td>${requestScope.roses.get(2).height }</td>
                    <td>${requestScope.roses.get(3).height }</td>
                </tr>
                <tr>
                    <td>茎干粗度</td>
                    <td>${requestScope.roses.get(0).stemroughness }</td>
                    <td>${requestScope.roses.get(1).stemroughness }</td>
                    <td>${requestScope.roses.get(2).stemroughness }</td>
                    <td>${requestScope.roses.get(3).stemroughness }</td>
                </tr>
                <tr>
                    <td>节间长</td>
                    <td>${requestScope.roses.get(0).sectionlong }</td>
                    <td>${requestScope.roses.get(1).sectionlong }</td>
                    <td>${requestScope.roses.get(2).sectionlong }</td>
                    <td>${requestScope.roses.get(3).sectionlong }</td>
                </tr>
                <tr>
                    <td>枝条曲直</td>
                    <td>${requestScope.roses.get(0).isbranchestraight }</td>
                    <td>${requestScope.roses.get(1).isbranchestraight }</td>
                    <td>${requestScope.roses.get(2).isbranchestraight }</td>
                    <td>${requestScope.roses.get(3).isbranchestraight }</td>
                </tr>
                <tr>
                    <td>分枝角度</td>
                   <td>${requestScope.roses.get(0).branchangle }</td>
                    <td>${requestScope.roses.get(1).branchangle }</td>
                    <td>${requestScope.roses.get(2).branchangle }</td>
                    <td>${requestScope.roses.get(3).branchangle }</td>
                </tr>
                <tr>
                    <td>嫩枝颜色</td>
                   <td>${requestScope.roses.get(0).twigscolor }</td>
                    <td>${requestScope.roses.get(1).twigscolor }</td>
                    <td>${requestScope.roses.get(2).twigscolor }</td>
                    <td>${requestScope.roses.get(3).twigscolor }</td>
                </tr>
                <tr>
                    <td>有无刺</td>
                    <td>${requestScope.roses.get(0).hasthorn }</td>
                    <td>${requestScope.roses.get(1).hasthorn }</td>
                    <td>${requestScope.roses.get(2).hasthorn }</td>
                    <td>${requestScope.roses.get(3).hasthorn }</td>
                </tr>
                <tr>
                    <td>刺形状</td>
                    <td>${requestScope.roses.get(0).thornshape }</td>
                    <td>${requestScope.roses.get(1).thornshape }</td>
                    <td>${requestScope.roses.get(2).thornshape }</td>
                    <td>${requestScope.roses.get(3).thornshape }</td>
                </tr>
                <tr>
                    <td>刺密度</td>
                    <td>${requestScope.roses.get(0).thorndensity }</td>
                    <td>${requestScope.roses.get(1).thorndensity }</td>
                    <td>${requestScope.roses.get(2).thorndensity }</td>
                    <td>${requestScope.roses.get(3).thorndensity }</td>
                </tr>
                <tr>
                    <td>长刺数量</td>
                    <td>${requestScope.roses.get(0).longthornnumber }</td>
                    <td>${requestScope.roses.get(1).longthornnumber }</td>
                    <td>${requestScope.roses.get(2).longthornnumber }</td>
                    <td>${requestScope.roses.get(3).longthornnumber }</td>
                </tr>
                <tr>
                    <td>短刺数量</td>
                    <td>${requestScope.roses.get(0).shortthornnumber }</td>
                    <td>${requestScope.roses.get(1).shortthornnumber }</td>
                    <td>${requestScope.roses.get(2).shortthornnumber }</td>
                    <td>${requestScope.roses.get(3).shortthornnumber }</td>
                </tr>
                <tr>
                    <td>小叶数量</td>
                    <td>${requestScope.roses.get(0).lobularnumber }</td>
                    <td>${requestScope.roses.get(1).lobularnumber }</td>
                    <td>${requestScope.roses.get(2).lobularnumber }</td>
                    <td>${requestScope.roses.get(3).lobularnumber }</td>
                </tr>
                <tr>
                    <td>小叶形态</td>
                   <td>${requestScope.roses.get(0).lobularshape }</td>
                    <td>${requestScope.roses.get(1).lobularshape }</td>
                    <td>${requestScope.roses.get(2).lobularshape }</td>
                    <td>${requestScope.roses.get(3).lobularshape }</td>
                </tr>
                <tr>    
                    <td>顶端小叶大小</td>
                   <td>${requestScope.roses.get(0).leafarea }</td>
                    <td>${requestScope.roses.get(1).leafarea }</td>
                    <td>${requestScope.roses.get(2).leafarea }</td>
                    <td>${requestScope.roses.get(3).leafarea }</td>
                </tr>
                <tr>
                    <td>顶端小叶长</td>
                    <td>${requestScope.roses.get(0).topleafletslong }</td>
                    <td>${requestScope.roses.get(1).topleafletslong }</td>
                    <td>${requestScope.roses.get(2).topleafletslong }</td>
                    <td>${requestScope.roses.get(3).topleafletslong }</td>
                </tr>
                <tr>
                    <td>顶端小叶宽</td>
                   <td>${requestScope.roses.get(0).topleafletswide }</td>
                    <td>${requestScope.roses.get(1).topleafletswide }</td>
                    <td>${requestScope.roses.get(2).topleafletswide }</td>
                    <td>${requestScope.roses.get(3).topleafletswide }</td>
                </tr>
                <tr>
                    <td>顶端小叶长宽比</td>
                    <td>${requestScope.roses.get(0).topleaflets }</td>
                    <td>${requestScope.roses.get(1).topleaflets }</td>
                    <td>${requestScope.roses.get(2).topleaflets }</td>
                    <td>${requestScope.roses.get(3).topleaflets }</td>
                </tr>
                <tr>
                    <td>叶片质地</td>
                    <td>${requestScope.roses.get(0).leaftexture }</td>
                    <td>${requestScope.roses.get(1).leaftexture }</td>
                    <td>${requestScope.roses.get(2).leaftexture }</td>
                    <td>${requestScope.roses.get(3).leaftexture }</td>
                </tr>
                <tr>
                    <td>叶片光泽</td>
                    <td>${requestScope.roses.get(0).leaveluster }</td>
                    <td>${requestScope.roses.get(1).leaveluster }</td>
                    <td>${requestScope.roses.get(2).leaveluster }</td>
                    <td>${requestScope.roses.get(3).leaveluster }</td>
                </tr>
                <tr>
                    <td>新叶叶色</td>
                    <td>${requestScope.roses.get(0).newleafcolor }</td>
                    <td>${requestScope.roses.get(1).newleafcolor }</td>
                    <td>${requestScope.roses.get(2).newleafcolor }</td>
                    <td>${requestScope.roses.get(3).newleafcolor }</td>
                </tr>
                <tr>
                    <td>老叶叶色</td>
                    <td>${requestScope.roses.get(0).oldleafcolor }</td>
                    <td>${requestScope.roses.get(1).oldleafcolor }</td>
                    <td>${requestScope.roses.get(2).oldleafcolor }</td>
                    <td>${requestScope.roses.get(3).oldleafcolor }</td>
                </tr>
                <tr>
                    <td>叶缘锯齿形状</td>
                   <td>${requestScope.roses.get(0).serrat }</td>
                    <td>${requestScope.roses.get(1).serrat }</td>
                    <td>${requestScope.roses.get(2).serrat }</td>
                    <td>${requestScope.roses.get(3).serrat }</td>
                </tr>
                <tr>
                    <td>开花时间</td>
                    <td>${requestScope.roses.get(0).flowertime }</td>
                    <td>${requestScope.roses.get(1).flowertime }</td>
                    <td>${requestScope.roses.get(2).flowertime }</td>
                    <td>${requestScope.roses.get(3).flowertime }</td>
                </tr>
                <tr> 
                    <td>始花期</td>
                    <td>${requestScope.roses.get(0).flowerstart }</td>
                    <td>${requestScope.roses.get(1).flowerstart }</td>
                    <td>${requestScope.roses.get(2).flowerstart }</td>
                    <td>${requestScope.roses.get(3).flowerstart }</td>
                </tr>
                <tr>
                    <td>盛花期</td>
                    <td>${requestScope.roses.get(0).flowerbloom }</td>
                    <td>${requestScope.roses.get(1).flowerbloom }</td>
                    <td>${requestScope.roses.get(2).flowerbloom }</td>
                    <td>${requestScope.roses.get(3).flowerbloom }</td>
                </tr>
                <tr>
                    <td>末花期</td>
                   <td>${requestScope.roses.get(0).flowerend }</td>
                    <td>${requestScope.roses.get(1).flowerend }</td>
                    <td>${requestScope.roses.get(2).flowerend }</td>
                    <td>${requestScope.roses.get(3).flowerend }</td>
                </tr>
                <tr>
                    <td>单朵花花期</td>
                   <td>${requestScope.roses.get(0).singleflowerperiod }</td>
                    <td>${requestScope.roses.get(1).singleflowerperiod }</td>
                    <td>${requestScope.roses.get(2).singleflowerperiod }</td>
                    <td>${requestScope.roses.get(3).singleflowerperiod }</td>
                </tr>
                <tr>
                    <td>花量</td>
                    <td>${requestScope.roses.get(0).floweramount }</td>
                    <td>${requestScope.roses.get(1).floweramount }</td>
                    <td>${requestScope.roses.get(2).floweramount }</td>
                    <td>${requestScope.roses.get(3).floweramount }</td>
                </tr>
                <tr>
                    <td>花序</td>
                    <td>${requestScope.roses.get(0).inflorescence }</td>
                    <td>${requestScope.roses.get(1).inflorescence }</td>
                    <td>${requestScope.roses.get(2).inflorescence }</td>
                    <td>${requestScope.roses.get(3).inflorescence }</td>
                </tr>
                <tr>
                    <td>花色</td>
                    <td>${requestScope.roses.get(0).flowercolor }</td>
                    <td>${requestScope.roses.get(1).flowercolor }</td>
                    <td>${requestScope.roses.get(2).flowercolor }</td>
                    <td>${requestScope.roses.get(3).flowercolor }</td>
                </tr>
                <tr>
                    <td>单色</td>
                    <td>${requestScope.roses.get(0).singlecolor }</td>
                    <td>${requestScope.roses.get(1).singlecolor }</td>
                    <td>${requestScope.roses.get(2).singlecolor }</td>
                    <td>${requestScope.roses.get(3).singlecolor }</td>
                </tr>
                <tr>
                    <td>复色</td>
                    <td>${requestScope.roses.get(0).multiplycolor }</td>
                    <td>${requestScope.roses.get(1).multiplycolor }</td>
                    <td>${requestScope.roses.get(2).multiplycolor }</td>
                    <td>${requestScope.roses.get(3).multiplycolor }</td>
                </tr>
                <tr>
                    <td>花香</td>
                    <td>${requestScope.roses.get(0).floral }</td>
                    <td>${requestScope.roses.get(1).floral }</td>
                    <td>${requestScope.roses.get(2).floral }</td>
                    <td>${requestScope.roses.get(3).floral }</td>
                </tr>
                <tr>
                    <td>花径</td>
                    <td>${requestScope.roses.get(0).flowerdiameter }</td>
                    <td>${requestScope.roses.get(1).flowerdiameter }</td>
                    <td>${requestScope.roses.get(2).flowerdiameter }</td>
                    <td>${requestScope.roses.get(3).flowerdiameter }</td>
                </tr>
                <tr>
                    <td>单重瓣</td>
                   <td>${requestScope.roses.get(0).singledoublepetal }</td>
                    <td>${requestScope.roses.get(1).singledoublepetal }</td>
                    <td>${requestScope.roses.get(2).singledoublepetal }</td>
                    <td>${requestScope.roses.get(3).singledoublepetal }</td>
                </tr>
                <tr>
                    <td>花型</td>
                    <td>${requestScope.roses.get(0).flowerpattern }</td>
                    <td>${requestScope.roses.get(1).flowerpattern }</td>
                    <td>${requestScope.roses.get(2).flowerpattern }</td>
                    <td>${requestScope.roses.get(3).flowerpattern }</td>
                </tr>
                <tr>
                    <td>花眼</td>
                    <td>${requestScope.roses.get(0).flowereye }</td>
                    <td>${requestScope.roses.get(1).flowereye }</td>
                    <td>${requestScope.roses.get(2).flowereye }</td>
                    <td>${requestScope.roses.get(3).flowereye }</td>
                </tr>
                <tr>
                    <td>花瓣翻卷</td>
                    <td>${requestScope.roses.get(0).flowerroll }</td>
                    <td>${requestScope.roses.get(1).flowerroll }</td>
                    <td>${requestScope.roses.get(2).flowerroll }</td>
                    <td>${requestScope.roses.get(3).flowerroll }</td>
                </tr>
                <tr>
                    <td>花瓣形状</td>
                    <td>${requestScope.roses.get(0).petalshape }</td>
                    <td>${requestScope.roses.get(1).petalshape }</td>
                    <td>${requestScope.roses.get(2).petalshape }</td>
                    <td>${requestScope.roses.get(3).petalshape }</td>
                </tr>
                <tr>
                    <td>花瓣有无绒光</td>
                    <td>${requestScope.roses.get(0).petalvelvet }</td>
                    <td>${requestScope.roses.get(1).petalvelvet }</td>
                    <td>${requestScope.roses.get(2).petalvelvet }</td>
                    <td>${requestScope.roses.get(3).petalvelvet }</td>
                </tr>
                <tr>
                    <td>花瓣硬度</td>
                    <td>${requestScope.roses.get(0).petalshardness }</td>
                    <td>${requestScope.roses.get(1).petalshardness }</td>
                    <td>${requestScope.roses.get(2).petalshardness }</td>
                    <td>${requestScope.roses.get(3).petalshardness }</td>
                </tr>
                <tr>
                    <td>结实性</td>
                    <td>${requestScope.roses.get(0).firmness }</td>
                    <td>${requestScope.roses.get(1).firmness }</td>
                    <td>${requestScope.roses.get(2).firmness }</td>
                    <td>${requestScope.roses.get(3).firmness }</td>
                </tr>
                <tr>
                    <td>花粉量</td>
                   <td>${requestScope.roses.get(0).pollenamount }</td>
                    <td>${requestScope.roses.get(1).pollenamount }</td>
                    <td>${requestScope.roses.get(2).pollenamount }</td>
                    <td>${requestScope.roses.get(3).pollenamount }</td>
                </tr>
                <tr>
                    <td>花粉活力</td>
                    <td>${requestScope.roses.get(0).pollenvitality }</td>
                    <td>${requestScope.roses.get(1).pollenvitality }</td>
                    <td>${requestScope.roses.get(2).pollenvitality }</td>
                    <td>${requestScope.roses.get(3).pollenvitality }</td>
                </tr>
                <tr>
                    <td>田间综合表现</td>
                    <td>${requestScope.roses.get(0).fieldperformance }</td>
                    <td>${requestScope.roses.get(1).fieldperformance }</td>
                    <td>${requestScope.roses.get(2).fieldperformance }</td>
                    <td>${requestScope.roses.get(3).fieldperformance }</td>
                </tr>
                <tr>
                    <td>耐热性</td>
                    <td>${requestScope.roses.get(0).heatresistance }</td>
                    <td>${requestScope.roses.get(1).heatresistance }</td>
                    <td>${requestScope.roses.get(2).heatresistance }</td>
                    <td>${requestScope.roses.get(3).heatresistance }</td>
                </tr>
                <tr>
                    <td>耐寒性</td>
                    <td>${requestScope.roses.get(0).coldresistance }</td>
                    <td>${requestScope.roses.get(1).coldresistance }</td>
                    <td>${requestScope.roses.get(2).coldresistance }</td>
                    <td>${requestScope.roses.get(3).coldresistance }</td>
                </tr>
                <tr>
                    <td>白粉病抗性</td>
                   <td>${requestScope.roses.get(0).powderymildew }</td>
                    <td>${requestScope.roses.get(1).powderymildew }</td>
                    <td>${requestScope.roses.get(2).powderymildew }</td>
                    <td>${requestScope.roses.get(3).powderymildew }</td>
                </tr>
                <tr>
                    <td>黑斑病抗性</td>
                    <td>${requestScope.roses.get(0).blackspot }</td>
                    <td>${requestScope.roses.get(1).blackspot }</td>
                    <td>${requestScope.roses.get(2).blackspot }</td>
                    <td>${requestScope.roses.get(3).blackspot }</td>
                </tr> 
            </table>
        </div>

      </div><!-- main -->

    <!-- Jquery表单验证插件 -->
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/index.js"></script>
	<script type="text/javascript">

        /*自执行的匿名函数，防止全局变量污染*/
        (function() {
        	//不同项字体变为红色
        	var trs = document.getElementsByTagName("tr");
        	var len = trs.length;
        	if(trs[0].childNodes[7].innerHTML == "") {
        		for(var i=0;i<len;i++) {
            		var tds = trs[i].childNodes;
            		if(tds[3].innerHTML != tds[5].innerHTML) {
            			trs[i].style.color = "red"; 
            		}
            	}
        	} else if(trs[0].childNodes[9].innerHTML == "") {
        		for(var i=0;i<len;i++) {
            		var tds = trs[i].childNodes;
            		if(tds[3].innerHTML != tds[5].innerHTML || tds[3].innerHTML != tds[7].innerHTML) {
            			trs[i].style.color = "red"; 
            		}
            	}
        	} else {
        		for(var i=0;i<len;i++) {
            		var tds = trs[i].childNodes;
            		if(tds[3].innerHTML != tds[5].innerHTML || tds[3].innerHTML != tds[7].innerHTML || tds[3].innerHTML != tds[9].innerHTML) {
            			trs[i].style.color = "red"; 
            		}
            	}
        	}
        	
        })();

    </script>
      
<%@ include file="public/footer.jsp" %>