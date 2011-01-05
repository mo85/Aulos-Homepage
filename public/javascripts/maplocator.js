Aulos.Maplocator = {
	
	geocoder: null,
	map: null,
	marker: null,
	name: null,
	time: null,
	address: null,
	
	init: function(elementId) {
		if (GBrowserIsCompatible()) {
			this.geocoder = new GClientGeocoder();
	  	this.geocoder.setBaseCountryCode("ch");
			this.map = new GMap2($(elementId));
			this.map.setCenter(new GLatLng(47.383265, 8.528163), 11);
			this.map.setUIToDefault();
		}
	},
	
	setMarker: function(name, time, address) {
		this.name = name;
		this.time = time;
		this.address = address;
		this.geocoder.getLatLng(address, this.setMarkerToLatLng.bind(this));
	},
	
	setMarkerToLatLng: function(latlng) {
		this.marker = new GMarker(latlng);
		this.map.clearOverlays();
		this.map.setCenter(this.marker.getPoint());
		this.map.addOverlay(this.marker);
		
		var html = "<div>";
		html += "<strong>" + this.name + "</strong><br />";
		html += this.time + "<br />";
		html += this.address;
		html += "</div>";
		this.openInfoWindow(html);
	},
	
	openInfoWindow: function(html) {
		this.marker.openInfoWindowHtml(html);
	}
	
};