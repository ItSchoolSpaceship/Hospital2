<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> 마커에 인포윈도우 표시하기  </title>
    <style>
    .title {
    margin-bottom: 20px;
    }
    body {
    margin: 0px;
   
    }
    
    .title {
    background-color: #203e8c;
    letter-spacing: -0.08em;
    padding: 55px 0 100px;
    display: block;
    opacity: 0.9;
    vertical-align:middle;
    
	}
	
	.title strong {
    display: block;
    margin-bottom: -55px;
    margin-left: 20px;
    font-weight: 800;
    font-size: 40px;
    color: #fff;
    letter-spacing: -0.14em;
    vertical-align:middle;
}
	
	.traffic-box dd .tlt {
    font-size: 30px;
    font-weight: 800;
    color: #203e8c;
    margin-top: 0;
    margin-bottom: 10px;
    margin-left: 25px;
	}
	
	.traffic-box dd {
    font-size: 20px;
    color: #333333;
	}
	
	.traffic-box > * {
    display: table-cell;
    vertical-align: middle;
   
	}
	
	.fix-layout{
	padding: 20px;
	margin: 20px;
	margin-left: 150px;
	}
	
	.traffic-box span {
	margin-left: 25px;
	}
	
	.traffic-box p {
	margin-left: 25px;
	}
	
	
    </style>
    
</head>
<body>
<div class ="way">
			<div class = "title">
				<strong> 유나이티드 치과  오시는 길 </strong>
			</div>
			
<div id="map" style="width:100%;height:500px;"></div>

 	<div class = "fix-layout pb50">
			<div class = "traffic-box"> 
				<dt>
				<img src = "${contextPath}/resources/images/traffic_01.png" alt = "지하철 이용시" >
<!-- 				<img src = "http://gseyecenter.com/assets/img/web/sub/contents/img_67_traffic_01.png" alt = "지하철 이용시" > -->
				</dt>
				<dd>
				<p class = "tlt"> SUBWAY </p>
				<span> 용문역 5번 출구 정일빌딩 7층 </span>
				</div>
			</div>
			
		<div class = "fix-layout pb50">
			<div class = "traffic-box"> 
				<dt>
				<img src = "${contextPath}/resources/images/traffic_02.png" alt = "버스 이용시" >
				</dt>
				<dd>
				<p class = "tlt"> BUS </p>
				<span> 정류장명 : 용문역 사거리 하차 후 정일빌딩 7층 </span>
				<p>
					<strong> 버스 노선 : </strong>
					211, 316, 318, 604, 703
					</p>
				</div>
			</div>
			
		<div class = "fix-layout pb50">
			<div class = "traffic-box"> 
				<dt>
				<img src = "${contextPath}/resources/images/traffic_03.png" alt = "자가용 이용시">
				</dt>
				<dd>
				<p class = "tlt"> CAR </p>
				<span> 정일빌딩 지하주차장 Parking 가능  </span>
				<p>
					<strong> 네비게이션 검색 : </strong>
					유나이티드 치과, (대전시 서구 계룡로 637, 정일빌딩)
					</p>
				</div>
			</div>	

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb3bcbfcf22d03021f764ba1767b17e9"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.338943, 127.393059), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(36.338943, 127.393059); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">유나이티드 치과 <br><a href="https://map.kakao.com/link/map/유나이티드 치과,36.338943, 127.393059" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/유나이티드 치과,36.338943, 127.393059" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</body>
</html>