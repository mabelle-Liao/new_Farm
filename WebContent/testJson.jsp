<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>即時氣象</title>
<link href="temp1.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.9/css/weather-icons.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css"/>
 <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
</head>

<body id="body">
    <div id="mainWrapper">
        <header>
            <h1>Local Weather</h1>
            <section class="buttonsCF">
                <button type="button" id="cel" class="btn btn-success inactive">&deg;C</button>
                <button type="button" id="far" class="btn btn-success inactive">&deg;F</button>
            </section>
        </header>
        <section class="localInformation">
            <div class="temperature">
                <div >
                    <i  class="wi display-4" id="iconToday"></i>
                </div>
                <div class="deg">
                    <span class="degree"></span>
                </div>
                <div class="SunnyOrDifferent">
                    <span class="weatherCondition"></span>
                </div>
            </div>
            <div class="dateAndTime">
                <p>COUNTRY: <span id="country" class="right"></span></p>
                <p>CITY: <span id="city" class="right"></span></p>
                <p>DATE: <span id="date" class="right"></span></p>
                <p>TIME: <span id="time" class="right"></span></p>
            </div>
            <div class="temp-Hum-Wind">
                <p>AIR PRESSURE: <span id="air-pressure" class="right"></span></p>
                <p>HUMIDITY: <span id="humidity" class="right"></span></p>
                <p>WIND SPEED: <span id="wind" class="right"></span></p>
                <p>CLOUD COVER: <span id="cloudCover" class="right"></span></p>
            </div>
        </section>
        <section class="forecast">
            <div class="dayOfWeek marg">
                <div>
                    <span class="day1">Sun</span>
                </div>
                <div>
                    <i  class="wi display-4" id="icon1"></i>
                </div>
                <div class="deg">
                    <div class="max" id="max1"></div>
                    <div class="min" id="min1"></div>
                </div>
                <div>
                    <span class="futureWC1"></span>
                </div>
            </div>
            <div class="dayOfWeek marg">
                <div>
                    <span class="day2">Mon</span>
                </div>
                <div>
                    <i  class="wi display-4" id="icon2"></i>
                </div>
                <div class="deg">
                    <div class="max" id="max2"></div>
                    <div class="min" id="min2"></div>
                </div>
                <div>
                    <span class="futureWC2"></span>
                </div>
            </div>
            <div class="dayOfWeek marg">
                <div>
                    <span class="day3">Tue</span>
                </div>
                <div>
                    <i  class="wi display-4" id="icon3"></i>
                </div>
                <div class="deg">
                    <div class="max" id="max3"></div>
                    <div class="min" id="min3"></div>
                </div>
                <div>
                    <span class="futureWC3"></span>
                </div>
            </div>
            <div class="dayOfWeek marg">
                <div>
                    <span class="day4">Wed</span>
                </div>
                <div>
                    <i  class="wi display-4" id="icon4"></i>
                </div>
                <div class="deg">
                    <div class="max" id="max4"></div>
                    <div class="min" id="min4"></div>
                </div>
                <div>
                    <span class="futureWC4"></span>
                </div>
            </div>
            <div class="dayOfWeek marg">
                <div>
                    <span class="day5">Thu</span>
                </div>
                <div>
                    <i  class="wi display-4" id="icon5"></i>
                </div>
                <div class="deg">
                    <div class="max" id="max5"></div>
                    <div class="min" id="min5"></div>
                </div>
                <div>
                    <span class="futureWC5"></span>
                </div>
            </div>
            <div class="dayOfWeek marg">
                <div>
                    <span class="day6">Fri</span>
                </div>
                <div>
                    <i  class="wi display-4" id="icon6"></i>
                </div>
                <div class="deg">
                    <div class="max" id="max6"></div>
                    <div class="min" id="min6"></div>
                </div>
                <div>
                    <span class="futureWC6"></span>
                </div>
            </div>

        </section>
    </div>
<script type="text/javascript">
$(document).ready(function () {

	  let key = '6861c2f0f97981cffcd6e5a50103526a',
	    fTemp, cTemp, city, country, icon, futureIcons, desc, windSpeed, humidity, airPressure, cloudCover, max, maxF, min, minF, restOfWeek, futureDays;
	  //Gets location from IP address
	  function getLocation() {
	    $.getJSON('https://ipapi.co/json/', function (data) {
	      let lat = data.latitude;
	      let long = data.longitude;
	      city = data.city;
	      country = data.country_name;
	      //console.log(country);
	      getWeather(lat, long);
	    });
	  }

	  //Gets weather from API
	  function getWeather(lat, long) {
	    let api = 'https://api.darksky.net/forecast/' + key + '/' + lat + ',' + long + '?callback=?';
	    $.getJSON(api, function (data) {
	      icon = data.currently.icon;
	      desc = data.currently.summary;
	      windSpeed = data.currently.windSpeed;
	      humidity = Math.round(data.currently.humidity * 100);
	      airPressure = (data.currently.pressure / 1000).toFixed(3);
	      cloudCover = data.currently.cloudCover;
	      fTemp = Math.round(data.currently.temperature);
	      cTemp = Math.round((fTemp - 32) * 5 / 9);

	      $('#city').html(city);
	      $('#country').html(country);
	      $('.degree').html(cTemp + "&deg;");
	      $('.weatherCondition').html(desc);
	      $('#wind').html(windSpeed + " m/s");
	      $('#humidity').html(humidity + " %");
	      $('#air-pressure').html(airPressure + " h/Pa");
	      $('#cloudCover').html(cloudCover + " %");
	      //get futureIcons
	      for (let i = 0; i <= 6; i++) {
	        futureIcons = data.daily.data[i].icon;
	        if (futureIcons === 'clear-night') {
	          $('#icon'+(i+1)).addClass('wi-night-clear');
	        } else if (futureIcons === 'partly-cloudy-day') {
	          $('#icon'+(i+1)).addClass('wi-day-cloudy');
	        } else if (futureIcons === 'partly-cloudy-night') {
	          $('#icon'+(i+1)).addClass('wi-night-alt-partly-cloudy');
	        } else if (futureIcons === 'cloudy') {
	          $('#icon'+(i+1)).addClass('wi-cloudy');
	        } else if (futureIcons === 'rain') {
	          $('#icon'+(i+1)).addClass('wi-rain');
	        } else if (futureIcons === 'sleet') {
	          $('#icon'+(i+1)).addClass('wi-sleet');
	        } else if (futureIcons === 'snow') {
	          $('#icon'+(i+1)).addClass('wi-snow');
	        } else if (futureIcons === 'wind') {
	          $('#icon'+(i+1)).addClass('wi-strong-wind');
	        } else if (futureIcons === 'fog') {
	          $('#icon'+(i+1)).addClass('wi-fog');
	        } else {
	          $('#icon'+(i+1)).addClass('wi-day-sunny');
	        }
	      }

	      //take future max temperature
	      for (let i = 0; i <= 6; i++) {
	        maxF = data.daily.data[i].temperatureMax;
	        max = Math.round((maxF - 32) * 5 / 9);
	        //console.log($('#max'+i))
	        $('#max'+(i+1)).html("max: " + max + "&deg;");
	      }

	      //take future min temperature
	      for (let i = 0; i <= 6; i++) {
	        minF = data.daily.data[i].temperatureMin;
	        min = Math.round((minF - 32) * 5 / 9);
	        $('#min'+(i+1)).html("min: " + min + "&deg;");
	      }

	      //add future summary for 6 days
	      for (let i = 0; i <= 6; i++) {
	        futureWC = data.daily.data[i].summary;
	        console.log(futureWC)
	        $('.futureWC'+(i+1)).addClass('font-sizeWC').html(futureWC);
	      }

	      getImage(icon);
	      getIcon(icon);
	    });
	  }

	  //Gets background image
	  function getImage(icon) {
	    if (icon === 'clear-night') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/733475/pexels-photo-733475.jpeg?cs=srgb&dl=photography-of-night-sky-733475.jpg&fm=jpg)');
	    } else if (icon === 'partly-cloudy-day') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/296234/pexels-photo-296234.jpeg?cs=srgb&dl=air-atmosphere-blue-blue-sky-296234.jpg&fm=jpg)');
	    } else if (icon === 'partly-cloudy-night') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/2885320/pexels-photo-2885320.jpeg?cs=srgb&dl=a-clear-sky-at-night-2885320.jpg&fm=jpg)');
	    } else if (icon === 'cloudy') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/158163/clouds-cloudporn-weather-lookup-158163.jpeg?w=940&h=650&auto=compress&cs=tinysrgb)');
	    } else if (icon === 'rain') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/1553/glass-rainy-car-rain.jpg?cs=srgb&dl=car-drops-of-water-glass-rain-1553.jpg&fm=jpg)');
	    } else if (icon === 'sleet') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/259698/pexels-photo-259698.jpeg?cs=srgb&dl=abstract-blur-branch-christmas-259698.jpg&fm=jpg)');
	    } else if (icon === 'snow') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/909016/pexels-photo-909016.jpeg?cs=srgb&dl=low-angle-shot-of-leafless-tree-with-orange-flowers-909016.jpg&fm=jpg)');
	    } else if (icon === 'wind') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/243138/pexels-photo-243138.jpeg?cs=srgb&dl=alternative-energy-blade-clouds-ecology-243138.jpg&fm=jpg)');
	    } else if (icon === 'fog') {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/69825/sunbeam-fog-autumn-nature-69825.jpeg?cs=srgb&dl=tall-trees-with-shade-of-light-69825.jpg&fm=jpg)');
	    } else {
	      $('#body').css('background-image', 'url(https://images.pexels.com/photos/544554/pexels-photo-544554.jpeg?cs=srgb&dl=agriculture-blooming-blossom-blue-sky-544554.jpg&fm=jpg)');
	    }
	  }

	  //Gets the today icon
	  function getIcon(icon) {
	    if (icon === 'clear-night') {
	      $('#iconToday').addClass('wi-night-clear');
	    } else if (icon === 'partly-cloudy-day') {
	      $('#iconToday').addClass('wi-day-cloudy');
	    } else if (icon === 'partly-cloudy-night') {
	      $('#iconToday').addClass('wi-night-alt-partly-cloudy');
	    } else if (icon === 'cloudy') {
	      $('#iconToday').addClass('wi-cloudy');
	    } else if (icon === 'rain') {
	      $('#iconToday').addClass('wi-rain');
	    } else if (icon === 'sleet') {
	      $('#iconToday').addClass('wi-sleet');
	    } else if (icon === 'snow') {
	      $('#iconToday').addClass('wi-snow');
	    } else if (icon === 'wind') {
	      $('#iconToday').addClass('wi-strong-wind');
	    } else if (icon === 'fog') {
	      $('#iconToday').addClass('wi-fog');
	    } else {
	      $('#iconToday').addClass('wi-day-sunny');
	    }
	  }
	  getLocation();

	  //Buttons functionality 
	  $('#cel').click(function () {
	    $('.degree').html(cTemp + "&deg;");
	    $('#cel').attr('disabled', true);
	    $('#far').removeAttr("disabled");
	  });
	  $('#far').click(function () {
	    $('.degree').html(fTemp + "&deg;");
	    $('#far').attr('disabled', true);
	    $('#cel').removeAttr('disabled');
	  });

	  // Get Date

	  Date.prototype.ddmmyyyy = function () {
	    let yyyy = this.getFullYear().toString();
	    let mm = (this.getMonth() + 1).toString(); // getMonth() is zero-based
	    let dd = this.getDate().toString();
	    return (dd[1] ? dd : "0" + dd[0]) + " / " + (mm[1] ? mm : "0" + mm[0]) + " / " + yyyy; // padding
	  };
	  //Get Time 
	  function getTime() {
	    let today = new Date();
	    let h = today.getHours();
	    let m = today.getMinutes();
	    let s = today.getSeconds();
	    m = checkTime(m);
	    s = checkTime(s);
	    h = checkTime(h);

	    document.getElementById("time").innerHTML = h + " : " + m + " : " + s;
	    let t = setTimeout(getTime, 500);
	  }
	  
	  function getDaysOfWeek() {
	    let daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
	    let date = new Date();
	    let dayIndex = date.getDay();
	    let day = daysOfWeek[dayIndex];
	    daysOfWeek = daysOfWeek.concat(daysOfWeek);
	    return daysOfWeek.slice(dayIndex , dayIndex + 7);
	  }

	  // Load days of week to the HtML
	  restOfWeek = getDaysOfWeek();
	  for (let i = 0; i < restOfWeek.length; i++) {
	    $('.day'+(i+1)).html(restOfWeek[i]);
	  }

	  function checkTime(i) {
	    if (i < 10) {
	      i = "0" + i;
	    } // add zero in front of numbers < 10
	    return i;
	  }

	  let date = new Date();
	  document.getElementById("date").innerHTML = date.ddmmyyyy();
	  getTime();

	});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>