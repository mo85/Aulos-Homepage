Aulos.Listorderer = {
	
	list: null,
	
	init: function(listId) {
		this.list = $(listId);
		this.registerOnclickListener();
	},
	
	registerOnclickListener: function() {
		var listElements = this.list.childElements()
		listElements.each(function(liElem){
			liElem.observe("click", function() {
				listElements.each(function(elem) { elem.removeClassName("selected") } );
				liElem.addClassName("selected");
			});
		});
	},
	
	moveElementUp: function() {
		var selected = $$("li.selected")[0];
		if (selected) {
			var previousElement = selected.previous(0);
			if (previousElement) {
				this.list.insert(previousElement, selected);
			}
		}
		return false;
	},
	
	moveElementDown: function() {
		var selected = $$("li.selected")[0];
		if (selected) {
			var nextElement = selected.next(0);
			if (nextElement) {
				this.list.insertBefore(nextElement, selected);
			}
		}
		return false;
	},
	
	generateOrderForInput: function(inputId) {
		var input = $(inputId);
		input.value = this.list.childElements().pluck('title');
	}
	
};