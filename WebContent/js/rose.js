/**
 * 增加月季、月季编辑JS文件
 */

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
/*大图垂直居中函数*/
function middle() {
	var screenHeight = document.body.clientHeight;
	var height = parseInt(getStyle(pictureBox).height);
	pictureBox.style.marginTop = (screenHeight - height)/2 + 'px';
	window.onresize = function() {
		var screenHeight = document.body.clientHeight;
		var height = parseInt(getStyle(pictureBox).height);
		pictureBox.style.marginTop = (screenHeight - height)/2 + 'px';
	}
}



var showPicture = document.getElementById("showPicture");
var mask = document.getElementById("mask");
var pictureBox = document.getElementById("picture-box");
var img = document.getElementById("img");

//查看大图
showPicture.onclick = function(e) {
	e = e || window.event;
    var t = e.target || e.srcElement;  //t:目标对象
    var className = t.className;//class名称
    var tagName = t.tagName;
    if( tagName=="IMG" || className == "fa fa-eye fa-lg") {
    	//把缩略图的地址给大图的src
    	if(tagName == "IMG") {
    		var preImg = t;
    	}
    	else {
    		var preImg = t.parentNode.parentNode.previousSibling;
    	}
    	img.src = preImg.src;
    	mask.style.display = "block";
    	middle();
    }else if(className == "fa fa-remove fa-lg") {
    	var item = t.parentNode.parentNode.parentNode;
    	showPicture.removeChild(item);
    }
}

//关闭查看大图
document.getElementById("closeBox").onclick = function() {
	mask.style.display = "none";
}

//月季编辑select
var selects = document.getElementsByTagName("select");
//选中与第一项相同的项
for(var i=0;i<selects.length;i++) {
	var len = selects[i].options.length;
	for (var j=1;j<len;j++) {
		if(selects[i].options[j].text == selects[i].options[0].text) {
			selects[i].options[j].select = true;
			break;
		}
	}
}


/*------------------- 二级指标的显示  ------------------*/
//分类
var classification = document.getElementById("classification");
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

//开花时间
var flowertime = document.getElementById("flowertime");
var flowerstart = document.getElementById("flowerstart");
var flowerbloom = document.getElementById("flowerbloom");
var flowerend = document.getElementById("flowerend");
if(flowertime.value == "一季") {
	flowerstart.disabled = false;
	flowerbloom.disabled = false;
	flowerend.disabled = false;
} else {
	flowerstart.disabled = true;
	flowerbloom.disabled = true;
	flowerend.disabled = true;
}
flowertime.onchange = function() {
	if(flowertime.value == "一季") {
		flowerstart.disabled = false;
		flowerbloom.disabled = false;
		flowerend.disabled = false;
	} else {
		flowerstart.disabled = true;
		flowerbloom.disabled = true;
		flowerend.disabled = true;
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
}

