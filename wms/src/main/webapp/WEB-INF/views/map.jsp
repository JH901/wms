<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>Simple Map</title>
  <meta name="viewport" content="initial-scale=1.0">
  <meta charset="utf-8">
  <style>
    #map {
      height: 100%;
    }

    html,
    body {
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

<body>
  <div id="map"></div>
</body>

</html>