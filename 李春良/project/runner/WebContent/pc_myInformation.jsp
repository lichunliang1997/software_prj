<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人主页</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
    <link href="css/zui.min.css" rel="stylesheet">
	<!-- ZUI Javascript 依赖 jQuery -->
	<script src="js/jquery-1.7.min.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="js/zui.min.js"></script>
	<!--****************自定义CSS**************-->
	<link rel="stylesheet" href="css/pc_homepage.css">
</head>
<body>
	<div class="Wall">
		<!--wall为用户自定义的背景墙-->
		<img src="images/personalCenter/wenli2.png" class="wall">
		<a href="/runner/showMassages"><img src="images/personalCenter/backblack.png" class="back" ></a>
		<!--头像-->
		<c:if test="${headportrait == null}">
			<img src="images/personalCenter/defaultPhoto.jpg" class="photo">
		</c:if>
		<c:if test="${headportrait != null}">
			<img src="${headportrait}" class="photo">
		</c:if>
	</div>
	<!--资料展示部分-->
	<div class="content">
		<!-- .................................................................................. -->
		<c:if test="${nickname == null}">
			<span class="name">未登录用户</span>
		</c:if>
		<c:if test="${nickname != null}">
			<span class="name">${nickname}</span>
		</c:if>
		<!-- .................................................................................. -->
		<span class="intro">简介：</span><span class="intro_text">我是刘金辀，不服来找我</span>
		<img src="images/personalCenter/location.png" class="location">
		<span class="address">河北-石家庄</span>
		<!-- .................................................................................. -->
		<c:if test="${sex eq 'man'}">
			<img src="images/personalCenter/man.png" class="sex">
		</c:if>
		<c:if test="${sex != 'man'}">
			<img src="images/personalCenter/woman.png" class="sex">
		</c:if>
		<!-- .................................................................................. -->
		<c:if test="${sex == null}">
			<span class="age">0岁</span>
		</c:if>
		<c:if test="${sex != null}">
			<span class="age">${age}岁</span>
		</c:if>
		<!-- .................................................................................. -->
		<div class="context_">
			<div class="context_text">
				<h5>邮箱：</h5>
				
				<c:if test="${email == null}">
					<span>未登录</span>
				</c:if>
				<c:if test="${email != null}">
					<span>${email}</span>
				</c:if>	
				
			</div>
			<div class="context_text">
				<h5>学校：</h5>
				
				<c:if test="${school == null}">
					<span>未登录</span>
				</c:if>
				<c:if test="${school != null}">
					<span>${school}</span>
				</c:if>
			</div>
		</div>
		<div class="order_top">订单信息</div>
		<div class="order_content">
			<div class="order_contents">
				
				<c:if test="${total == null}">
					<h5>0</h5>
				</c:if>
				<c:if test="${total != null}">
					<h5>${total}</h5>
				</c:if>
				<span>总订单</span>
			</div>
			<div class="order_contents">
				
				<c:if test="${finished == null}">
					<h5>${finished}</h5>
				</c:if>
				<c:if test="${finished != null}">
					<h5>${finished}</h5>
				</c:if>
				<span>已完成</span>
			</div>
			<div class="order_contents">
				
				<c:if test="${unfinished == null}">
					<h5>${unfinished}</h5>
				</c:if>
				<c:if test="${unfinished != null}">
					<h5>${unfinished}</h5>
				</c:if>
				<span>进行中</span>
			</div>
		</div>
		<div class="line"></div>
		<a href="pc_editInformation.jsp"><img src="images/personalCenter/edit.png" class="edit"></a>
		<!--**************图表**************-->
		<div class="chart">
			<div id="container" style="height: 100%"></div>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
	       <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
	       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
	       <script type="text/javascript">
	          var dom = document.getElementById("container");
	          var myChart = echarts.init(dom);
	          var app = {};
	          option = null;
	          app.title = '环形图';

	          option = {
	              tooltip: {
	                  trigger: 'item',
	                  formatter: "{a} <br/>{b}: {c} ({d}%)"
	              },
	             
	              series: [
	                  {
	                      name:'好评情况',
	                      type:'pie',
	                      radius: ['50%', '70%'],
	                      avoidLabelOverlap: false,
	                      label: {
	                          normal: {
	                              show: false,
	                              position: 'center'
	                          },
	                          emphasis: {
	                              show: true,
	                              textStyle: {
	                                  fontSize: '30',
	                                  fontWeight: 'bold'
	                              }
	                          }
	                      },
	                      labelLine: {
	                          normal: {
	                              show: false
	                          }
	                      },
	                      data:[ 
	                          {value:${ten}, name:'10星好评'},
	                          {value:${eight}, name:'8星好评'},
	                          {value:${six}, name:'6星中评'},
	                          {value:${four}, name:'4星中评'},
	                          {value:${two}, name:'2星差评'}
	                      ]
	                  }
	              ]
	          };
	          ;
	          if (option && typeof option === "object") {
	              myChart.setOption(option, true);
	          }
	       </script>
		</div>


	</div>
	

</body>
</html>