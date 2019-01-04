<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>管理员登录</title>
</head>
<script src="js/jquery.min.js"></script>
<style>
*:focus{
	outline: none; 
}
	input{
		border:none;
	}
</style>
<body background="images/loginbg.jpg" style="background-repeat: none;">
	<table border="1px" align="center" style="margin-top:300px;">
		<tr>
			<td>用户名</td>
			<td><input id="username" type="text" value="root"/></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input id="password" type="password" value="123456"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button id="managerSubmit">登录</button></td>
		</tr>
	</table>
	<script type="text/javascript">
        	$('#managerSubmit').on('click', function(){
        		var jsonObject={
        				"id":"null",
        				"username":$('#username').attr('value'),
        				"password":$('#password').attr('value')
        		};
        		$.post("manager/login",{jsonString:JSON.stringify(jsonObject)},
						function(result){
        				var re=eval("("+result+")");
							if(re.status){
								window.location.href="bg_user.jsp";
							}else{
								alert("密码错误");
							}
						}
					)
        	})
        </script>
</body>
</html>
    