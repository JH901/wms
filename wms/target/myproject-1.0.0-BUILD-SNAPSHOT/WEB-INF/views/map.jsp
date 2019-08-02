<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>LDCC WMS</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

<script>
    var map;
    var trucks = [
      {
        startPosition: { lat: 37.470167, lng: 126.887780 },
        paths: [
          [37.477096, 126.884817],
          [37.475802, 126.880804],
          [37.482932, 126.877678],
          [37.483639, 126.877342],
          [37.483507, 126.876686]
        ],
        estimatedMinutes: 5,
        info: {
          name: '김롯데',
          category: '냉동류',
        }
      },
      {
        startPosition: { lat: 37.496282, lng: 126.879772 },
        paths: [
          [37.487940, 126.880330],
          [37.487216, 126.879547],
          [37.487199, 126.878238],
          [37.487386, 126.878764],
          [37.487079, 126.879139],
          [37.486543, 126.878688],
          [37.485666, 126.876521],
          [37.483639, 126.877342],
          [37.483507, 126.876686]
        ],
        estimatedMinutes: 4,
        info: {
          name: '박정통',
          category: '신선류',
        }
      },
    ];
    var speed = 60; // km/h
    var delay = 100;

    function animateMarker(marker, coords, km_h) {
      var target = 0;
      var km_h = km_h || 50;

      function goToPoint() {
        var lat = marker.position.lat();
        var lng = marker.position.lng();
        var step = (km_h * 1000 * delay) / 3600000;

        var dest = new google.maps.LatLng(
          coords[target][0], coords[target][1]);

        var distance =
          google.maps.geometry.spherical.computeDistanceBetween(
            dest, marker.position);

        var numStep = distance / step;
        var i = 0;
        var deltaLat = (coords[target][0] - lat) / numStep;
        var deltaLng = (coords[target][1] - lng) / numStep;

        function moveMarker() {
          lat += deltaLat;
          lng += deltaLng;
          i += step;

          if (i < distance) {
            marker.setPosition(new google.maps.LatLng(lat, lng));
            setTimeout(moveMarker, delay);
          }
          else {
            marker.setPosition(dest);
            target++;
            if (target == coords.length) { return; }

            setTimeout(goToPoint, delay);
          }
        }
        moveMarker();
      }
      goToPoint();
    }

    function initMap() {
      var companyPosition = { lat: 37.483700, lng: 126.876445 };

      map = new google.maps.Map(document.getElementById('map'), {
        center: companyPosition,
        zoom: 14
      });

      var factoryImg = {
        url: 'https://png.pngtree.com/svg/20161124/factory_1175345.png',
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(50, 50)
      };

      var factoryMarker = new google.maps.Marker({
        position: companyPosition,
        map: map,
        animation: google.maps.Animation.DROP,
        title: 'LDCC',
        icon: factoryImg,
      });

      var markers = trucks.map((data, idx) => {
        var marker = makeTruckMarker(idx, data);
        return marker;
      });
    
      var infowindowPark = new google.maps.InfoWindow({
        content: 'TRUCK 1'
      });
      infowindowPark.open(map, markers[0]);
      
      var infowindowKim = new google.maps.InfoWindow({
         content: 'TRUCK 2'
       });
      infowindowKim.open(map, markers[1]);
    }

    function makeTruckMarker(idx, data) {
      var truckImg = {
        url: 'https://img.icons8.com/cotton/2x/truck.png',
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(50, 50)
      };

      var marker = new google.maps.Marker({
        id: `TRK_${idx + 1}`,
        position: data.startPosition,
        map: map,
        animation: google.maps.Animation.BOUNCE,
        title: 'Truck',
        icon: truckImg,
        data
      });

      google.maps.event.addListenerOnce(map, 'idle', function () {
        animateMarker(marker, data.paths, speed);
      });

      return marker
    }

  </script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3E5303lIWaEe7PQLnXU9mZZoVHJ42_jI&callback=initMap&libraries=geometry" async defer></script>
</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/charts">
				<div class="sidebar-brand-icon">
					<i class="fas fa-warehouse"></i>
				</div>
				<div class="sidebar-brand-text mx-3">LDCC WMS</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link" href="/charts"> 
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Central Control System</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">
			
			<li class="nav-item">
				<a class="nav-link" href="/">
					<i class="fas fa-warehouse"></i> <span>Warehouses</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="/map"> 
					<i class="fas fa-truck-moving"></i><span> Logistics</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="/charts"> 
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<li class="nav-item">
				<a class="nav-link" href="">
					<i class="far fa-folder-open"></i> <span>Documents</span>
				</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="">
					<i class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
				</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="">
					<i class="fas fa-fw fa-cog"></i> <span>Components</span>
				</a>
			</li>

		</ul>
		<!-- End of Sidebar -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 mt-3 text-gray-800"><i class="fas fa-truck-moving"> </i>  Logistics</h1>
					</div>
					<div class="row">
					<div class="card col-sm-7 mr-3" style="height: 800px;">
						<div class="card-body">
							<div id="map"></div>
						</div>
					</div>
					<div class="card col-sm-4" style="height: 800px;">
						<h3 class="h3 mb-3 mt-3 text-gray-800">도착 예정 시간</h3>
						<div class="mb-3">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Truck1</div>
											<div class="h5 mb-1 font-weight-bold text-gray-800">3분</div>
											<div class="mb-1 font-weight-bold text-gray-800">냉동 : 롯데푸드 스크류바</div>
											<div class="mb-0 font-weight-bold text-gray-800">박 롯데 기사님</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-truck-moving fa-2x text-gray-300"> </i>					
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Truck2</div>
											<div class="h5 mb-1 font-weight-bold text-gray-800">4분</div>
											<div class="mb-1 font-weight-bold text-gray-800">냉장 : 장수 사과</div>
											<div class="mb-0 font-weight-bold text-gray-800">김 정보 기사님</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-truck-moving fa-2x text-gray-300"> </i>											
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="mb-3">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Truck3</div>
											<div class="h5 mb-1 font-weight-bold text-gray-800">21분</div>
											<div class="mb-1 font-weight-bold text-gray-800">냉장 : 안산 대부도 포도 </div>
											<div class="mb-0 font-weight-bold text-gray-800">이 통신 기사님</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-truck-moving fa-2x text-gray-300"> </i>											
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>

</html>