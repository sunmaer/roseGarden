<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="public/header.jsp" %>
<%@ include file="public/aside.jsp" %>

<div id="container" class="container">
  <p class="path">
    <i class="fa fa-home fa-lg"></i>
    <span>蔷薇花园 管理中心
	    <i class="fa fa-angle-right fa-lg"></i> 管理员
	    <i class="fa fa-angle-right fa-lg"></i> 个人中心
    </span>
  </p>
  <div class="main">
    <div class="main-box">
      <div class="box-title">版块说明</div>
      <div class="description">
        <p>
        	你可以在本版块查看个人信息，并且可以修改个人信息，但是学/工号信息不能修改。
        </p>
      </div> <!-- description -->
    </div> <!-- main-box -->

    <div class="main-box">
      <div class="box-title">个人信息
		
      </div>
      <form method="post" id="form-updateAdmin" action="updateAdmin" >
	      <table class="see addRose list">
	        <tr>
	          <td>用户名</td>
	          <td>
	          	<input id="name" name="name" type="text" value="${admin.name}" placeholder="用户昵称">
	          	<span class="required"> * </span>
	          	<span id="nameError" class="error">用户名不能为空</span>
	          </td>
	        </tr>
	        <tr>
	          <td>学/工号</td>
	          <td><input  name="aid" type="text" value="${admin.aid }" disabled="true"></td>
	        </tr>
	        <tr>
	          <td>角色</td>
	           <td><input  id="role" name="role" type="text" value="${admin.role }" disabled="true"></td>
	        </tr>
	        <tr style="display: none;">
	          <td>密码</td>
	          <td><input id="password" name="password" type="password"  value="${admin.password }" disabled="true"></td>
	        </tr>
	        <tr>
	          <td>新密码</td>
	          <td>
	          	<input id="npassword" name="npassword" type="password" value="">
	          </td>
	        </tr>
	        <tr>
	          <td>确认密码</td>
	          <td>
	          	<input id="acknpassword" name="acknpassword" type="password" value="">
	          	<span id="acknpasswordError" class="error">两次密码输入不一致</span>
	          </td>
	        </tr>
	        <tr>
	          <td>手机号码</td>
	          <td>
	          	<input id="telephone" name="telephone" type="text" value="${admin.telephone }" placeholder="手机号码">
	          	<span class="required"> * </span>
	          	<span id="telephoneError" class="error">手机号码不能为空</span>
	          </td>
	        </tr>
	  		
	        <tr>
			  <td></td>
			  <td>
			  	<input id="updateAdmin" class="btn" type="submit" value="更新">
			  </td>
			</tr>
	
	      </table>
      </form>
    </div> <!-- main-box -->


<script>
	/* 更新管理员信息 */
	var aname = document.getElementById("name");
	var npassword = document.getElementById("npassword");
	var acknpassword = document.getElementById("acknpassword");
	var telephone = document.getElementById("telephone");
	var nameError = document.getElementById("nameError");
	var acknpasswordError = document.getElementById("acknpasswordError");
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
	//新密码、确认密码验证
	function npasswordCheck() {
		if(npassword.value != acknpassword.value) {
			acknpasswordError.style.display = "inline";
			return false;
		} else {
			acknpasswordError.style.display = "none";
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
	
	npassword.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			npasswordCheck();
		},300);
	}, false);
	
	acknpassword.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			npasswordCheck();
		},300);
	}, false);
	
	telephone.addEventListener('keyup', function() {
		clearTimeout(timer);
		timer = setTimeout(function() {
			telephoneCheck();
		},300);
	}, false);
	
	document.getElementById("updateAdmin").onclick = function() {
		// || 短路特性  | 没有短路特性
		if(!nameCheck()| !npasswordCheck() | !telephoneCheck()) {
			return false;
		}  else {
			//建立XMLHttpRequest对象
			var xhr = new XMLHttpRequest();
			//使用OPEN方法与服务器建立连接
			xhr.open("post","updateAdmin",true);
			//序列化表单数据
			var form = document.getElementById("form-updateAdmin");
			//向服务器端发送数据
			xhr.send(new FormData(form));
			//回调函数中针对不同的响应状态进行处理 
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4) { //判断交互是否成功
					if(xhr.status == 200) { //获取服务器返回的数据
						/* alert(xhr.responseText); */ 
						if(xhr.responseText == "success") {
							alert("更改成功");
							npassword.value = "";
							acknpassword.value = "";
						} else if(xhr.responseText == "fail") {
							alert("信息更改失败，请重新更改");
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