/*
* @Author: SMH
* @Date:   2017-03-12 11:44:34
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2017-05-01 17:11:25
*/

/* 获取外部导入css样式 */
function getStyle(obj){

	if(obj.currentStyle){
		return obj.currentStyle
	}
	else if(window.getComputedStyle)
		return document.defaultView.getComputedStyle(obj,null)
	return null;
}

//禁用Enter键表单自动提交    
document.onkeydown = function(event) {    
    var target, code, tag;    
    if (!event) {    
        event = window.event; //针对ie浏览器    
        target = event.srcElement;    
        code = event.keyCode;    
        if (code == 13) {    
            tag = target.tagName;    
            if (tag == "TEXTAREA") { return true; }    
            else { return false; }    
        }    
    }    
    else {    
        target = event.target; //针对遵循w3c标准的浏览器，如Firefox    
        code = event.keyCode;    
        if (code == 13) {    
            tag = target.tagName;    
            if (tag == "INPUT") { return false; }    
            else { return true; }     
        }    
    }    
};

var loginMask = document.getElementById("login-mask");
var login = document.getElementById("login");
var register = document.getElementById("register");
var itemLogin = document.getElementById("item-login");
var itemRegister = document.getElementById("item-register");
var loginForm = document.getElementById("login-form");
var registerForm = document.getElementById("register-form");

/* 登录注册弹出框 */
document.getElementById("close-box").onclick = function() {
	loginMask.style.display = "none";
}

/* 顶部导航栏登录点击 */
login.onclick = function() {
	loginMask.style.display = "block";
	//登录按钮添加active类
	itemLogin.className = "active";
	//注册按钮删除active类
    itemRegister.className = "";
	//显示登录表单
	loginForm.style.display = "block";
	//隐藏注册表单
	registerForm.style.display = "none";
}

/* 弹出框登录点击 */
itemLogin.onclick = function() {
	//登录按钮添加active类
	itemLogin.className = "active";
	//注册按钮删除active类
    itemRegister.className = "";
	//显示登录表单
	loginForm.style.display = "block";
	//隐藏注册表单
	registerForm.style.display = "none";
}

/* 顶部导航栏注册点击 */
register.onclick = function() {
	loginMask.style.display = "block";
	//登录按钮删除active类
	itemLogin.className = "";
	//注册按钮添加active类
    itemRegister.className = "active";
	//隐藏登录表单
	loginForm.style.display = "none";
	//显示注册表单
	registerForm.style.display = "block";
}

/* 弹出框注册点击 */
itemRegister.onclick = function() {
	//登录按钮删除active类
	itemLogin.className = "";
	//注册按钮添加active类
    itemRegister.className = "active";
	//隐藏登录表单
	loginForm.style.display = "none";
	//显示注册表单
	registerForm.style.display = "block";
}

// 登录注册
//表单输入验证--JQUERY插件
$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	$("#login-form").validate({
	rules: {
		uid: {
			required: true,
			remote: {
                url: "isUid",
                type: "post",
                data: {
                	"loginUid": function() {
                        return $("#loginUid").val();
                    },
                },
                dataFilter: function (data) {//判断控制器返回的内容
                    if (data == "success") {
                        return true;
                    }
                    else {
                    	return false;
                    }
                }
            }
		},
		password: {
			required: true,
		}
	},
	messages: {
		uid: {
			required: "学/工号不能为空",
			remote: "学/工号不存在"
		},
		password: {
			required: "密码不能为空",
		}
	}, 
	submitHandler: function(form) {  //通过之后回调  
		//用户登录
		var xhr = new XMLHttpRequest();
		xhr.open("post","userLogin",true);
		var form = document.getElementById("login-form");
		var fd = new FormData(form);
		xhr.send(fd);
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) { //判断交互是否成功
				if(xhr.status == 200) { //获取服务器返回的数据
					if(xhr.responseText == "yes") {
						loginMask.style.display = "none";
						
						//刷新当前页面
						window.location.reload();
						
					} else {
						alert(xhr.responseText);
					}
				} else {
					alert("Request was unsuccessful:"+xhr.status);
				}
			}
		} 
	},
	});
	
	//登录后显示用户名
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("get","showName",true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if(xmlhttp.readyState == 4) { //判断交互是否成功
			if(xmlhttp.status == 200) { //获取服务器返回的数据
				document.getElementById("userName").innerHTML = "您好,"+xmlhttp.responseText;
			}
		}
	}
	
	$("#register-form").validate({
		rules: {
			uid: {
				required: true,
				remote: {
	                url: "isUid",
	                type: "post",
	                data: {
	                	"registerUid": function() {
	                        return $("#registerUid").val();
	                    },
	                },
	                dataFilter: function (data) {//判断控制器返回的内容
	                    if (data == "success") {
	                        return false;
	                    }
	                    else {
	                    	return true;
	                    }
	                }
	            }
			},
			name: {
				required: true,
			},
			password: {
				required: true,
			},
			conPassword: {
				required: true,
				equalTo: "#registerPassword"
			},
			telephone: {
				required: true,
				digits: true,
				maxlength: 11,
				minlength: 11,
			},
		},
		messages: {
			uid: {
				required: "学/工号不能为空",
				remote: "学/工号已存在"
			},
			name: {
				required: "用户名不能为空",
			},
			password: {
				required: "密码不能为空",
			},
			conPassword: {
				required: "确认密码不能为空",
				equalTo: "两次密码输入不一致"
			},
			telephone: {
				required: "手机号码不能为空",
				digits: "手机号码必须为11位数字",
				maxlength: "手机号码必须为11位数字",
				minlength: "手机号码必须为11位数字",
			},
		}, 
		submitHandler: function(form) {  //通过之后回调  
			//用户注册
			var xhr = new XMLHttpRequest();
			xhr.open("post","registerUser",true);
			var form = document.getElementById("register-form");
			var fd = new FormData(form);
			xhr.send(fd);
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4) { //判断交互是否成功
					if(xhr.status == 200) { //获取服务器返回的数据
						if(xhr.responseText == "success") {
							form.reset();
							loginMask.style.display = "none";
							alert("注册成功，请等待管理员审核");
							
						} else if(xhr.responseText == "fail") {
							alert("注册失败");
						}
					} else {
						alert("Request was unsuccessful:"+xhr.status);
					}
				}
			} 
		},
		});
	
	//个人中心
	$("#admin-form").validate({
		rules: {
			name: {
				required: true,
			},
			conPassword: {
				equalTo: "#adminPassword"
			},
			telephone: {
				required: true,
				digits: true,
				maxlength: 11,
				minlength: 11,
			},
		},
		messages: {
			name: {
				required: "用户名不能为空",
			},
			conPassword: {
				equalTo: "两次密码输入不一致"
			},
			telephone: {
				required: "手机号码不能为空",
				digits: "手机号码必须为11位数字",
				maxlength: "手机号码必须为11位数字",
				minlength: "手机号码必须为11位数字",
			},
		}, 
		submitHandler: function(form) {  //通过之后回调  
			//用户注册
			var xhr = new XMLHttpRequest();
			xhr.open("post","updateUser",true);
			var form = document.getElementById("admin-form");
			var fd = new FormData(form);
			fd.append("uid",$("#adminUid").val());
			xhr.send(fd);
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4) { //判断交互是否成功
					if(xhr.status == 200) { //获取服务器返回的数据
						if(xhr.responseText == "success") {
											
							location.href = "userOut";
							
						} else if(xhr.responseText == "fail") {
							alert("修改失败");
						}
					} else {
						alert("Request was unsuccessful:"+xhr.status);
					}
				}
			} 
		},
		})
});

//根据月季品种名搜索
document.getElementById("all-search").onclick = function() {
	var form = document.getElementById("roseSearch");
	var specie = document.getElementById("search-specie");

    var xhr = new XMLHttpRequest();
    //判断输入内容是中文还是英文
    for(var i = 0; i < specie.value.length; i++) {
		if(specie.value.charCodeAt(i) < 19968 || specie.value.charCodeAt(i) > 40869) { 
		   form.setAttribute("action", "searchLetter")
		   break;
		}else{
			form.setAttribute("action", "normalSearch")
		} 
	}
	
	form.submit();
}
