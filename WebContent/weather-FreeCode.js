
$(document).ready(function () {

	let $location = $("#location"),
		$dayAndTime = $(".pull-left"),
		$selectUnitsDropDown = $("select").val(),
		$weatherImage = $("#weather-image i"),
		$weatherDescription = $("#weather-detail"),
		$tempValue = $("#temp .temp-value"),
		$tempUnit = $("#temp .temp-unit"),
		$pressure = $("#pressure span"),
		$wind = $("#wind span"),
		$humidity = $("#humidity span"),
		$date,
		$url;

	setInterval(() => {
		$date = moment().format('dddd, h : mm a');
		$dayAndTime.html($date);
	}, 1000);

	$.get("https://ipinfo.io", function (response) {
		//$location.html(response.city + ", " + response.region);
		[$lat, $lon] = response.loc.split(",");
		$url = "https://api.openweathermap.org/data/2.5/weather?lat=" + $lat + "&lon=" + $lon + "&appid=d51a257c115b6c19dcb52f542833a7e1&units=metric";

		$.getJSON($url, function (response) {
			$weatherDescription.html(response.weather[0].description);
			$pressure.html(response.main.pressure);
			$wind.html(response.wind.speed);
      //location
      $location.html(response.name+ " , " + response.sys.country);
			$humidity.html(response.main.humidity);
			let $temp = response.main.temp;

			let toCelsius = () => {
				$tempValue.html($temp);
				$tempUnit.html("&#8451;");
			};

			let toFahrenheit = () => {
				$tempValue.html(Math.round(($temp * (9 / 5)) + 32));
				$tempUnit.html("&#8457;");
			}

			if ($selectUnitsDropDown === "\u2103") {
				toCelsius();
			} else {
				toFahrenheit();
			}

			$("select").change(function () {
				if ($(this).val() !== "\u2103") {
					toFahrenheit();
				} else {
					toCelsius();
				}
			});

			let $changeWeatherIcon = (weatherClass) => {
				$weatherImage.removeClass().addClass("wi " + weatherClass);
			}

			let $weather = response.weather[0].main.toLowerCase();
			switch ($weather) {
				case "drizzle":
					$changeWeatherIcon("wi-sprinkle");
					break;
				case "clouds":
					$changeWeatherIcon("wi-cloudy");
					break;
				case "rain":
					$changeWeatherIcon("wi-rain");
					break;
				case "snow":
					$changeWeatherIcon("wi-snow");
					break;
				case "clear":
					$changeWeatherIcon("wi-cloud");
					break;
				case "thunderstom":
					$changeWeatherIcon("wi-thunderstorm");
					break;
				default:
					$changeWeatherIcon("wi-cloudy");
			}

		});

	}, "jsonp");

});
