//= require jquery
//= require jquery_ujs

$(document).ready(function() {
	console.log("Code is ready to run!");
	$(".unfollow-btn").hover(function() {
		$(this).removeClass("btn-primary")
		$(this).addClass("btn-danger");
		$(this).html("Unfollow");
	}, function() {
		$(this).addClass("btn-primary");
		$(this).removeClass("btn-danger");
		$(this).html("Following");
	});
});