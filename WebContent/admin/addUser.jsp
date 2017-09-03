<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 用户管理
	    <i class="fa fa-angle-right fa-lg"></i> 添加用户
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	超级管理员和普通管理员可以在本版块添加用户，提交前请填写用户信息。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">添加用户
		
      </div>
      <form method="post" id="form-addUser" >
	      <table class="see addRose list">
	        <tr>
	          <td>用户名</td>
	          <td>
	          	<input id="name" name="name" type="text" placeholder="用户昵称">
	          	<span class="required"> * </span>
	          	<span id="nameError" class="error">用户名不能为空</span>
	          </td>
	        </tr>
	        <tr>
	          <td>学/工号</td>
	          <td>
	          	<input id="uid" name="uid" type="text" placeholder="学/工号">
	          	<span class="required"> * </span>
	          	<span id="uidError" class="error">学/工号不能为空</span>
	          </td>
	        </tr>
	        
	       	<!-- 防止浏览器缓存密码 -->
	        <tr style="display: none;">
	          <td>密码</td>
	          <td><input type="password"  value="" ></td>
	        </tr>
	        <!--  -->
	        
	        <tr>
	          <td>密码</td>
	          <td>
	          	<input id="password" name="password" type="password" value="">
	          	<span class="required"> * </span>
	          	<span id="passwordError" class="error">密码不能为空</span>
	          </td>
	        </tr>
	        <tr>
	          <td>确认密码</td>
	          <td>
	          	<input id="ackpassword" name="ackpassword" type="password" value="">
	          	<span class="required"> * </span>
	          	<span id="ackpasswordError" class="error">两次密码输入不一致</span>
	          </td>
	        </tr>
	        <tr>
	          <td>手机号码</td>
	          <td>
	          	<input id="telephone" name="telephone" type="text" placeholder="手机号码">
	          	<span class="required"> * </span>
	          	<span id="telephoneError" class="error">手机号码不能为空</span>
	          </td>
	        </tr>
	  		
	        <tr>
			  <td></td>
			  <td>
			  	<input id="addUser" class="btn" type="submit" value="提交">
			  </td>
			</tr>
	
	      </table>
      </form>
    </div> <!-- main-box -->


<script>
	/* 添加普通管理员 */
	var aname = document.getElementById("name");
	var uid = document.getElementById("uid");
	var password = document.getElementById("password");
	var ackpassword = document.getElementById("ackpassword");
	var telephone = document.getElementById("telephone");
	var nameError = document.getElementById("nameError");
	var uidError = document.getElementById("uidError");
	var passwordError = document.getElementById("passwordError");
	var ackpasswordError = document.getElementById("ackpasswordError");
	var telephoneError = document.getElementById("telephoneError");
	
	//用户名验证
	function nameCheck() {
		if(aname.value == "") {
			nameError.style.display = "inline";
			return false;
		} else {
			nameError.style.display = "none";
			return true;
		}
	}
	//学/工号验证
	function uidCheck() {
		//不能为空
		if(uid.value == "") {
			uidError.innerText = "学/工号不能为空";
			uidError.style.display = "inline";
			return false;
		} else {
			//13位数字
			var reg = /^\d{12,13}$/;
			if(!reg.test(uid.value)) {
				uidError.innerText = "学/工号由12或13位数字组成";
				uidError.style.display = "inline";
				return false;
			} else {
				uidError.style.display = "none";
				var xhr = new XMLHttpRequest();
				xhr.open("post","checkUserID",false);
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
				xhr.send("uid="+uid.value);
				console.log(xhr.responseText);
				if(xhr.responseText == "UID已经存在") {
					uidError.innerText = "学/工号已存在";
					uidError.style.display = "inline";
					return false;
				} else if(xhr.responseText == "UID不存在") {
					uidError.style.display = "none";
					return true;
				}
			}
		}
	}
	//密码验证
	function passwordCheck() {
		if(password.value == "") {
			passwordError.innerText = "密码不能为空";
			passwordError.style.display = "inline";
			ackpasswordError.style.display = "none";
			return false;
		} else {
			passwordError.style.display = "none";
			if(password.value != ackpassword.value) {
				ackpasswordError.innerText = "两次密码输入不一致";
				ackpasswordError.style.display = "inline";
				return false;
			} else {
				ackpasswordError.style.display = "none";
				return true;
			}
		}
	}
	//确认密码验证
	function ackpasswordCheck() {
		if(ackpassword.value != password.value) {
			ackpasswordError.innerText = "两次密码输入不一致";
			ackpasswordError.style.display = "inline";
			return false;
		} else {
			ackpasswordError.style.display = "none";
			return true;
		}
	}
	//手机号码验证
	function telephoneCheck() {
		if(telephone.value == "") {
			telephoneError.style.display = "inline";
			return false;
		} else {
			telephoneError.style.display = "none";
			return true;
		}
	}
	
	var timer=false;
	aname.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			nameCheck();
		},300);
	}, false);
	aname.addEventListener('focus',nameCheck, false);
	aname.addEventListener('blur',nameCheck, false);
	
	uid.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			uidCheck();
		},300);
	}, false);
	uid.addEventListener('focus',uidCheck, false);
	uid.addEventListener('blur',uidCheck, false);
	
	password.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			passwordCheck();
		},300);
	}, false);
	password.addEventListener('focus',passwordCheck, false);
	password.addEventListener('blur',passwordCheck, false);
	
	ackpassword.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			ackpasswordCheck();
		},300);
	}, false);
	ackpassword.addEventListener('focus',ackpasswordCheck, false);
	ackpassword.addEventListener('blur',ackpasswordCheck, false);
	
	telephone.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			telephoneCheck();
		},300);
	}, false);
	telephone.addEventListener('focus',telephoneCheck, false);
	telephone.addEventListener('blur',telephoneCheck, false);
	
	document.getElementById("addUser").onclick = function() {
		// || 短路特性  | 没有短路特性
		if(!nameCheck()| !uidCheck() | !passwordCheck() | !ackpasswordCheck() | !telephoneCheck()) {
			return false;
		}  else {
			//建立XMLHttpRequest对象
			var xhr = new XMLHttpRequest();
			//使用OPEN方法与服务器建立连接
			xhr.open("post","addUser",true);
			//序列化表单数据
			var form = document.getElementById("form-addUser");
			//向服务器端发送数据
			xhr.send(new FormData(form));
			//回调函数中针对不同的响应状态进行处理 
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4) { //判断交互是否成功
					if(xhr.status == 200) { //获取服务器返回的数据
						/* alert(xhr.responseText); */ 
						if(xhr.responseText == "success") {
							alert("添加成功");
							aname.value = "";
							uid.value = "";
							password.value = "";
							ackpassword.value = "";
							telephone.value = "";
						} else if(xhr.responseText == "fail") {
							alert("添加失败，请重新添加");
						}
					
					} else {
						alert("Request was unsuccessful:"+xhr.status);
					}
				}
			}
		}			
		//取消按钮的默认提交
		return false;
	}
</script>
<%@ include file="public/footer.jsp" %>