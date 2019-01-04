<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>消息</title>
    <link href="css/navigation.css" rel="stylesheet">
    <link href="css/msg.css" rel="stylesheet">
    <!-- zui -->
    <link href="css/zui.css" rel="stylesheet">
    <!-- ZUI 标准版压缩后的 CSS 文件 -->
	
    <!-- ZUI Javascript 依赖 jQuery -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI 标准版压缩后的 JavaScript 文件 -->
    <script src="js/zui.js"></script>
    <script src="js/iconfont.js"></script>
    <script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script>
    <style>
    #box{
    	width:100%;
    	height:400px;
    	overflow-y:scroll;
    }
		::-webkit-scrollbar{
	  display:none;
	}
	.container-fluid img{
		border-radius: 50%;
	}
	</style>
  </head>
  <body class="body">
  <input style="display:none;" value="${user.id}" id="channel">
  <script type="text/javascript">
  	var goEasy=new GoEasy({
  		appkey:"BC-0d6ab878a0a24864a0c5c0e5251e50df"
  	});
  	goEasy.subscribe({
  		channel:$('#channel').val(),
  		onMessage:function(message){
  			var re=eval("("+message.content+")");
  			console.log(re.times);
  			$(".cards-condensed").append('<div class="card container-fluid">'
	                +'<a href="ready?sender='+$('#channel').val()+'&reciever='+re.talkerId.id+'">'
	                +'<img src="'+re.talkerId.headPortrait+'" height="20%" width="20%">'
	                +'<span class="time">'+re.times.hours+":"+re.times.minutes+'</span>'
	                +'<div>'
	                +'<span class="talker"  style="font-size:20px;font-family: "黑体";">'+re.talkerId.nickname+'</span><span style="font-size:20px;font-family: "黑体";">给你消息啦!</span>'
	                +'</div>'
	                +'</a>'
	                +'</div>');
  		}
  	})
  </script>
      <!-- title -->
      <h2 class="title container-fluid">
        <span class="top-title"><a href="sysMsg">通知</a></span>
        <span class="top-title this"><a href="#">消息</a></span>
      </h2>
      <!-- 主要内容 -->
    
      <div class="container-fluid" id="box">
        <div class="cards cards-condensed ">
        		<c:forEach items="${chatList}" var="chat">
			      <div class="card container-fluid">
	             	<a href="ready?sender=${user.id}&reciever=${chat.user.id}">
		            	<img src="${chat.user.headPortrait}" height="20%" width="20%">
		               	<span class="time">${chat.timestamp}</span>
		          		<div>	
		             	 	<span class="talker"  style="font-size:20px;font-family: '黑体';">${chat.user.nickname}</span><span style="font-size:18px;font-family: '黑体';"></span>
	          			</div>
	               </a>
	         	 </div>
				</c:forEach>
        </div>
      </div>
      <!-- 下方导航 -->
      <div class="menu ">
        <ul class="nav nav-primary">
          <li class="">
            <a href="index">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-shouye-xianxing"></use> 
              </svg> 
              <div class="menu-text">
              首页
              </div>
            </a>
          </li>
          <li class="">
            <a href="oc_orderCenter.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-baoguofahuo-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                代取
              </div>
            </a>
          </li>
          <li class="">
            <a href="issuanceOrders.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-jijianfasong-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                发单
              </div>
            </a>
          </li>
          <li class="active">
            <a href="message.jsp">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-liaotianduihua-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                消息
              </div>
            </a>
          </li>
          <li class="">
            <a href="showMassages">
              <svg class="iconb" aria-hidden="true"><use xlink:href="#icon-yonghu-xianxing"></use> 
              </svg> 
              <div class="menu-text">
                我
              </div>
            </a>
          </li>
        </ul>
      </div>
  </body>
</html>