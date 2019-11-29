console.log("Hello from the JavaScript console!");

$.ajax({
	method: "GET",
	url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b&units=imperial",
	dataType: "JSON",
	success: function(r) {
		console.log(`Temp: ${r.main.temp}. Wind: ${r.wind.speed} mph. It is ${r.weather[0].main}.`);
	}
});

console.log("Weather req sent.");
