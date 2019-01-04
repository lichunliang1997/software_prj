window.init = function(){
	var position = new AMap.LngLat(114.520803,37.997898);
	var map = new AMap.Map('container', {
        resizeEnable: true,
        center: position,
        zoom: 15
    });
}
