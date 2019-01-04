window.init = function(){
	var position = new AMap.LngLat(114.520803,37.997898);
	var map = new AMap.Map('container', {
        resizeEnable: true,
        center: position,
        zoom: 15
    });

    //添加移除图层
    var chlayer =document.getElementById('ch-layer-btn');
    var ch1=0;
    var satellite = new AMap.TileLayer.Satellite();
    chlayer.onclick=function(){
    	if(ch1==0)
    	{
            satellite.setMap(map);
            ch1=1;
            chlayer.innerHTML="标准地图";
    	}
    	else{
    		satellite.setMap(null);
            ch1=0;
            chlayer.innerHTML="卫星地图";
    	}
    }
}
