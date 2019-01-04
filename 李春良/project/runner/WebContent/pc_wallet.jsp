<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>我的钱包</title>
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
	<script src="js/toastr.min.js"></script>
	<script src="https://cdn.goeasy.io/goeasy.js"></script>
	<!--****************自定义CSS**************-->
	<link rel="stylesheet" href="css/pc_wallet.css">
	<!--******************外部引用包************-->
</head>
<link href="css/toastr.min.css" rel="stylesheet"/>
<body>
<input style="display:none;" value="${user.id}" id="channel">
  <script type="text/javascript">
  	var goEasy=new GoEasy({
  		appkey:"BC-0d6ab878a0a24864a0c5c0e5251e50df"
  	});
  	goEasy.subscribe({
  		channel:$('#channel').val(),
  		onMessage:function(message){
  			var re=eval("("+message.content+")");
  			toastr.info(re.talkerId.nickname+"给你发消息啦!");
  		}
  	})
  </script>
	<div class="banner">
		<a  class="backa" href="showMassages" style="color:grey;position: absolute;left:15px;">
				<i class="icon icon-chevron-left ">  	</i>
		</a>	
		我的钱包
	</div>
	<div class="balance">
		<span class="money">${user.information.aBalance}元</span>
	</div>
	<div class="space1"><span>充值(人民币)</span></div>
	<div class="recharge">
		<div style="margin:0px auto;width:261px;">
			<div class="charge">
				<button class="pay" value="5">5</button>
			</div>
			<div class="charge">
				<button class="pay" value="10">10</button>
			</div>
			<div class="charge">
				<button class="pay" value="30">30</button>
			</div>
			<div class="charge">
				<button class="pay" value="50">50</button>
			</div>
			<div class="charge">
				<button class="pay" value="100">100</button>
			</div>
			<div class="charge">
				<input type="text" name="rechage" value="自定义" id="inputMoney">
			</div>
		</div>
		<div class="space2">支付金额:<span class="payMoney"></span></div>
		<script type="text/javascript">
			$(".charge").on('click',function(){
				console.log($(this).text());
				$(".payMoney").html($(this).text());
			})
			$("#inputMoney").on('focus',function(){
				$("#inputMoney").val("");
				$(".payMoney").html("");
			})
			$("#inputMoney").on('keyup',function(){
				console.log($(this).text());
				$(".payMoney").html($(this).val());
			})
		</script>
		<div class="space2"><button id="okay">确认支付</button></div>
		<script type="text/javascript">
			$("#okay").on('click',function(){
				if($(".payMoney").text()!=null){
					$.post("add/money",{money:$(".payMoney").text().replace(/\s+/g,"")},function(result){
						re=eval("("+result+")");
						$(".money").html(re.money+"元");
						$("#inputMoney").val("自定义");
						$(".payMoney").html("");
					})
				}else{
					alert("请输入金额");
				}
			})
		</script>
	</div>




</body>



</html>