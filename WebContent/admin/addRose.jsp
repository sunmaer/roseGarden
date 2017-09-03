<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 月季管理
	    <i class="fa fa-angle-right fa-lg"></i> 添加月季
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块添加新的月季品种，请填写具体的月季性状，还可以上传月季照片；本页面所有长度性状单位均为㎝。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">添加月季
		<!-- <a class="add" href=""> <i class="fa fa-plus"></i> &nbsp;增加月季</a> -->
      </div>
      <form id="roseForm" enctype="multipart/form-data">
      <table class="addRose list">
        <tr>
          <td>品种名</td>
          <td>
          	<input id="specie" name="specie" type="text" placeholder="请输入品种名">
          	<span class="required"> * </span>
	        <!-- <span id="specieError" class="error">该品种名已存在</span> -->
          </td>
          <td>分类</td>
          <td>
          	<select id="classification" name="classification">
          		<option value="">未选择</option>
          		<option value="蔷薇属原种">蔷薇属原种</option>
          		<option value="古老月季">古老月季</option>
          		<option value="现代月季">现代月季</option>
          		<option value="其他">其他</option>
          	</select>
          	<span class="required"> * </span>
          </td>
        </tr> 
        
        <tr>
          <td>现代月季</td>
          <td>
          	<select id="nowrose" name="nowrose">	
          		<option value="">未选择</option>
          		<option value="灌丛月季">灌丛月季</option>
          		<option value="杂交茶香月季">杂交茶香月季</option>
          		<option value="丰花月季">丰花月季</option>
          		<option value="微型月季">微型月季</option>
          		<option value="藤本月季">藤本月季</option>
          		<option value="地被月季">地被月季</option>
          		<option value="小姐妹月季">小姐妹月季</option>
          		<option value="壮花月季">壮花月季</option>
          	</select>
          </td>
          <td>培育地</td>
          <td><input id="cultivate" type="text" name="cultivate" placeholder="请输入培育地"></td>
        </tr>

        <tr>
          <td>引种地</td>
          <td><input id="Introduction" type="text" name="Introduction" placeholder="请输入引种地"></td>
          <td>株型</td>
          <td>
          	<select id="type" name="type">
          		<option value="">未选择</option>
          		<option value="灌木">灌木</option>
          		<option value="藤本">藤本</option>
          		<option value="微型">微型</option>
          		<option value="匍匐">匍匐</option>
          	</select>
          	<span class="required"> * </span>
          </td>
        </tr>

        <tr>
          <td>生长势</td>
          <td>
          	<select id="growthpotential" name="growthpotential">
          		<option value="">未选择</option>
          		<option value="强">强</option>
          		<option value="中">中</option>
          		<option value="弱">弱</option>
          	</select>
          </td>
          <td>株高</td>
          <td>
          	<select id="height" name="height">
          		<option value="">未选择</option>
          		<option value="高">高</option>
          		<option value="中">中</option>
          		<option value="矮">矮</option>
          	</select>
          	<span class="required"> * </span>
          </td>
        </tr>

        <tr>
          <td>茎干粗度</td>
          <td><input id="stemroughness" type="text" name="stemroughness" placeholder="请输入茎干粗度"></td>
          <td>节间长</td>
          <td>
          	<select id="sectionlong" name="sectionlong">
		  		<option value="">未选择</option>
		  		<option value="长">长</option>
		  		<option value="短">短</option>
		  	</select>
          </td>
        </tr> 
			
		<tr>
		  <td>枝条曲直</td>
		  <td>
		  	<select id="isbranchestraight" name="isbranchestraight">
		  		<option value="">未选择</option>
		  		<option value="直">直</option>
		  		<option value="曲">曲</option>
		  	</select>
		  </td>
		  <td>分枝角度</td>
		  <td>
		  	<select id="branchangle" name="branchangle">
		  		<option value="">未选择</option>
		  		<option value="直立">直立</option>
		  		<option value="半直立">半直立</option>
		  		<option value="开张">开张</option>
		  	</select>
		  </td>
		</tr>	
		
		<tr>
		  <td>嫩枝颜色</td>
		  <td>
		  	<select id="twigscolor" name="twigscolor">
		  		<option value="">未选择</option>
		  		<option value="红色">红色</option>
		  		<option value="绿色">绿色</option>
		  		<option value="其他">其他</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		  <td>有无刺</td>
		  <td>
		  	<select id="hasthorn" name="hasthorn">
		  		<option value="">未选择</option>
		  		<option value="有">有</option>
		  		<option value="无">无</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>

		<tr>
		  <td>刺形状</td>
		  <td>
		  	<select id="thornshape" name="thornshape">
		  		<option value="">未选择</option>
		  		<option value="平直刺">平直刺</option>
		  		<option value="斜直刺">斜直刺</option>
		  		<option value="弯刺">弯刺</option>
		  		<option value="钩刺">钩刺</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		  <td>刺密度</td>
		  <td>
		  	<select id="thorndensity" name="thorndensity">
		  		<option value="">未选择</option>
		  		<option value="稠密">稠密</option>
		  		<option value="中等">中等</option>
		  		<option value="稀疏">稀疏</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>

		<tr>
          <td>长刺数量</td>
          <td>
          	<select  id="longthornnumber" name="longthornnumber">
		  		<option value="">未选择</option>
		  		<option value="无">无</option>
		  		<option value="少">少</option>
		  		<option value="中">中</option>
		  		<option value="多">多</option>
		  		<option value="很多">很多</option>
		  	</select>
          </td>
          <td>短刺数量</td>
          <td>
          	<select  id="shortthornnumber" name="shortthornnumber">
		  		<option value="">未选择</option>
		  		<option value="无">无</option>
		  		<option value="少">少</option>
		  		<option value="中">中</option>
		  		<option value="多">多</option>
		  		<option value="很多">很多</option>
		  	</select>
          </td>
        </tr>

        <tr>
          <td>小叶数量</td>
          <td>
          	<select id="lobularnumber" name="lobularnumber">
		  		<option value="">未选择</option>
		  		<option value="3">3</option>
		  		<option value="3-5">3-5</option>
		  		<option value="5">5</option>
		  		<option value="5-7">5-7</option>
		  		<option value="7">7</option>
		  		<option value="7-9">7-9</option>
		  		<option value=">9">>9</option>
		  	</select>
          	<span class="required"> * </span>
          </td>
          <td>小叶形态</td>
		  <td>
		  	<select id="lobularshape" name="lobularshape">
		  		<option value="">未选择</option>
		  		<option value="披针形">披针形</option>
		  		<option value="卵">卵形</option>
		  		<option value="圆形">圆形</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
        </tr>

        <tr>
          <td>顶端小叶大小</td>
          <td>
          	<select id="leafarea" name="leafarea">
		  		<option value="">未选择</option>
		  		<option value="大">大</option>
		  		<option value="中">中</option>
		  		<option value="小">小</option>
		  	</select>
          	<span class="required"> * </span>
          </td>
          <td>顶端小叶长</td>
          <td><input id="topleafletslong" type="text" name="topleafletslong" placeholder="请输入数值"></td>
        </tr>

        <tr>
          <td>顶端小叶宽</td>
          <td><input id="topleafletswide" type="text" name="topleafletswide" placeholder="请输入数值"></td>
          <td>顶端小叶长宽比</td>
          <td><input id="topleaflets" type="text" name="topleaflets" placeholder="请输入顶端小叶长宽比"></td>
		</tr>

		<tr>
		  <td>叶片质地</td>
		  <td>
		  	<select id="leaftexture" name="leaftexture">
		  		<option value="">未选择</option>
		  		<option value="光滑">光滑</option>
		  		<option value="皱缩">皱缩</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		  <td>叶片光泽</td>
		  <td>
		  	<select id="leaveluster" name="leaveluster">
		  		<option value="">未选择</option>
		  		<option value="强">强</option>
		  		<option value="中">中</option>
		  		<option value="弱">弱</option>
		  		<option value="无">无</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>

		<tr>
		  <td>新叶叶色</td>
		  <td>
		  	<select id="newleafcolor" name="newleafcolor">
		  		<option value="">未选择</option>
		  		<option value="绿色">绿色</option>
		  		<option value="红色">红色</option>
		  		<option value="其他">其他</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		  <td>老叶叶色</td>
		  <td>
		  	<select id="oldleafcolor" name="oldleafcolor">
		  		<option value="">未选择</option>
		  		<option value="绿色">绿色</option>
		  		<option value="红色">红色</option>
		  		<option value="其他">其他</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>

		<tr>
          <td>叶缘锯齿形状</td>
		  <td>
		  	<select id="serrat" name="serrat">
		  		<option value="">未选择</option>
		  		<option value="锯齿">锯齿</option>
		  		<option value="细锯齿">细锯齿</option>
		  		<option value="重锯齿">重锯齿</option>
		  		<option value="圆锯齿">圆锯齿</option>
		  		<option value="其他">其他</option>
		  	</select>
		  </td>
          <td>开花时间</td>
          <td>
		  	<select id="flowertime" name="flowertime">
		  		<option value="">未选择</option>
		  		<option value="一季">一季</option>
		  		<option value="两季">两季</option>
		  		<option value="多季">多季</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
        </tr>

        <tr>
          <td>始花期</td>
          <td><input id="flowerstart" type="text" name="flowerstart" placeholder="请输入始花期"></td>
          <td>盛花期</td>
          <td><input id="flowerbloom" type="text" name="flowerbloom" placeholder="请输入盛花期"></td>
        </tr>
		
		<tr>
          <td>末花期</td>
          <td><input id="flowerend" type="text" name="flowerend" placeholder="请输入末花期"></td>
          <td>单朵花花期</td>
		  <td>
          	<input id="singleflowerperiod" type="text" name="singleflowerperiod" placeholder="请输入数值">
          </td> 
        </tr>

        <tr>
          <td>花量</td>
          <td>
		  	<select id="floweramount" name="floweramount">
		  		<option value="">未选择</option>
		  		<option value="大">大</option>
		  		<option value="中">中</option>
		  		<option value="小">小</option>
		  	</select>
		  </td>
		  <td>花序</td>
		  <td>
		  	<select id="inflorescence" name="inflorescence">
		  		<option value="">未选择</option>
		  		<option value="单花序">单花序</option>
		  		<option value="聚伞花序">聚伞花序</option>
		  		<option value="伞形花序">伞形花序</option>
		  		<option value="圆锥花序">圆锥花序</option>
		  		<option value="伞房花序">伞房花序</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>
		
		<tr>
          <td>花色</td>
		  <td>
		  	<select id="flowercolor" name="flowercolor">
		  		<option value="">未选择</option>
		  		<option value="单色">单色</option>
		  		<option value="复色">复色</option>
		  		<option value="变色">变色</option>
		  		<option value="其他">其他</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
          <td>单色</td>
		  <td>
		  	<select id="singleColor" name="singlecolor">
		  		<option value="">未选择</option>
		  		<option value="白色">白色</option>
		  		<option value="黄色">黄色</option>
		  		<option value="橙色">橙色</option>
		  		<option value="粉红色">粉红色</option>
		  		<option value="朱红色">朱红色</option>
		  		<option value="红色">红色</option>
		  		<option value="蓝紫色">蓝紫色</option>
		  	</select>
		  </td>
        </tr>

		<tr>
          <td>复色</td>
		  <td>
		  	<select id="multiplyColor" name="multiplycolor">
		  		<option value="">未选择</option>
		  		<option value="条纹">条纹</option>
		  		<option value="表里">表里</option>
		  		<option value="彩晕">彩晕</option>
		  		<option value="心斑">心斑</option>
		  		<option value="结构引起的色差">结构引起的色差</option>
		  	</select>
		  </td>
          <td>花香</td>
          <td>
		  	<select id="floral" name="floral">
		  		<option value="">未选择</option>
		  		<option value="无">无</option>
		  		<option value="淡">淡</option>
		  		<option value="浓">浓</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
        </tr>
        
        <tr>
          <td>花径</td>
          <td><input id="flowerdiameter" type="text" name="flowerdiameter" placeholder="请输入花径"></td>
          <td>单重瓣</td>
          <td>
          	<select id="singledoublepetal" name="singledoublepetal">
		  		<option value="">未选择</option>
		  		<option value="单瓣">单瓣</option>
		  		<option value="半重瓣">半重瓣</option>
		  		<option value="重瓣">重瓣</option>
		  		<option value="完全重瓣">完全重瓣</option>
		  	</select>
          	<span class="required"> * </span>
          </td>
        </tr>

        <tr>
          <td>花型</td>
          <td>
		  	<select id="flowerpattern" name="flowerpattern">
		  		<option value="">未选择</option>
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
		  	<span class="required"> * </span>
		  </td>
          <td>花眼</td>
          <td>
		  	<select id="flowereye" name="flowereye">
		  		<option value="">未选择</option>
		  		<option value="无">无</option>
		  		<option value="纽扣眼">纽扣眼</option>
		  		<option value="绿眼">绿眼</option>
		  	</select>
		  </td>
        </tr>

        <tr>
          <td>花瓣翻卷</td>
		  <td>
		  	<select id="flowerroll" name="flowerroll">
		  		<option value="">未选择</option>
		  		<option value="外翻">外翻</option>
		  		<option value="平展">平展</option>
		  		<option value="内兜">内兜</option>
		  		<option value="内折">内折</option>
		  		<option value="翘角">翘角</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		  <td>花瓣形状</td>
		  <td>
		  	<select id="petalshape" name="petalshape">
		  		<option value="">未选择</option>
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
		  	<span class="required"> * </span>
		  </td>
		</tr>

		<tr>
		  <td>花瓣有无绒光</td>
		  <td>
		  	<select id="petalvelvet" name="petalvelvet">
		  		<option value="">未选择</option>
		  		<option value="有">有</option>
		  		<option value="无">无</option>
		  	</select>
		  </td>
		  <td>花瓣硬度</td>
		  <td>
		  	<select id="petalshardness" name="petalshardness">
		  		<option value="">未选择</option>
		  		<option value="软">软</option>
		  		<option value="中">中</option>
		  		<option value="硬">硬</option>
		  	</select>
		  </td>
		</tr>

		<tr>
		  <td>结实性</td>
		  <td>
		  	<select id="firmness" name="firmness">
		  		<option value="">未选择</option>
		  		<option value="易结">易结实</option>
		  		<option value="可结实">可结实</option>
		  		<option value="不易结实">不易结实</option>
		  		<option value="不结实">不结实</option>
		  	</select>
		  </td>
		  <td>花粉量</td>
		  <td>
		  	<select id="pollenamount" name="pollenamount">
		  		<option value="">未选择</option>
		  		<option value="多">多</option>
		  		<option value="中">中</option>
		  		<option value="少">少</option>
		  	</select>
		  </td>
		</tr>

		<tr>
          <td>花粉活力</td>
		  <td>
          	<input id="pollenvitality" type="text" name="pollenvitality" placeholder="请输入花粉活力">
          </td>
          <td>田间综合表现</td>
		  <td>
		  	<select id="fieldperformance" name="fieldperformance">
		  		<option value="">未选择</option>
		  		<option value="强">强</option>
		  		<option value="中">中</option>
		  		<option value="弱">弱</option>
		  		<option value="待定">待定</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>
		
		<tr>
		  <td>耐热性</td>
		  <td>
		  	<select id="heatresistance" name="heatresistance">
		  		<option value="">未选择</option>
		  		<option value="强">强</option>
		  		<option value="中">中</option>
		  		<option value="弱">弱</option>
		  		<option value="待定">待定</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		  <td>耐寒性</td>
          <td>
		  	<select id="coldresistance" name="coldresistance">
		  		<option value="">未选择</option>
		  		<option value="强">强</option>
		  		<option value="中">中</option>
		  		<option value="弱">弱</option>
		  		<option value="待定">待定</option>
		  	</select>
		  	<span class="required"> * </span>
		  </td>
		</tr>

		<tr>
          <td>白粉病抗性</td>
          <td>
          	<select id="powderymildew" name="powderymildew">
		  		<option value="">未选择</option>
		  		<option value="强">强</option>
		  		<option value="中">中</option>
		  		<option value="弱">弱</option>
		  		<option value="待定">待定</option>
		  	</select>
          	<span class="required"> * </span>
          </td>
          <td>黑斑病抗性</td>
          <td>
          	<select id="blackspot" name="blackspot">
		  		<option value="">未选择</option>
		  		<option value="强">强</option>
		  		<option value="中">中</option>
		  		<option value="弱">弱</option>
		  		<option value="待定">待定</option>
		  	</select>
          	<span class="required"> * </span>
          </td> 
        </tr> 
           
		
		<tr>
		  <td class="valign-top" valign="top">图片</td>
		  <td colspan="3" class="td-picture">
		  	<a id="btn-file" class="btn" href="javascript:void(0);">选择上传文件
		  		<input type="file" id="picture" name="pciture">
		  	</a>
		  	<div id="showPicture">
		  		<!-- <div class="item">
		  			<img src="images/6.jpg" alt="" /><div class="action">
		  				<a href="javascript:void(0);" title="查看大图"><i  class="fa fa-eye fa-lg"></i></a>
		  				<a href="javascript:void(0);" title="删除图片"><i  class="fa fa-remove fa-lg"></i></a>
		  			</div>
		  		</div> -->
		  	</div>
		  </td>
		</tr>
 
		<tr>
		  <td class="valign-top" valign="top">备注</td>
		  <td colspan="3">
		  	<textarea name="remark" id="remark"></textarea>
		  </td>
		</tr>

		<tr>
		  <td></td>
		  <td colspan="3">
		  	<input class="btn" type="submit" value="提交">
		  </td>
		</tr>

      </table>
      </form>
      
      <!-- 查看大图 -->
      <div id="mask">
      	<div id="picture-box">
      		<img id="img" src=""/>
      		<button id="closeBox">
      			<i  class="fa fa-remove"></i>
      		</button>
      	</div>
      </div>
      
    </div> <!-- main-box -->

<!-- Jquery表单验证插件 -->
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/jquery.validate.min.js"></script>

<script src="js/rose.js"></script>
<script>

var picture = document.getElementById("picture");
//数组存储上传图片
var imgLib = new Array();
//图片上传实时预览
function preview(file) {
    if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.value))
    {
      alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
      return false;
    }
	if (file.files && file.files[0])
	{
	    imgLib.push(file.files[0]);
		
		var reader = new FileReader();
		reader.onload = function(evt){
			var div = document.createElement("div");
			div.className = "item";
			div.innerHTML = '<img src="' + evt.target.result + '" alt="'+file.files[0].name+'"/>'
			+'<div class="action">'
				+'<a href="javascript:void(0);" title="查看大图"><i  class="fa fa-eye fa-lg"></i></a>'
  				+'<a href="javascript:void(0);" title="删除图片"><i  class="fa fa-remove fa-lg"></i></a>'
  			+'</div>';
			showPicture.appendChild(div);
		}
		reader.readAsDataURL(file.files[0]);
	} else
	{
		style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'" + file.value + '\'"></div>';
	}
}

//上传图片
function upload(imgLib) {
	for(var i=0;i<imgLib.length;i++) {
		console.log("第"+(i+1)+"个文件名字是:"+imgLib[i].name);
		
		var XHR = new XMLHttpRequest();
		XHR.open("post","fileUpload",true);
		var formData = new FormData();
		var specie = document.getElementById("specie").value;
		formData.append("specie",specie);
		formData.append("img",imgLib[i]);
		formData.append("fileName",imgLib[i].name);
		
		XHR.send(formData);
		XHR.onreadystatechange = function() {
			if(XHR.readyState == 4) { //判断交互是否成功
				if(XHR.status == 200) { //获取服务器返回的数据
					if(XHR.responseText == "success") {
						console.log("上传成功");
					} else if(XHR.responseText == "fail") {
						console.log("上传失败");
					}
				} else {
					alert("Request was unsuccessful:"+xhr.status);
				}
			}
		}   
		
	}
}
picture.onchange = function() {
	preview(this);
}
//表单输入验证--JQUERY插件
$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	$("#roseForm").validate({
	rules: {
		specie: {
			required: true,
			remote: {
                url: "isSpecie",
                type: "post",
                data: {
                	"specie": function() {
                        return $("#specie").val();
                    },
                },
                dataFilter: function (data) {//判断控制器返回的内容
                    if (data == "true") {
                        return false;
                    }
                    else {
                    	return true;
                    }
                }
            }
		},
		classification: {
			required: true,
		},
		type: {
			required: true,
		},
		height: {
			required: true,
		},
		twigscolor: {
			required: true,
		},
		hasthorn: {
			required: true,
		},
		thornshape: {
			required: true,
		},
		thorndensity: {
			required: true,
		},
		lobularnumber: {
			required: true,
		},
		leafarea: {
			required: true,
		},
		topleafletslong: {
			number: true,
		},
		topleafletswide: {
			number: true,
		},
		topleaflets: {
			number: true,
		},
		lobularshape: {
			required: true,
		},
		leaftexture: {
			required: true,
		},
		leaveluster: {
			required: true,
		},
		newleafcolor: {
			required: true,
		},
		oldleafcolor: {
			required: true,
		},
		fieldperformance: {
			required: true,
		},
		heatresistance: {
			required: true,
		},
		coldresistance: {
			required: true,
		},
		powderymildew: {
			required: true,
		},
		blackspot: {
			required: true,
		},
		flowertime: {
			required: true,
		},
		inflorescence: {
			required: true,
		},
		flowercolor: {
			required: true,
		},
		singleColor: {
			required: true,
		},
		singleflowerperiod: {
			number: true,
		},
		multiplyColor: {
			required: true,
		},
		floral: {
			required: true,
		},
		singledoublepetal: {
			required: true,
		},
		flowerpattern: {
			required: true,
		},
		flowerroll: {
			required: true,
		},
		petalshape: {
			required: true,
		},
	},
	messages: {
		specie: {
			required: "请输入品种名",
			remote: "品种名已存在"
		},
		classification: {
			required: "请选择分类",
		},
		type: {
			required: "请选择株型",
		},
		height: {
			required: "请选择株高",
		},
		twigscolor: {
			required: "请选择嫩枝颜色",
		},
		hasthorn: {
			required: "请选择有无刺",
		},
		thornshape: {
			required: "请选择刺形状",
		},
		thorndensity: {
			required: "请选择刺密度",
		},
		lobularnumber: {
			required: "请选择小叶数量",
		},
		leafarea: {
			required: "请选择面积大小",
		},
		topleafletslong: {
			number: "请输入数值",
		},
		topleafletswide: {
			number: "请输入数值",
		},
		topleaflets: {
			number: "请输入数值",
		},
		lobularshape: {
			required: "请选择小叶形态",
		},
		leaftexture: {
			required: "请选择叶片质地",
		},
		leaveluster: {
			required: "请选择叶片光泽",
		},
		newleafcolor: {
			required: "请选择新叶叶色",
		},
		oldleafcolor: {
			required: "请选择老叶叶色",
		},
		fieldperformance: {
			required: "请选择田间综合表现",
		},
		heatresistance: {
			required: "请选择耐热性",
		},
		coldresistance: {
			required: "请选择耐寒性",
		},
		powderymildew: {
			required: "请选择白粉病抗性",
		},
		blackspot: {
			required: "请选择黑斑病抗性",
		},
		flowertime: {
			required: "请选择开花时间",
		},
		inflorescence: {
			required: "请选择花序",
		},
		floral: {
			required: "请选择花香",
		},
		flowercolor: {
			required: "请选择花色",
		},
		singleColor: {
			required: "请选择单色",
		},
		singleflowerperiod: {
			number: "请输入数值",
		},
		multiplyColor: {
			required: "请选择复色",
		},
		singledoublepetal: {
			required: "请选择单重瓣",
		},
		flowerpattern: {
			required: "请选择花型",
		},
		flowerroll: {
			required: "请选择花瓣翻卷",
		},
		petalshape: {
			required: "请选择花瓣形状",
		},
		
	}, 
		submitHandler: function(form) {  //通过之后回调  

			upload(imgLib);
			
			//添加月季
			var xhr = new XMLHttpRequest();
			xhr.open("post","addRose",true);
			var form = document.getElementById("roseForm");
			var fd = new FormData(form);
			xhr.send(fd);
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4) { //判断交互是否成功
					if(xhr.status == 200) { //获取服务器返回的数据
						/* alert(xhr.responseText);  */ 
						if(xhr.responseText == "success") {
							alert("添加成功");
							//表单清空包括input和select
							var inputs = document.getElementsByTagName("input");
							var selects = document.getElementsByTagName("select");
							for(var i=0;i<inputs.length;i++) {
								inputs[i].value = "";
							}
							for(var i=0;i<selects.length;i++) {
								selects[i].value = "";
								selects[i].options[0].text = "未选择";
							}
							//清空备注
							var remark = document.getElementById("remark");
							remark.value = "";
							//删除图片
							document.getElementById("showPicture").innerHTML = "";
							
						} else if(xhr.responseText == "fail") {
							alert("添加失败");
						}
					} else {
						alert("Request was unsuccessful:"+xhr.status);
					}
				}
			} 
		},
		invalidHandler: function(form, validator) {  //不通过回调  
			alert("添加失败");
	    	return false;  
	    }
	})
});
</script>
<%@ include file="public/footer.jsp" %>