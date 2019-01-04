<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>抢单成功</title>
    <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/orderSuccess.css">
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<!-- 在此处编码你的创意 -->
<div class="orderSuccess">
    <!--顶端提示和返回-->
    <div class="orderTop">
        <div>
            <i class="icon icon-chevron-left"><!-- <h2>抢单成功</h2> --></i>
        </div>
    </div>
    <div class="orderCenter">
        <!--抢单成功提示-->
        <div class="success">
            <i class="icon icon-check" icon-4x style="color: #09bb07"><h1>抢单成功</h1></i>
        </div>
        <!--提示按钮-->
        <div class="button">
            <div class="keep" style="float:left;">
                <a href="oc_orderCenter.jsp" class="button"><button class="btn" type="button">继续抢单</button></a>
            </div>
            <div class="view" style="float:left;">
                <a href="orderIndex"><button class="btn btn-primary" type="button">查看订单</button></a>
            </div>
        </div>
        
        <div class="orderBottom" style="margin-top:10%;">
	        <div class="adImage">
	            <a href="#"><img src="images/banner/daiqu.jpg"></a>
	        </div>
    	</div>
        
    </div>
</div>
<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
<!--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
<!-- ZUI Javascript组件 -->
<script src="js/zui.min.js"></script>

</body>
</html>