		function getDistance(lnglat1,lnglat2){
			return Math.round(lnglat1.distance(lnglat2));
		}
		 
		function getCurrentSchool(jsonStr){
			var strJson=JSON.parse(jsonStr);
			AMap.service('AMap.PlaceSearch',function(){
	            placeSearch= new AMap.PlaceSearch({
	            pageSize: 100,
	            pageIndex: 1,
	            city: strJson.citycode, 
	            map: map,
	            panel: "result"
	         	});
	            placeSearch.searchNearBy('大学',[strJson.lng,strJson.lat],1000,function(status, result) {
		            if(status=='complete'&&result.info=='OK'){
			            var arr=result.poiList.pois;
			            var temp=arr[0];
		                for(var index in arr){
		                	if(getDistance(arr[index].location,[strJson.lng,strJson.lat])<getDistance(temp.location,[strJson.lng,strJson.lat])){
		                		temp=arr[index];
		                	}
		                }
		                document.getElementsByClassName('schoolName')[0].innerHTML=temp.name;
		                $.post("center/station",{name:temp.name},function(result){
		                	var re=eval("("+result+")");
		                	for(var i=0;i<re.length;++i){
		                		var station=re[i].station;
		                		var orderArray=re[i].orderlist;
		                		 var marker = new AMap.Marker({ });
		                		 marker.setLabel({
		                		        offset: new AMap.Pixel(20, 0),
		                		        content: "<div class='info'>"+station.name+"(快递数:"+orderArray.length+")</div>"
		                		   });
		                		 var tposition = new AMap.LngLat(station.lnglat.split(',')[0],station.lnglat.split(',')[1]);
		                		 marker.setPosition(tposition);
		            	         map.add(marker);       		 
		            	         marker.on('click', showInfoM);
		            	         map.setFitView();
		                	}
		                });
		            }    
	        	});
      		});
		}
		
		  function showInfoM(e){
		        var object=e.target;
		        var lng=object.Mg.position.lng,lat=object.Mg.position.lat;
		        window.location.href="orderlist?lnglat="+lng+","+lat;
		    }
		
		function getCurrentPosition(map){
			
			AMap.plugin('AMap.Geolocation',function(){
				var geolocation=new AMap.Geolocation({
					//是否使用高精度定位,默认true
					enableHighAccuracy:true,
					//超过10秒后停止定位，默认5s
					timeout:10000,
					//定位按钮的停靠位置
					buttonPosition:'RB',
					//定位按钮与设置的停靠位置的偏移量
					buttonOffset:new AMap.Pixel(10,20),
					//定位成功后是否自动调整地图视野到定位点
					//zoomToAccuracy:true
				});
				map.addControl(geolocation);
				geolocation.getCurrentPosition(function(status,result){
					if(status=='complete'){
						map.setCenter(result.position);
						map.setZoom(17);
						var str=""+result.position;
						map.getCity(function(info){
							var strJson={
								citycode: info.citycode,
								lng: str.split(',')[0],
								lat: str.split(',')[1]
							};
							var jsonStr=JSON.stringify(strJson);
							getCurrentSchool(jsonStr);
						});
					}else{
						alert('高度精确定位失败');
					}
				});
			});
		}

	    var map = new AMap.Map('container', {
	         layers: [//只显示默认图层的时候，layers可以缺省
	             new AMap.TileLayer()//高德默认标准图层
	         ],
	         zoom: 13
	    });	    
		getCurrentPosition(map); 
