$(function(){
	"use strict";

	var mapAcadem, mapNsk;

	if($('.contacts-offices').length){
		DG.then(function() {
			mapAcadem = DG.map('academ-map', {
				'center': [54.8716,83.0783],
				'zoom': 17,
				zoomControl: false,
				fullscreenControl: false
			});

			mapNsk = DG.map('nsk-map', {
				'center': [55.0490,82.9122],
				'zoom': 17,
				zoomControl: false,
				fullscreenControl: false
			});

			var mapPinIcon = DG.icon({
				iconUrl: 'img/pin.svg',
				iconSize: [48, 57],
				popupAnchor: [-6, -73],
				zIndexOffset: 50
			});

			var markerAddressAcadem = DG.divIcon({
				iconSize: [200, 50],
				iconAnchor: [0, 22],
				className: 'academMarker',
				html: '<a href="#">ул. Разъездная, 12</a>'
			});

			var markerAddressNsk = DG.divIcon({
				iconSize: [200, 50],
				iconAnchor: [0, 22],
				className: 'nskMarker',
				html: '<a href="#">ул. Советская, 64/1</a>'
			});

			var mapPinAcademAddress = DG.marker([54.8716,83.0783], {icon: markerAddressAcadem}).addTo(mapAcadem),
				mapPinNskAddress = DG.marker([55.0490,82.9122], {icon: markerAddressNsk}).addTo(mapNsk),
				mapPinAcadem = DG.marker([54.8716,83.0783], {icon: mapPinIcon}).addTo(mapAcadem),
				mapPinNsk = DG.marker([55.0490,82.9122], {icon: mapPinIcon}).addTo(mapNsk);

			mapPinAcadem.on('click', function(){
				if(!$('.academMarker').hasClass('visible')){
					$('.academMarker').addClass('visible');
				} else {
					$('.academMarker').removeClass('visible')
				}
			});

			mapPinNsk.on('click', function(){
				if(!$('.nskMarker').hasClass('visible')){
					$('.nskMarker').addClass('visible');
				} else {
					$('.nskMarker').removeClass('visible')
				}
				console.log('nsk click');
			});
		});
	}
});
