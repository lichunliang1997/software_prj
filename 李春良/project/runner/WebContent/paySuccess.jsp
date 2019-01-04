<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<title>钱包支付成功</title>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1.0, width=device-width, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/lanren.css">
 <script src="js/pay.js"></script>
<script src="js/zui.js"></script>
</head>
<body >
<div class="header">
  <div class="all_w" style="position:relative; z-index:1;">
    <div class="ttwenz" style=" text-align:center; width:100%;">
      <h4>交易详情</h4>
      <h5>钱包支付</h5>
    </div>
    <a href="orderIndex" class="fh_but">返回</a> </div>
</div>

<div class="zfcg_box ">
<div class="all_w">
<img src="images/pay/cg_03.jpg" > 支付成功 </div>

</div>
<div class="cgzf_info">
<div class="wenx_xx">
  <div class="mz">代跑侠</div>
  <div class="wxzf_price">${order.money }元</div>
</div>

<div class="spxx_shop">
 <div class=" mlr_pm">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>商   品</td>
    <td align="right">代跑侠订单</td>
  </tr>
   <tr>
    <td>交易时间</td>
    <td align="right"><% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())); %></td>
  </tr>
   <tr>
    <td>支付方式</td>
    <td align="right">钱包支付</td>
  </tr>
   <tr>
    <td>交易单号</td>
    <td align="right"><%-- <%=System.currentTimeMillis() %>12 --%>${order.orderNumber}</td>
  </tr>
</table>

 </div>

</div>
</div>


<div class="wzxfcgde_tb"><i class="icon icon-yen">钱包支付</i></div>
</body>
</html>