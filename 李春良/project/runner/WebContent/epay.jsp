<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<title>钱包支付页面效果</title>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1.0, width=device-width, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/lanren.css">
 <script src="js/pay.js"></script>

<script type="text/javascript">
var ps="";

$(function(){
	//出现浮动层
	$(".ljzf_but").click(function(){
		$(".ftc_wzsf").show();
		});
	//关闭浮动
	$(".close").click(function(){
		$(".ftc_wzsf").hide();
		});
		//数字显示隐藏
		$(".xiaq_tb").click(function(){
		$(".numb_box").slideUp(500);
		});
		$(".mm_box").click(function(){
		$(".numb_box").slideDown(500);
		});
		//----
		var i = 0;
		$(".nub_ggg li a").click(function(){
			i++
			//alert($(this).text());
			ps+=$(this).text();
			if(i<6){
				$(".mm_box li").eq(i-1).addClass("mmdd");
				//ps+=$(this).text();
				}else{
					$(".mm_box li").eq(i-1).addClass("mmdd");
					
					setTimeout(function(){
					ps=ps.substring(0,6);
					
					//request.setAttribute("ps",ps.substring(0,6));
					$("#ps").val(ps);
					$("form").submit();
					},500); 
					//window.document.location="cg.html"
			 }
		});
		
		$(".nub_ggg li .del").click(function(){
			
			if(i>0){
				i--
				$(".mm_box li").eq(i).removeClass("mmdd");
				i==0;
				ps=ps.substring(0,ps.length-1);
				}
			
			
			 
		});
		
 
		
	 
});
</script>
</head>
<body>
<div class="header">
  <div class="all_w ">
    <div class="gofh"> <a href="#"><i class="icon icon-chevron-left"></i></a> </div>
    <div class="ttwenz">
      <h4>确认交易</h4>
      <h5>钱包支付</h5>
    </div>
  </div>
</div>
<div class="wenx_xx">
  <div class="mz">代跑侠</div>
  <div class="wxzf_price" name="price">${unPayOrder.money }元</div>
</div>
<div class="skf_xinf">
  <div class="all_w"> <span class="bt">收款方</span> <span class="fr">代跑侠</span> </div>
</div>
<a href="javascript:void(0);" class="ljzf_but all_w">立即支付</a> 

<form action="pay" method="post" id="submits">
<input id="ps" type="hidden" name="ps">
</form>
<!--浮动层-->

<div class="ftc_wzsf">
  <div class="srzfmm_box">
    <div class="qsrzfmm_bt clear_wl"> <img src="images/pay/xx_03.jpg" class="tx close fl" > <img src="images/pay/jftc_03.jpg" class="tx fl" ><span class="fl">请输入支付密码</span> </div>
    <div class="zfmmxx_shop">
      <div class="mz">代跑侠</div>
      <div class="wxzf_price">${unPayOrder.money }元</div>
    </div>
    <ul class="mm_box" name="mm">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
  <div class="numb_box">
    <div class="xiaq_tb"> <img src="images/pay/jftc_14.jpg" height="10"> </div>
    <ul class="nub_ggg">
      <li><a href="javascript:void(0);">1</a></li>
      <li><a href="javascript:void(0);" class="zj_x">2</a></li>
      <li><a href="javascript:void(0);">3</a></li>
      <li><a href="javascript:void(0);">4</a></li>
      <li><a href="javascript:void(0);" class="zj_x">5</a></li>
      <li><a href="javascript:void(0);">6</a></li>
      <li><a href="javascript:void(0);">7</a></li>
      <li><a href="javascript:void(0);" class="zj_x">8</a></li>
      <li><a href="javascript:void(0);">9</a></li>
      <li><span></span></li>
      <li><a href="javascript:void(0);" class="zj_x">0</a></li>
      <li><span  class="del" > <img src="images/pay/jftc_18.jpg"   ></span></li>
    </ul>
  </div>
  <div class="hbbj"></div>
  <input id="pmps" type="hidden" value="${info.paymentPassword}">
</div>
        <script type="text/javascript">
        function myfun(){
        	if($("#pmps").val()=="000000")
        		{
        			window.location.href="paymentPassword.jsp";
        		}
        };
        window.onload = myfun;
        </script>
<script type="text/javascript">
	$(function () {
		if("${err}"!=null&&"${err}"!=""){
			if(${err}==1){
				alert("密码错误");
			}else if (" ${err }"==2) {
				alert("余额不足，请充值！稍后自动跳转到充值界面");
				setTimeout(function(){
					window.location.href="pc_wallet.jsp";//充值界面
					},1000); 
			}
			
		}
		
	})
</script>
</body>
</html>