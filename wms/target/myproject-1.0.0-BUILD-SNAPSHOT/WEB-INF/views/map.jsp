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
	height: 500px;
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
        zoom: 15
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
        makeInfoWindow(marker, data.estimatedMinutes, marker.id);
        return marker;
      });
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

    function makeInfoWindow(marker, minutes) {
      var now = new Date().getTime();
      var countDownDate = new Date(now + minutes * 60000).getTime();

      var x = setInterval(function () {
        var now = new Date().getTime();
        var distance = countDownDate - now;
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        if (document.getElementById(marker.id)) {
          document.getElementById(marker.id).innerHTML = `${minutes}분 ${seconds}초 후 도착`;
        }

        if (distance < 0) {
          clearInterval(x);
          if (document.getElementById(marker.id)) {
            document.getElementById(marker.id).innerHTML = "도착";
          }
        }
      }, 1000);

      var contentString = `
      <div>
        <p><b>${marker.id}</b></p>
        <p id="${marker.id}"></p>
        <p>${marker.data.info.name} 기사님</p>
        <p>${marker.data.info.category}</p>
      </div>`;

      var infowindow = new google.maps.InfoWindow({
        content: contentString
      });

      // marker.addListener('click', function () {
        infowindow.open(map, marker);
      // });
    }
  </script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3E5303lIWaEe7PQLnXU9mZZoVHJ42_jI&callback=initMap&libraries=geometry"
	async defer></script>
</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="">
				<div class="sidebar-brand-icon">
					<i class="fas fa-warehouse"></i>

				</div>
				<div class="sidebar-brand-text mx-3">LDCC WMS</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
			<a class="nav-link" href="/"> 
			<i class="fas fa-fw fa-tachometer-alt"></i> 
			<span>중앙 관제시스템</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">물류</div>

			<li class="nav-item"><a class="nav-link" href="/map"> <i
					class="fas fa-fw fa-chart-area"></i> <span>운송</span></a></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div id="map"></div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>