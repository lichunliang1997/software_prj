<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>编辑信息</title>
	<meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link href="css/zui.min.css" rel="stylesheet">
	<!-- ZUI Javascript 依赖 jQuery -->
	<script src="js/jquery-1.7.min.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="js/zui.min.js"></script>
	<script src="js/zui.jedate.js"></script>
	<!--****************自定义CSS**************-->
	<link rel="stylesheet" href="css/pc_editinformation.css">
	<!--******************外部引用包************-->
	<link href="lib/datetimepicker/datetimepicker.min.css" rel="stylesheet">
	<script src="lib/datetimepicker/datetimepicker.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <style>
    	.banner{
    		width: 100%;
    		height: 180px;
    	}
    	*:focus{
			outline: none; 
		}
		input{
			border: 2px solid #e3e8ee;
			height: 35px;
		}
		.infoBg{
			width: 70px;
			height: 35px;
			background: #3280fc;
			text-align: center;
			color:white;
		}
    </style>
	
<body style="background: #dbdbdb;">
<input type="file" name="userFile" id="userFile" style="display: none;" onchange="filechange(event)">

	<div class="banner" style="background-image: url(images/personalCenter/wenli2.png);background-size: 100% 100%;position: relative;">
		<a href="pc_home.jsp"><img alt="" src="images/kkk.png" width="30px" height="30px" style="position: absolute;top:5px;left:5px;"></a>
	</div>
	<table style="border-collapse:separate; border-spacing:0px 10px;" align="center">
		<tr>
			<td colspan="2">
				
					
			
				<div style="width: 70px;height:70px;border-radius: 50%;border:2px solid #e3e8ee;" id="try"><img id="headPortrait" alt="" src="${user.headPortrait}" style="border-radius: 50%;width: 100%;height: 100%;" ></div>
			</td>
		</tr>
		<tr>
			<td class="infoBg">姓名</td><td><input id="name" class="infoUpdate" value="${user.information.name}"/></td>
		</tr>
		<tr>
			<td class="infoBg">昵称</td><td><input id="nickname" class="infoUpdate" value="${user.nickname}"/></td>
		</tr>
		<tr>
			<td class="infoBg">年龄</td><td><input id="age" class="infoUpdate" value="${user.information.age}"/></td>
		</tr>
		<tr>
			<td class="infoBg">微信</td><td><input id="weChat" class="infoUpdate" value="${user.weChat}"/></td>
		</tr>
		<tr>
			<td class="infoBg">QQ</td><td><input id="qq" class="infoUpdate" value="${user.qq}"/></td>
		</tr>
		<tr>
			<td class="infoBg">个人介绍</td><td><input id="clazz" class="infoUpdate" value="${user.information.clazz}"/></td>
		</tr>
		<tr>
			<td class="infoBg">学校</td><td><input id="school" class="infoUpdate" value="${user.information.school}"/></td>
		</tr>
		<tr>
			<td class="infoBg">学院</td><td><input id="college" class="infoUpdate" value="${user.information.college}"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><div id="change" style="width: 70px;height: 25px;background: #3280fc;color:white;line-height: 25px;border:1px solid #e3e8ee">提  交</div></td>
		</tr>
	</table>
<script type="text/javascript">
var filechange=function(event){
    var files = event.target.files, file;
    if (files && files.length > 0) {
        // 获取目前上传的文件
        file = files[0];// 文件大小校验的动作
        if(file.size > 1024 * 1024 * 2) {
            alert('图片大小不能超过 2MB!');
            return false;
        }
        // 获取 window 的 URL 工具
        var URL = window.URL || window.webkitURL;
        // 通过 file 生成目标 url
        var imgURL = URL.createObjectURL(file);
        //用attr将img的src属性改成获得的url
        $("#headPortrait").attr("src",imgURL);
    }
};
$('#try').on('click',function(){
	$('#userFile').click();
})
$("#change").on('click',function(){
	var jsonObject={
			name:$("#name").val(),
			nickname:$("#nickname").val(),
			age:$("#age").val(),
			weChat:$("#weChat").val(),
			qq:$("#qq").val(),
			clazz:$("#clazz").val(),
			school:$("#school").val(),
			college:$("#college").val()
	}
	$.ajaxFileUpload({
        url: 'update/information',
        fileElementId:'userFile',
        dataType:'txt',
        secureuri : false,
        data:{jsonString:JSON.stringify(jsonObject)},
        type:'post',
        success: function (data){
           alert('修改信息成功');
        }
    });
})
</script>
</body>
	
</html>