  var showRose = document.getElementsByClassName("showRose")[0];
  var compareBox = document.querySelector(".compare-box");
  var compareAll = document.getElementsByClassName("compare-all")[0];
  var closeCompareBox = document.getElementById("close-compareBox");
  var deleteCompareItem = document.getElementsByClassName("compare-item-delete");
  var emptyCmopareBox = document.getElementById("compare-all-reset");
  var compareAction = document.getElementsByClassName("compare-action")[0];
  
  var isLogin = document.getElementById("isLogin");
  var spans = showRose.getElementsByTagName("span");
  var spansLen = spans.length;
  if(isLogin.style.display == "inline-block") {
	  for(var i=0;i<spansLen;i++) {
		  spans[i].style.display = "none";
	  } 
  } else {
	  for(var i=0;i<spansLen;i++) {
		  spans[i].style.display = "inline-block";
	  } 
  }
  
  // 隐藏对比栏
  closeCompareBox.onclick = function() {
    compareBox.style.display = "none";
  }
  // 清空对比栏
  emptyCmopareBox.onclick = function() {
    var compareItem = document.getElementsByClassName("compare-item");
    var len = compareItem.length;
    for (var i=len-1;i>=0;i--) {
      compareAll.removeChild(compareItem[i]);
    }
  }
  // 删除对比项
  compareAll.onclick = function(event) {
    var e = event || window.event;
    var target = e.target || e.srcElement;
    if(target.className == "compare-item-delete") {
      var parent = target.parentNode.parentNode;
      compareAll.removeChild(parent);
    }
  }
  // 对比收藏功能
  showRose.onclick = function(event) {
    var e = event || window.event;
    var target = e.target || e.srcElement;
    if(target.className == "add-compare") { //加入对比
 	 var compareItem = document.getElementsByClassName("compare-item");
     var len = compareItem.length;
     if(len == 4) {
       alert("对比栏已满");
     }
     else {
        compareBox.style.display = "block";
        var imgSrc = target.parentNode.previousSibling.firstChild.getAttribute("src");
        var specie = target.parentNode.childNodes[0].firstChild.innerHTML;

        var div = document.createElement('div');
          div.className = "compare-item";
          div.innerHTML = "<a href=''>"+
            "<img src="+imgSrc+">"+
            "</a>"+
            "<div class='compare-item-info'>"+
              "<span>"+specie+"</span><br/>"+
              "<span class='compare-item-delete'>删除</span>"+
            "</div>";
          compareAll.insertBefore(div,compareAction);
      }
  } else if(target.className == "add-favorite") { //加入收藏
	    var xhr = new XMLHttpRequest();
		xhr.open("post","addFavorite",true);
  		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  		var specie = target.parentNode.childNodes[0].firstChild.innerHTML;
  		xhr.send("specie="+specie);
  		xhr.onreadystatechange = function() {
  			if(xhr.readyState == 4) { //判断交互是否成功
  				if(xhr.status == 200) { //获取服务器返回的数据
  					if(xhr.responseText == "success") {

  						//改变当前项的收藏属性->已收藏
  						target.innerHTML = "取消收藏";
  						target.className = "delete-favorite";
  						
  					} else {
  						alert("加入收藏失败");
  					}
  				} else {
  					alert("Request was unsuccessful:"+xhr.status);
  				}
  			}
  		} 
    } else if(target.className == "delete-favorite") { //取消收藏
    var xhr = new XMLHttpRequest();
    xhr.open("post","deleteFavorite",true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	var specie = target.parentNode.childNodes[0].firstChild.innerHTML;
	xhr.send("specie="+specie);
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) { //判断交互是否成功
			if(xhr.status == 200) { //获取服务器返回的数据
				if(xhr.responseText == "success") {
					
					//改变当前项的收藏属性->未收藏
					target.innerHTML = "加入收藏";
					target.className = "add-favorite";
					
				} else {
					alert("取消收藏失败");
				}
			} else {
				alert("Request was unsuccessful:"+xhr.status);
			}
		}
	} 
   }
 }

 //开始对比
 document.getElementById("compare").onclick = function() {
	 
	 var compareItem = document.getElementsByClassName("compare-item");
     var len = compareItem.length;
     if(len < 2) {
       alert("至少需要加入两项");
     } else {
    	//取对比项的品种名
    	var species;
    	var array = [];
    	var compareItem = document.getElementsByClassName("compare-item");
        var len = compareItem.length;
        for (var i=0;i<len;i++) {
          array.push(compareItem[i].querySelector(".compare-item-info").firstChild.innerHTML);
        } 
    	species = array.toString();
        var compareForm = document.getElementById("compareForm");
        var compareInput = document.getElementById("compareInput");
        compareInput.value = species;
        compareForm.submit();
     }
	
 }
