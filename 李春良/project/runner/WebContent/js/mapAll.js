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
		                document.getElementsByClassName('schoolName')[0].innerHTML="当前定位:"+temp.name;
		                document.getElementsByClassName('schoolName')[0].value=temp.name;
		                $.post("display/station",{schooName:temp.name},function(result){
		                	var re=eval("("+result+")");
		                	for(var i=0;i<re.length;++i){
		                		$('#site').append('<option value="'+re[i].name+'" name="site">'+re[i].name+'</option>');
		                		
		                	}
		                });
		                /*
		                document.getElementsByClassName('address')[0].innerHTML=temp.address;
		                document.getElementsByClassName('tel')[0].innerHTML=temp.tel;
		                document.getElementsByClassName('position')[0].innerHTML=temp.location;
		                */
		            }    
	        	});
      		});
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

		var buildings = new AMap.Buildings({
	        'zooms':[16,18],
	        'zIndex':10,
	        'opacity':2,
	        'heightFactor':2//2倍于默认高度，3D下有效
	    });

	    var map = new AMap.Map('container', {
	        viewMode:'3D',
	        pitch:60,
	        rotation:-35,
	        features:['bg','road','point'],//隐藏默认楼块
	        layers: [
	        		new AMap.TileLayer({
	        			visible:true
	       			}),
	        		buildings],
	        zoom: 16
	    });

	      var marker = new AMap.Marker(
	      {
	        
	      })
	    
		getCurrentPosition(map);
		var position=null;
		 map.on('click',function(obj){
			 position=obj.lnglat.getLng()+","+obj.lnglat.getLat();
		     var tposition = new AMap.LngLat(obj.lnglat.getLng(),obj.lnglat.getLat());
		     $('#position').val(tposition);
	         marker.setPosition(tposition);
	         map.add(marker);
	         
     	 });

			$('#pay').live('click',function(){
				var time= $("#time").val();
	          	var dest= $("#dest").val();     	
	          	var fee= $("#fee").val();
	          	var itemNumber=$("#itemNumber").val();
				if(position==null){
					alert('未在地图上标记');
					return false;
				}
				//表单验证
				if(dest.replace(/^ +| +$/g,' ')==''){
	        		$("#dest").css("border-color","red");
	        		$("#dest").focus();
	        		
	        		return false;
	        	}
	        	else {
	        		$("#dest").css("border-color","");
	        	}
	        	if(time.replace(/^ +| +$/g,' ')==''){
	        		$("#time").css("border-color","red");
	        		$("#time").focus();
	        		return false;
	        	}
	        	else {
	        		$("#time").css("border-color","");
	        	}
	        	if (/^\d+$/.test(fee)==false) {
	        		$("#fee").css("border-color","red");
	        		$("#fee").val("");
	        		$("#fee").focus();
	        		return false;
				}
	        	else {
	        		$("#fee").css("border-color","");
				}
	        	if(/^\d+$/.test(itemNumber)==false){
	        		$("#itemNumber").css("border-color","red");
	        		$("#itemNumber").val("");
	        		$("#itemNumber").focus();
	        		return false;
	        	}
	        	else {
	        		$("#itemNumber").css("border-color","");
				}
			})