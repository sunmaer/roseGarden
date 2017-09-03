/*
* @Author: SMH
* @Date:   2017-03-12 11:44:34
* @Last Modified by:   SMH
* @Last Modified time: 2017-03-13 16:42:40
*/

/* 后台JS */

/* 获取外部导入css样式 */
function getStyle(obj){

	if(obj.currentStyle){
		return obj.currentStyle;
	}
	else if(window.getComputedStyle)
		return document.defaultView.getComputedStyle(obj,null);
	return null;
}

/* 侧边导航栏的二级菜单展开 */
var submenu = document.getElementsByClassName("submenu");
for (var i=0;i<submenu.length;i++) {
	submenu[i].addEventListener('click',function() {
		var ul = this.childNodes[2];
		if(getStyle(ul).display == "none") {
			ul.style.display = "block";
		} else {
			ul.style.display = "none";
		}
	},false);
}

/* 点击closeBar收缩侧边栏，再次点击展开 */
document.getElementById("closeBar").addEventListener("click",function() {
	var aside = document.getElementsByTagName("aside");
	var container = document.getElementById("container");
	var footer = document.getElementsByTagName("footer")[0];
	if(getStyle(aside[0]).left == "-180px") {
		aside[0].style.left = "0px";
		container.style.paddingLeft = "180px";
		footer.style.left = "180px";
		footer.style.width = "calc(100% - 180px)";
		document.getElementById("closeLogo").className = "fa fa-caret-left";
	} else {
		aside[0].style.left = "-180px";
		container.style.paddingLeft = "0px";
		footer.style.left = "0";
		footer.style.width = "100%";
		document.getElementById("closeLogo").className = "fa fa-caret-right";
	}
},false);

/* 数据导入 */

