/* 验证码 */
var code;   
function createCode() {  
    code = new Array();  
    var codeLength = 4;  
    var checkCode = document.getElementById("checkCode");  
    checkCode.value = "";  
    var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D',  
            'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R',  
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');  
    for ( var i = 0; i < codeLength; i++) {  
        var charIndex = Math.floor(Math.random() * 32);  
        code += selectChar[charIndex];  
    }  
    if (code.length != codeLength) {  
        createCode();  
    }  
    checkCode.value = code;  
};  
  
function validatecode(){  
    var verifyCode = document.getElementById("verifyCode").value.toUpperCase();  
    var checkCode = document.getElementById("checkCode").value;  
    if(verifyCode==null|verifyCode!=checkCode){  
        alert("验证码输入错误！");  
        document.getElementById("verifyCode").focus();  
        return true;  
    }else{  
        document.getElementById("form1").submit();  
    }  
};
//设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
window.onload = function (){
    createCode();
};