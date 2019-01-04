$(function(){ 
	$(".btn-block").on('click',function(e){
		window.location.href="order/detail?id="+e.target.value;
	});
})