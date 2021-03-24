<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>果園守衛系統</title>
	<style>
	input{
    width: 100%;
    margin-bottom: 20px;
}
input[type="button"]
{
    border: none;
    outline: none;
    height: 40px;
    background: #1c8adb;
    color: black;
    font-size: 18px;
    border-radius: 20px;
}
input[type="button"]:hover
{
    cursor: pointer;
    background: #39dc79;
    color: #000;
}


    </style>
    <!--the main CSS file-->
	<link rel="stylesheet" type="text/css" href="test.css"> 
    <!--Font Awesome-->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
	<!--the main CSS file-->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	 
<link href="temp.css" rel="stylesheet">
<script type="text/javascript">
/*$(document).ready(function() {
	returnPlace();
	});

	function returnPlace() {
	var city = "";
	var region = "";
	var lat = "";
	var lon = "";

	$.getJSON("https://ipapi.co/json", function(data) {
	city = data.city;
	region = data.region;
	lat = data.latitude;
	lon = data.longitude;
	$("#location").text(city + ", " + region)


	var theUrl = "https://api.darksky.net/forecast/51c6db8bfa1c72263c519b283ad1b58e/" + lat + "," + lon + "?units=si";

	function theWeather () {
	  $.ajax({
	    url:theUrl,
	    dataType:"jsonp",
	    success: function(returned) {
	      var weatherC = (returned.currently.temperature).toFixed();
	       var weatherF = (returned.currently.temperature*1.8+32).toFixed();
	      $(".temp").text(weatherF + "° F");
	      var summarization = returned.currently.summary;
	      //in progress
	      $(".onClickC").on("click", function() {
	        $(".temp").text(weatherC + "° C");
	      })
	       $(".onClickF").on("click", function() {
	        $(".temp").text(weatherF + "° F");
	      })

	      $("#summaryOne").text(summarization);
	      var weatherIcon = returned.currently.icon;
	      if(weatherIcon == "clear-day") {
	        $("#icon").append("<img src = 'https://image.flaticon.com/icons/svg/53/53565.svg' width = '200px'>");
	      }
	      else if(weatherIcon == "clear-night") {
	        $("#icon").append("<img src = 'https://cdn1.iconfinder.com/data/icons/weather-18/512/blue_sky_at_night-512.png' width = '200px'>");
	      }
	      else if(weatherIcon == "rain") {
	        $("#icon").append("<img src = 'https://image.flaticon.com/icons/svg/55/55371.svg' width = '200px'>");
	      }
	       else if(weatherIcon == "snow") {
	        $("#icon").append("<img src = 'http://icons.iconarchive.com/icons/icons8/windows-8/512/Weather-Snow-icon.png' width = '200px'>");
	      }
	      else if(weatherIcon == "sleet") {
	        $("#icon").append("<img src = 'http://megaicons.net/static/img/icons_sizes/8/178/512/weather-sleet-icon.png' width = '200px'>");
	      }
	      else if(weatherIcon == "wind") {
	        $("#icon").append("<img src = 'https://maxcdn.icons8.com/Share/icon/ios7/Weather//windy_weather1600.png' width = '200px'>");
	      }
	      else if(weatherIcon == "fog") {
	        $("#icon").append("<img src = 'http://megaicons.net/static/img/icons_sizes/8/178/512/weather-fog-day-icon.png' width = '200px'>");
	      }
	      else if(weatherIcon == "cloudy") {
	        $("#icon").append("<img src = 'https://cdn2.iconfinder.com/data/icons/wthr/32/cloudy-512.png' width = '200px'>");
	      }
	      else if(weatherIcon == "partly-cloudy-day") {
	        $("#icon").append("<img src = 'http://icons.iconarchive.com/icons/icons8/android/512/Weather-Partly-Cloudy-Day-icon.png' width = '200px'>");
	      }
	      else if(weatherIcon == "partly-cloudy-night") {
	        $("#icon").append("<img src = 'https://maxcdn.icons8.com/Share/icon/Weather//partly_cloudy_night1600.png' width = '200px'>");
	      }
	      else {
	        $("#icon").append("<h3>Weather Image Not Found</h3>")
	      }
	    }
	  });
	}
	  theWeather();
	    
	    })
	}*/

</script>
</head>
<body>
<center><img src="dgi.png" width="338" height="100">
<img src="apj sir.png" align="right"  width="100" height="100"></center>
<div class="w3-container">
  <div class="w3-bar w3-black">
  	 <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">果園天氣</button>
     <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Paris')">果園即時守衛</button>
     <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo');window.open('http://192.168.43.192:5000/', '_self')">果園狀況顯示</button>
     <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1');window.open('https://reurl.cc/nnqX5v', '_blank')">果園管理技術資料</button>
     <a href="adminLogin.jsp" class="w3-bar-item w3-button tablink">登出
     </a>
  </div>
  <div id="London" class="w3-container w3-border city">
<main class="my-form" style="height:550px;">
    <div class="cotainer">
        <div class="row justify-content-center"><div class="daybox"><label><input id="switch_night" type="checkbox" />
        <div class="top">
            <div class="sky">
                <div class="star star1"></div>
                <div class="star star2"></div>
                <div class="star star3"></div>
                <div class="star star4"></div>
                <div class="star star5"></div>
                <div class="star star6"></div>
                <div class="star star7"></div>
            </div>
            <div class="cloud">
                <div class="rain"></div>
                <div class="rain rain1"></div>
                <div class="rain rain2"></div>
            </div><svg id="planet1" viewbox="-100 -160 200 200">
                <g>
                    <g class="tree1">
                        <circle class="leaf" cx="0" cy="-53" r="7"></circle>
                        <line class="branch" x1="0" y1="-55" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-48" x2="-3" y2="-50"></line>
                        <line class="branch" x1="0" y1="-50" x2="4" y2="-53"></line>
                    </g>
                    <g class="tree2">
                        <circle class="leaf2" cx="0" cy="-53" r="6"></circle>
                        <line class="branch" x1="0" y1="-55" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-48" x2="-3" y2="-50"></line>
                        <line class="branch" x1="0" y1="-50" x2="4" y2="-53"></line>
                    </g>
                    <g class="tree3">
                        <circle class="leaf" cx="0" cy="-53" r="7"></circle>
                        <line class="branch" x1="0" y1="-55" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-48" x2="-3" y2="-50"></line>
                        <line class="branch" x1="0" y1="-50" x2="4" y2="-53"></line>
                    </g>
                    <circle class="ground1" cx="0" cy="0" r="44"></circle>
                    <circle class="ground1" cx="-26" cy="-16" r="15"></circle>
                    <circle class="ground1" cx="20" cy="-20" r="19"></circle>
                    <circle class="ground1" cx="12" cy="22" r="13"></circle>
                    <animateTransform attributeName="transform" type="rotate" dur="20s" values="0;-360" repeatCount="indefinite"></animateTransform>
                </g>
            </svg><svg id="giraffe" viewbox="-200 -335 400 400">
                <g class="giraffe">
                    <rect class="leg rr" x="48" y="13" width="3" height="30" rx="2"></rect>
                    <rect class="leg rl" x="42" y="16" width="3" height="30" rx="2"></rect>
                    <rect class="leg lr" x="12" y="13" width="3" height="30" rx="2"></rect>
                    <rect class="leg ll" x="6" y="16" width="3" height="30" rx="2"></rect>
                    <line class="ossicones" x1="50" y1="-24" x2="47" y2="-40"></line>
                    <line class="ossicones" x1="55" y1="-24" x2="54" y2="-42"></line>
                    <circle class="osstop" cx="47" cy="-40" r="2"></circle>
                    <circle class="osstop" cx="54" cy="-42" r="2"></circle>
                    <rect class="body" x="4" y="6" width="48" height="20" rx="8"></rect>
                    <rect class="body" x="46" y="-30" width="6" height="48" rx="5"></rect>
                    <rect class="body" x="46" y="-32" width="26" height="18" rx="8"></rect>
                    <rect class="body" x="5" y="4" width="7" height="2" rx="1" transform="rotate(20)"></rect>
                    <circle class="spot" cx="43" cy="10" r="2"></circle>
                    <circle class="spot" cx="35" cy="15" r="1.5"></circle>
                    <circle class="spot" cx="20" cy="10" r="1.5"></circle>
                    <circle class="spot" cx="28" cy="11" r="2.5"></circle>
                    <circle class="spot" cx="12" cy="13" r="2"></circle>
                    <circle class="spot" cx="49" cy="-2" r="1.5"></circle>
                    <circle class="eye" cx="51" cy="-24" r="3"></circle>
                    <circle class="eyeblack" cx="51" cy="-25" r="2"></circle>
                    <circle class="eye" cx="59" cy="-26" r="3"></circle>
                    <circle class="eyeblack" cx="59" cy="-27" r="2"></circle>
                    <rect class="spot" x="46" y="-47" width="6" height="2" rx="1" transform="rotate(15)"></rect>
                    <rect class="spot" x="53" y="-3" width="6" height="2" rx="1" transform="rotate(-30)"></rect>
                </g>
            </svg><svg id="planet2" viewbox="-100 -160 200 200">
                <g>
                    <g class="tree1">
                        <circle class="leaf" cx="0" cy="-46" r="6"></circle>
                        <line class="branch" x1="0" y1="-48" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-42" x2="-3" y2="-47"></line>
                        <line class="branch" x1="0" y1="-41" x2="3" y2="-46"></line>
                    </g>
                    <g class="tree2">
                        <circle class="leaf2" cx="0" cy="-44" r="7"></circle>
                        <line class="branch" x1="0" y1="-45" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-40" x2="-3" y2="-43"></line>
                        <line class="branch" x1="0" y1="-41" x2="2" y2="-44"></line>
                    </g>
                    <g class="tree3">
                        <circle class="leaf" cx="0" cy="-44" r="5"></circle>
                        <line class="branch" x1="0" y1="-45" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-40" x2="-3" y2="-43"></line>
                        <line class="branch" x1="0" y1="-41" x2="2" y2="-44"></line>
                    </g>
                    <g class="tree4">
                        <circle class="leaf3" cx="0" cy="-46" r="6"></circle>
                        <line class="branch" x1="0" y1="-48" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-44" x2="-3" y2="-47"></line>
                        <line class="branch" x1="0" y1="-42" x2="3" y2="-46"></line>
                    </g>
                    <g class="tree5">
                        <circle class="leaf" cx="0" cy="-44" r="6"></circle>
                        <line class="branch" x1="0" y1="-45" x2="0" y2="0"></line>
                        <line class="branch" x1="0" y1="-40" x2="-3" y2="-43"></line>
                        <line class="branch" x1="0" y1="-41" x2="2" y2="-44"></line>
                    </g>
                    <circle class="ground2" cx="0" cy="0" r="36"></circle>
                    <circle class="ground2" cx="-16" cy="-24" r="10"></circle>
                    <circle class="ground2" cx="24" cy="10" r="12"></circle>
                    <circle class="ground2" cx="-10" cy="20" r="16"></circle>
                    <animateTransform attributeName="transform" type="rotate" dur="20s" values="0;-360" repeatCount="indefinite"></animateTransform>
                </g>
            </svg><svg id="planet3" viewbox="-100 -160 200 200">
                <g>
                    <circle class="ground3" cx="0" cy="0" r="31"></circle>
                    <circle class="ground3" cx="18" cy="-14" r="10"></circle>
                    <circle class="ground3" cx="0" cy="19" r="14"></circle>
                    <circle class="ground3" cx="-16" cy="0" r="17"></circle>
                    <animateTransform attributeName="transform" type="rotate" dur="20s" values="0;-360" repeatCount="indefinite"></animateTransform>
                </g>
            </svg><svg class="temsvg">
                <circle cx="-10" cy="100" r="3"></circle>
                <circle cx="50" cy="80" r="3"></circle><text x="50" y="80">20.8°</text>
                <circle cx="110" cy="60" r="3"></circle><text x="110" y="60">29.1°</text>
                <circle cx="170" cy="70" r="3"></circle><text x="170" y="70">28.2°</text>
                <circle cx="230" cy="100" r="3"></circle><text x="230" y="100">28.1°</text>
                <circle cx="290" cy="110" r="3"></circle><text x="290" y="110">25.3°</text>
                <circle cx="350" cy="90" r="3"></circle><text x="350" y="90">27.8°</text>
                <circle cx="410" cy="80" r="3"></circle><text x="410" y="80">24°</text>
                <circle cx="470" cy="560" r="3"></circle><text x="470" y="560">20°</text>
                <polyline points="-10,100 50,80 110,60 170,70 230,100 290,110 350,90 410,80 470,560"></polyline>
            </svg>
            <div class="text_loc">
                <div class="text_big">台 北 市</div>
                <div class="text_small">大 安 區</div>
            </div>
            <div class="text_info">
                <div class="text_big">27°C</div>
                <div class="text_small">星期三</div>
            </div>
        </div>
        <div class="bottom">
            <div class="dayweather">
                <h3>SUN</h3>
                <svg viewbox="-64 -30 100 100">
                    <line class="rain" x1="-25" y1="15" x2="-25" y2="35"> </line>
                    <line class="rain" x1="-14" y1="5" x2="-14" y2="25"></line>
                    <line class="rain" x1="-5" y1="20" x2="-5" y2="45"></line>
                    <circle class="cloud" cx="0" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-15" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-30" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-25" cy="10" r="15"></circle>
                    <circle class="cloud" cx="-7" cy="15" r="15"></circle>
                </svg>
            </div>
            <div class="dayweather">
                <h3>MON</h3><svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                </svg>
            </div>
            <div class="dayweather">
                <h3>TUE</h3>
                <!-- <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    <circle class="cloud" cx="0" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-15" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-30" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-25" cy="10" r="15"></circle>
                    <circle class="cloud" cx="-7" cy="15" r="15"></circle>
                </svg> -->
                <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    
                </svg>
            </div>
            <div class="dayweather">
                <h3>WED</h3>
                <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    
                </svg>
                <!-- <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    <circle class="cloud" cx="0" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-15" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-30" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-25" cy="10" r="15"></circle>
                    <circle class="cloud" cx="-7" cy="15" r="15"></circle>
                </svg> -->
                
            </div>
            <div class="dayweather">
                <h3>THU</h3>
                <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    
                </svg>
                <!-- <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    <circle class="cloud" cx="0" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-15" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-30" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-25" cy="10" r="15"></circle>
                    <circle class="cloud" cx="-7" cy="15" r="15"></circle>
                </svg> -->
                
            </div>
            <div class="dayweather">
                <h3>FRI</h3>
                <svg viewbox="-50 -50 100 100">
                    <circle class="sun" cx="0" cy="0" r="22"></circle>
                    
                </svg>
                <!-- <svg viewbox="-64 -30 100 100">
                    <line class="rain" x1="-25" y1="15" x2="-25" y2="35"> </line>
                    <line class="rain" x1="-14" y1="5" x2="-14" y2="25"></line>
                    <line class="rain" x1="-5" y1="20" x2="-5" y2="45"></line>
                    <circle class="cloud" cx="0" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-15" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-30" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-25" cy="10" r="15"></circle>
                    <circle class="cloud" cx="-7" cy="15" r="15"></circle>
                </svg> -->
                
            </div>
            <div class="dayweather">
                <h3>SAT</h3><svg viewbox="-64 -30 100 100">
                    <line class="rain" x1="-25" y1="15" x2="-25" y2="35"> </line>
                    <line class="rain" x1="-14" y1="5" x2="-14" y2="25"></line>
                    <line class="rain" x1="-5" y1="20" x2="-5" y2="45"></line>
                    <circle class="cloud" cx="0" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-15" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-30" cy="30" r="20"></circle>
                    <circle class="cloud" cx="-25" cy="10" r="15"></circle>
                    <circle class="cloud" cx="-7" cy="15" r="15"></circle>
                </svg>
            </div>
        </div>
    </label></div>
</div>
</div>
</main>
 </div>
 <div id="Paris" class="w3-container w3-border city" style="display:none">
  <br>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>



<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
        <img src="images/donkeycar.png"  border=3 width=450></img>
            <section>
  <!--for demo wrap-->
  <div class="tbl-header">
  
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="font-weight:bold"><font size="4" color=	#484891>姓名</th>
          <th style="font-weight:bold"><font size="4" color=	#484891>果園地址</th>
          <th style="font-weight:bold"><font size="4" color=	#484891>Email</th>
          <th style="font-weight:bold"><font size="4" color=	#484891>連絡電話</th>
          <th style="font-weight:bold;text-align:center"><font size="4" color=	#484891>動作</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
      	  <td style="font-weight:bold"><font size="3" color=	#336666>Chris Chen</td>
          <td style="font-weight:bold"><font size="3" color=	#336666>新北市中和區安樂路</td>
          <td style="font-weight:bold"><font size="3" color=	#336666>AIOT0804@gmail.com</td>
          <td style="font-weight:bold"><font size="3" color=	#336666>(02)6631-6666</td>
          <td><input type="button" name="start" value="開始駕車"  onclick="window.open('http://192.168.43.192:5000/activate', '_blank')"></td>
      </tbody>
    </table>
  </div>
</section>
        </div>
        <br>
    </div>

</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html> 
  </div> 
  
  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
  
<section>
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         <th style="font-weight:bold"><font size="4" color=	#484891>區域名稱</th>
          <th style="font-weight:bold"><font size="4" color=	#484891>區域圖片</th>
          <th style="font-weight:bold"><font size="4" color=	#484891>區域狀態燈</th>
          <th style="font-weight:bold"><font size="4" color=	#484891>狀態描述</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
        <td style="font-weight:bold"><img src="images/location.png" alt="" border=3 height=50 width=50></img><font size="3" color=	#336666>區域A</td>
          <td><img src="images/110.jpg" alt="" border=3 height=100 width=100></img></td>
          <td style="font-weight:bold"><img src="images/green.png" alt="" border=3 height=50 width=50></td>
          <td style="font-weight:bold"><font size="3" color=	#336666>A區域正常狀態，不需擔心 <img src="images/select_A.png" alt="" border=3 height=50 width=50></td>
        </tr>
		<tr>
        <td style="font-weight:bold"><img src="images/location.png" alt="" border=3 height=50 width=50></img><font size="3" color=	#336666>區域B</td>
          <td style="font-weight:bold"><img src="images/1.jpg" alt="" border=3 height=100 width=100></img></td>
          <td style="font-weight:bold"><img src="images/red.gif" alt="" border=3 height=50 width=50></td>
          <td style="font-weight:bold"><font size="3" color=	#336666>B區域需要處理 <img src="images/select_B.png" alt="" border=3 height=50 width=50></td>
        </tr>
        <tr>
        <td style="font-weight:bold"><img src="images/location.png" alt="" border=3 height=50 width=50></img><font size="3" color=	#336666>區域C</td>
          <td style="font-weight:bold"><img src="images/2.jpg" alt="" border=3 height=100 width=100></img></td>
          <td style="font-weight:bold"><img src="images/green.png" alt="" border=3 height=50 width=50></td>
          <td style="font-weight:bold"><font size="3" color=	#336666>C區域正常狀態，不需擔心 <img src="images/select_C.png" alt="" border=3 height=50 width=50></td>
        </tr>
        <tr>
        <td style="font-weight:bold"><img src="images/location.png" alt="" border=3 height=50 width=50></img><font size="3" color=	#336666>區域D</td>
          <td style="font-weight:bold"><img src="images/3.jpg" alt="" border=3 height=100 width=100></img></td>
          <td style="font-weight:bold"><img src="images/green.png" alt="" border=3 height=50 width=50></td>
          <td style="font-weight:bold"><font size="3" color=	#336666>D區域正常狀態，不需擔心 <img src="images/select_D.png" alt="" border=3 height=50 width=50></td>
        </tr>
      </tbody>
    </table>
  </div>
</section>
</div>
<div id="Tokyo1" class="w3-container w3-border city" style="display:none">
   
<section>
  <div class="wrap">
		<div class="comp">
			<div class="monitor">
				<div class="mid">
					<div class="site">
						<div class="topbar">
							<div class="cerrar">
								<div class="circl"></div>
								<div class="circl"></div>
								<div class="circl"></div>
							</div>
						</div>
						<div class="inhead">
							<div class="mid">
								<div class="item"></div>
							</div>
							<div class="mid txr">
								<div class="item"></div>
								<div class="item"></div>
								<div class="item"></div>
								<div class="item"></div>
							</div>
						</div>
						<div class="inslid">
							
						</div>
						<div class="incont">
							<div class="item"></div>
							<div class="item"></div>
							<div class="item"></div>
							<div class="item"></div>
							<div class="wid">
								<div class="itwid">
									<div>
										<div class="contfoot"></div>
									</div>
								</div>
								<div class="itwid">
									<div>
										<div class="contfoot"></div>
									</div>
								</div>
								<div class="itwid">
									<div>
										<div class="contfoot"></div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="infoot">
								
							</div>
						</div>
					</div>
				</div>
				<div class="mid codigo">
					<div class="line">
						<div class="item var"></div>
						<div class="item cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line">
						<div class="item min var"></div>
						<div class="item min fun"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line">
						<div class="item min var"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line">
						<div class="item var"></div>
						<div class="item atr"></div>
						<div class="item cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item min atr"></div>
						<div class="item lrg fun"></div>
						<div class="item min fun"></div>
						<div class="item lrg cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item lrg atr"></div>
						<div class="item min fun"></div>
						<div class="item min cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item atr"></div>
						<div class="item min fun"></div>
						<div class="item atr"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item min atr"></div>
						<div class="item min cont"></div>
						<div class="item lrg atr"></div>
						<div class="item  fun"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item min atr"></div>
						<div class="item lrg fun"></div>
						<div class="item lrg cont"></div>
						<div class="item min fun"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item min var"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item min var"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab2">
						<div class="item min var"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab2">
						<div class="item min atr"></div>
						<div class="item min fun"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab3">
						<div class="item min atr"></div>
						<div class="item min fun"></div>
						<div class="item lrg fun"></div>
						<div class="item lrg cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab3">
						<div class="item min atr"></div>
						<div class="item min fun"></div>
						<div class="item lrg atr"></div>
						<div class="item lrg cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab4">
						<div class="item min fun"></div>
						<div class="item lrg atr"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab1">
						<div class="item atr"></div>
						<div class="item var"></div>
						<div class="item cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab3">
						<div class="item min var"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line tab4">
						<div class="item min atr"></div>
						<div class="item min fun"></div>
						<div class="item lrg atr"></div>
						<div class="item lrg cont"></div>
						<div class="clearfix"></div>
					</div>
					<div class="line">
						<div class="item min var"></div>
						<div class="clearfix"></div>
					</div>
					
				</div>
			</div>
			<div class="base">
				
			</div>
		</div>
	</div>
</section>

</div>
    <hr class="new1">
  <center><h5>Note: 任何問題發生可聯繫 AIOT08 第四組.
本網站由AIOT08 第四組製作和設計</h5></center>
  <hr class="new1">
<center><h5>All Right Reserved @ AIOT08 第四組 :: 2020-2021</h5></center> 
  <hr class="new1">
<br>
</body>
</html>