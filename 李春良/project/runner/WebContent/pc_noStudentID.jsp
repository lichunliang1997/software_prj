<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>学生认证</title>
	<meta charset="utf-8">
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
	<link rel="stylesheet" href="css/pc_student.css">
	<link href="css/style.css" rel="stylesheet">
	<script src="js/iconfont.js"></script>
	<!--******************外部引用包************-->
    <link href="lib/uploader/zui.uploader.min.css" rel="stylesheet">
    <script src="lib/uploader/zui.uploader.min.js"></script>
    <!-- ******************照片上传**************************** -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    
	<style type="text/css">
		#box-1{	
	      width: 80%;
	      height: 200px;
	      border: 1px solid gray;	
	      border-radius: 10px;	
	      align-content: center;
	      margin: 0 auto;
	      position: relative;
	      top: 20px;
	    }	
	    img{	
	      width: 100%;	
	      height: 100%;	
	      border-radius: 10px;		      	
	    }	
	    #box-2{
	    	margin: 0 auto;
	    	text-align:center;
	    	position: relative;
	    	top: 40px;
	    }
	    .sub{
	    	width: 70%;
	    	height: 40px;
	    	margin: 0 auto;
	    	align-content: center;
	    	border-style:none;
	    	border-radius: 10px;
	    	background-color:  #3181fc;
	    	color: white;
	    	font-weight: 600;
	    	font-size: 1.2em;
	    }	 	
	</style>
    
    
    
    
</head>
<body>
<input type="file" name="userFile" id="userFile" style="display: none;" onchange="filechange(event)">
	<div class="banner">
		<a href="showMassages"><img src="images/personalCenter/backblack.png" class="back"></a>
		学生实人认证
	</div>
	<div class="card">
		<span class="card01">我的学生证</span>
		<img src="images/personalCenter/safe.png" class="safe">
		<span class="card02">学生实人认证是保证的个人快递安全的第一道凭证</span>
		<div class="card03">未认证</div>
	</div>
	
	<div class="massages">
		<div class="massages01">
			<span>上传学生证正高清照片以认证</span>
		</div>
		
		
		<div id="box-1" class="idImg">	
			<img id="show-img" src="images/addUserImg.png" alt=""/>	
		</div>	
		
		<div id="box-2">	
			
				<input type="submit" value="提  交" class="sub" id="uploadIdCard"/>	
		
		</div>
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
	        $("#show-img").attr("src",imgURL);
	    }
	};
	$('.idImg').on('click',function(){
		$('#userFile').click();
	})
	$('#uploadIdCard').on('click',function(){
		$.ajaxFileUpload({
            url: 'upload/studentID',
            fileElementId:'userFile',
            dataType:'txt',
            secureuri : false,
            type:'post',
            success: function (data){
               alert('上传学生证成功');
            }
        });
	})
	</script>
	</div>



</body>

</html>