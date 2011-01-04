Aulos.Maplocator = {
	init: function(elementId) {
		if (GBrowserIsCompatible()) {
			this.geocoder = new GClientGeocoder();
	  	this.geocoder.setBaseCountryCode("ch");
			this.map = new GMap2($(elementId));
			this.map.setCenter(new GLatLng(47.383265, 8.528163), 11);
			this.map.setUIToDefault();
			this.marker = null;
		}
	},
	
	addMarkerToAddress: function(address) {
		this.geocoder.getLatLng(address, this.addMarkerToLatLng);
	},
	
	addMarkerToLatLng: function(latlng) {
		var map = Aulos.Maplocator.map
		map.clearOverlays();
		var marker = new GMarker(latlng);
		map.setCenter(marker.getPoint());
		map.addOverlay(marker);
	}
	
};