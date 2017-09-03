<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>管理员登录</title>
	<link rel="shortcut icon" href="<%=path%>/images/rose.ico" mce_href="<%=path%>/images/rose.ico" type="image/x-icon">
	<!-- css reset -->
    <link href="css/reset-rose.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

	<style>
		/*-----------------后台登录界面-----------------*/
		body {
		    background-color: #f9f9f9;
		    color: #666666;
		}
		.login-container {
			position: fixed;
			width: 100%;
			height: 100%;
		}
		.login-box {
			margin: 100px auto;
			width: 350px;
		}
		.login-box h3 {
			position: relative;
			margin-bottom: 30px;
			padding-left: 30px;
			font-size: 23px;
			font-weight: 400;
			color: #444444;
			text-align: center;
		}
		.login-box .wrapper {
			padding: 40px 0;
			width: 100%;
			/*height: 300px;*/
			background: #f0f0f0;
			border: 1px solid #ccc;
		}
		.login-box .wrapper .item {
			/*text-align: center;*/
			position: relative;
			margin: 0 0 0 50px;
		}
		.login-box .wrapper .item:not(:nth-of-type(4)) {
			margin-bottom: 25px;
		}
		.login-box .wrapper .item i {
			position: absolute;
			text-align: center;
			width: 35px;
			margin-top: 10px;
		}
		.login-box input:not([type="submit"]) {
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			padding-left: 35px;
			width: 250px;
			height: 35px;
			font-size: 12px;
			border: 1px solid #ddd;
		}
		#verifyCode {
			margin-right: 10px;
			width: 150px;
		}
		#checkCode {
			float: right;
			margin-right: 50px;
			padding: 0;
			width: 90px;
			font-size: 15px;
			font-weight: bold;
			letter-spacing: 2px;
			border: 1px solid #ccc;
			background-color: #ddd;
		}		
		.login-box input[type="submit"] {
			width: 250px;
			height: 35px;
		}
		/* 按钮样式 */ 
		 .btn {
		 	display: inline-block;
		 	background-color: #0072C6;
		 	-moz-border-radius: 2px;
		 	-webkit-border-radius: 2px;
		 	border: 0;
		 	color: #FFF;
		 	padding: 6px 15px;
		 	font-size: 12px;
		 	font-weight: bold;
		 	text-transform: capitalize;
		 	cursor: pointer;
		 	-webkit-appearance: none;
		 }
		  .fa-leaf {
		  	position: absolute;
			top: 4px;
			left: 30px;
		  	color: #5FBF4A;
		  }
		  /* 表单验证判断提示信息 */
		  .error {
		  	position: absolute;
		  	top: 38px;
		  	left: 5px;
		  	display: none;
		  	font-size: 13px;
		  	color: red;
		  }
		  .logo {
		  	width: 40px;
		  	position: absolute;
			top: -7px;
			left: 20px;
		  }

	</style>
  </head>
  <body>
  
    <div class="login-box">
    	<h3> <!-- <i class="fa fa-leaf"></i> <--><img class="logo" src="images/rose1.png" alt="蔷薇花园" /> &nbsp;蔷薇花园管理系统登录</h3>
    	<div class="wrapper">
    		<form action="" method="post" id="admin" autocomplete="off">
    			<div class="item">
    				<label for="userName"><i class="fa fa-user fa-lg"></i></label> 
    				<input type="text" id="aid" name="aid" placeholder="学/工号"/>
    				<span id="aidError" class="error"></span>
    			</div>
    			<div class="item">
    				<label for="passWord"><i class="fa fa-lock fa-lg"></i></label> 
    				<input type="password" id="password" name="password" placeholder="密码" />
    				<span id="passwordError" class="error"></span>
    			</div>
    			<div class="item">
    				<label for="verifyCode"><i class="fa fa-sort-alpha-asc fa-lg"></i></label> 
    				<input type="text" id="verifyCode" name="verifyCode" placeholder="验证码" />
    				<input type="button"  id="checkCode" value="" onClick="createCode()" />
    				<span id="verifyCodeError" class="error"></span>
    			</div>
    			<div class="item">
    				<input class="btn" type="submit" id="adminLogin" value="登 录" />
    			</div>
    		</form>
    	</div> <!-- wrapper -->
    	
    	
    </div> <!-- login-box -->
    <script src="js/verifyCode.js"></script>
	<script>
		var aid = document.getElementById("aid");
		var password = document.getElementById("password");
		var verifyCode = document.getElementById("verifyCode");  
	    var checkCode = document.getElementById("checkCode");
	    
		var aidError = document.getElementById("aidError");
		var passwordError = document.getElementById("passwordError");
		var verifyCodeError = document.getElementById("verifyCodeError");
		
		//学/工号验证
		function aidCheck() {
			if(aid.value == "") {
				aidError.innerText = "请输入学/工号";
				aidError.style.display = "block";
				return false;
			} else if(aid.value != ""){
				aidError.style.display = "none";
				/* 异步判断用户是否存在 */
				//建立XMLHttpRequest对象
				var xhr = new XMLHttpRequest();
				//使用OPEN方法与服务器建立连接--false表示同步
				xhr.open("post","checkLogin",false);
				//向服务器端发送数据
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
				xhr.send("aid="+aid.value);
				
				/* Ajax同步 */  
				if(xhr.responseText == "success") {
					aidError.style.display = "none";
					return true;
				} else if(xhr.responseText == "fail") {
					aidError.innerText = "学/工号不存在";
					aidError.style.display = "block";
					return false;
				}
				
			}
		}
		
		//密码验证
		function passwordCheck() {
			if(password.value == "") {
				passwordError.innerText = "请输入登录密码";
				passwordError.style.display = "block";
				return false;
			} else {
				passwordError.style.display = "none";
				return true;
			}
		}
		
		//验证码验证
		function verifyCodeCheck() {
			if(verifyCode.value.toUpperCase() == "") {
				verifyCodeError.innerText = "验证码不得为空";
				verifyCodeError.style.display = "block";
				return false;
			} else {
				if(verifyCode.value.toUpperCase() != checkCode.value) {
					verifyCodeError.innerText = "验证码输入错误";
					verifyCodeError.style.display = "block";
					return false;
				} else {
					verifyCodeError.style.display = "none";
					return true;
				}
			}
		}
		
		/* 元素绑定focus、blur、keyup事件,注意函数防抖,避免keyup事件频繁触发*/
		/* 用户名 */
		var timer = false;
		/* aid.addEventListener('keyup', function() {
			clearTimeout(timer);
			timer = setTimeout(function() {
				aidCheck();
			},300);
		}, false); */
		aid.addEventListener('keyup',aidCheck, false);
		aid.addEventListener('focus',aidCheck, false);
		aid.addEventListener('blur',aidCheck, false);
		
		/* 密码 */
		/* password.addEventListener('keyup', function() {
			clearTimeout(timer);
			timer = setTimeout(function() {
				passwordCheck();
			},300);
		}, false); */
		password.addEventListener('keyup',passwordCheck, false);
		password.addEventListener('blur',passwordCheck, false);
		
		/* 验证码 */
		/* verifyCode.addEventListener('keyup', function() {
			clearTimeout(timer);
			timer = setTimeout(function() {
				verifyCodeCheck()
			},300);
		}, false); */
		verifyCode.addEventListener('keyup',verifyCodeCheck, false);
		
		/* 管理员登录--ajax异步提交 */
		document.getElementById("adminLogin").onclick = function() {	
			if(!aidCheck() || !passwordCheck() || !verifyCodeCheck()) {
				return false;
			} else {
				//建立XMLHttpRequest对象
				var xhr = new XMLHttpRequest();
				//使用OPEN方法与服务器建立连接
				xhr.open("post","adminLogin",true);
				//序列化表单数据
				var form = document.getElementById("admin");
				//向服务器端发送数据
				xhr.send(new FormData(form));
				//回调函数中针对不同的响应状态进行处理 
				xhr.onreadystatechange = function() {
					if(xhr.readyState == 4) { //判断交互是否成功
						if(xhr.status == 200) { //获取服务器返回的数据
							/* alert(xhr.responseText); */
							if(xhr.responseText == "success") {
								passwordError.style.display = "none";
								location.href = "findInfo";
							} else if(xhr.responseText == "fail") {
								passwordError.innerText = "登录密码错误";
								passwordError.style.display = "block";
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

  </body>
</html>