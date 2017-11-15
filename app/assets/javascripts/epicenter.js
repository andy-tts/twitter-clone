//= require jquery
//= require jquery_ujs

function doSomething() {
	console.log("Something!!!");
}

$(document).ready(function() {
	console.log("Code is ready to run!");
	doSomething();
});