$(document).on('ready page:load', function() {
	// set the type filter click listeners
	$('.type-filter').click(function(){setType(this);});
});

function setType(filter_el) {
	window.location = "update?set_type="+$(filter_el).attr("filter_name");
}