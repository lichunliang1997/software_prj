<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="zh">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
        <title>聊天</title>

        
        <link rel="stylesheet" type="text/css" href="css/chat.css" />
        <script src="js/jquery.min.js"></script>
        <script src="js/flexible.js"></script>
        <script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script>
        <style type="text/css">
        	.msg img{
        		border-radius: 50%;
        	}
        </style>
    </head>

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
  			$('.message').append('<div class="send">'
  	               +' <div class="time">'+re.times.hours+":"+re.times.minutes+'</div>'
  	             +' <div class="msg">'
  	           +'  <img src="${otherUser.headPortrait}" />'
  	         +' <p><i class="msg_input"></i>'+re.content+'</p>'
  	       +' </div>'
  	     +' </div>');
  		var h = $(document).height()-$(window).height();
  	    $(document).scrollTop(h);
  		}
  	})
  </script>
    <input style="display:none;" value="${otherUser.id}" id="otherUser">
        <header class="header">
            <a class="back" href="javascript:history.back()"></a>
            <h5 class="tit" align="center" style="width:150px;float:left;margin-left:25%">${otherUser.nickname}</h5>
            <a href="wtai://wp/mc;${otherUser.information.phone}"><img src="images/tell.png" width="30px" height="30px" style="float:right;margin:10px;"></a>
        </header>
        <div class="message">
          
          <c:forEach items="${crList}" var="record">
          	<c:set var="talker" value="${record.talkerId.id}"/>
          	<c:if test="${talker==otherUser.id}">
          	<div class="send">
                <div class="time">${fn:substring(record.times,0, 16)}</div>
                <div class="msg">
                    <img src="${otherUser.headPortrait}" />
                    <p><i class="msg_input"></i>${record.content}</p>
                </div>
            </div>
          	</c:if>
          	<c:if test="${talker!=otherUser.id}">
          	<div  id="words" class="show">
                <div class="msg">
                    <img src="${user.headPortrait}" />
                    <p><i clas="msg_input"></i>${record.content}</p>
                </div>
            </div>
          	</c:if>
          </c:forEach>  
            
        </div>
        <div class="footer">
            <img src="images/hua.png" alt="" />
            <img src="images/xiaolian.png" alt="" />
            <input id="talkwords" type="text"/>
            <p id="talksub">发送</p>
        </div>
        <script type="text/javascript">
        function myfun(){
        	var h = $(document).height()-$(window).height();
        	$(document).scrollTop(h);
        };
        window.onload = myfun;
        </script>
    	<script type="text/javascript">
    		$("#talksub").on('click',function(){
    			var content=$("#talkwords").val();
    			$("#talkwords").val("");
    			$(".message").append('<div  id="words" class="show">'
    	                +'<div class="msg">'
    	                +'<img src="${user.headPortrait}" />'
    	                +'<p><i clas="msg_input"></i>'+content+'</p>'
    	                +'</div>'
    	                +'</div>');
    			 $.post("chat",{channel:$('#otherUser').val(),content:content},function(result){
    			
    			 });
    			 var h = $(document).height()-$(window).height();
    	            $(document).scrollTop(h);
    		})
    	</script>
    </body>
</html>