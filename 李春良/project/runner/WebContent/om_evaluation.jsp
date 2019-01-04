<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
      String oid = request.getParameter("oid");   //获取url中的参数值
      String status = request.getParameter("status");
      String uId = request.getParameter("uId");
      String commentatorId = request.getParameter("commentatorId");
  %>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单评价</title>
    <!-- zui -->
    <link href="css/zui.min.css" rel="stylesheet">
       <!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
    <script src="js/jquery-1.7.min.js"></script>
    <!-- ZUI Javascript组件 -->
    <script src="js/zui.min.js"></script>
    <script src="js/jquery.js"></script>
    <link href="css/om_evaluation.css" rel="stylesheet">
	</head>
	<body>
		<div class="backIcon">
                    <a href="orderIndex">
                    <i class="icon icon-chevron-left icon-2x"></i></a>
                </div>
			
			 <div class="orderHeader">
                <div class="name"><font size="3">评价此单</font></div>
            </div>
           

         <div class="headImg">
         	<img src="images/timg.jpg" width="70px" height="70px" class="img-circle" alt="圆形图片">
         </div>
          <div class="text1">
            	___________&nbsp;&nbsp;&nbsp;您对此单配送满意吗？&nbsp;&nbsp;&nbsp;___________
            </div>

            <div class="judgeBox">
			<div class="labels">
				<div class = "lb1">#准时#</div>
				<div class = "lb2">#服务周到#</div>
				<div class = "lb3">#态度友好#</div>
				<div class = "lb4">#飞毛腿#</div>
				<div class = "lb5">#热心肠#</div>
			</div>
			<form action="orderChange">
			<div class="judgeText has-success">
			<textarea  class="form-control" name="content" rows="3" placeholder="留下你的评价"></textarea>
			</div>

			<div id="starRating">
		
			     <div id="starttwo" class="block clearfix">
        			<div  class="star_score"></div>
        			<p style="float:left;">您的评分：<span class="fenshu"></span> 分</p>
   					 </div>
				    <input class="allMark" type="hidden" name="mark" value="0"/>
					<input type="hidden" name="oid" value=<%=oid %>>
					<input type="hidden" name="status" value=<%=status %>>
					<input type="hidden" name="uId" value=<%=uId %>>
					<input type="hidden" name="commentatorId" value=<%=commentatorId %>>
				    <div class="bottoms">
				        <input class="evaSubmit" type="submit" value="确认" >
					</div>
					</div>
					</form>
			<div class="cancelbtn">
			<button class="btncl" onClick="window.location.href='orderIndex'">取消评分</button>
         		</div>
            </div>
    <script type="text/javascript" src="js/startScore.js"></script>
	<script>
    	scoreFun($("#startone"))
    	scoreFun($("#starttwo"),{
          fen_d:22,//每一个a的宽度
          ScoreGrade:5//a的个数 10或者
        })
        
        $(".show_number li p").each(function(index, element) {
        var num=$(this).attr("tip");
        var www=num*2*16;//
        $(this).css("width",www);
        $(this).parent(".atar_Show").siblings("span").text(num+"分");
        
    });
	    $(function () {
	        //评分
	        var starRating = 0;
	         $('.evaSubmit').live('click',function(){
	        	var content= $(".form-control").val();
	        	var mark = $(".allMark").val();
	        	if(content.replace(/^ +| +$/g,' ')==''){
	        		alert("评价为空");
	        		return false;
	        	}else if(mark==0){
	        		alert("请评分");
	        		return false;
	        	}
	        });
	        $('.lb1').on('click',function(){
	        	$("textarea[name='content']").val($("textarea[name='content']").val()+$(this).html())
	        })
	        $('.lb2').on('click',function(){
	        	$("textarea[name='content']").val($("textarea[name='content']").val()+$(this).html())
	        })
	        $('.lb3').on('click',function(){
	        	$("textarea[name='content']").val($("textarea[name='content']").val()+$(this).html())
	        })
	        $('.lb4').on('click',function(){
	        	$("textarea[name='content']").val($("textarea[name='content']").val()+$(this).html())
	        })
	        $('.lb5').on('click',function(){
	        	$("textarea[name='content']").val($("textarea[name='content']").val()+$(this).html())
	        })
	    })
	</script>					
	</body>	

	</html>