
var map = new AMap.Map('container', {
	         layers: [//只显示默认图层的时候，layers可以缺省
	             new AMap.TileLayer()//高德默认标准图层
	         ],
	         zoom: 13
});	 

 map.on('complete', function() {	 
	 var marker1 = new AMap.Marker({ 
		 icon: 'https://webapi.amap.com/theme/v1.3/markers/n/start.png'
	 });
	 var position1 = new AMap.LngLat($("#deliveryLnglat").val().split(',')[0],$("#deliveryLnglat").val().split(',')[1]);
	 marker1.setPosition(position1);
     map.add(marker1);       		 
     var marker2 = new AMap.Marker({ 
    	 icon: 'https://webapi.amap.com/theme/v1.3/markers/n/end.png'
     });
	 var position2 = new AMap.LngLat($("#destLnglat").val().split(',')[0],$("#destLnglat").val().split(',')[1]);
	 marker2.setPosition(position2);
     map.add(marker2);   
     map.setFitView();
     
 });
 
 