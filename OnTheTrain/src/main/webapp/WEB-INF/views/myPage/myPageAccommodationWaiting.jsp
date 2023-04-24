<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather Forecast</title>
</head>
<body>
    <input type="text" id="city" placeholder="Enter city name">
    <input type="text" id="date" placeholder="Enter date (YYYY-MM-DD)">
    <button onclick="getWeather()">Get Weather</button>
    <div id="result"></div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function getWeather() {
        let city = document.getElementById("city").value;
        let date = document.getElementById("date").value;
        $.ajax({
            url: "/weather?city=" + city,
            type: "GET",
            success: function (data) {
                let weatherList = data.list;
                let result = "";
                for (let i = 0; i < weatherList.length; i++) {
                    let weather = weatherList[i];
                    let dateString = new Date(weather.dt * 1000).toISOString().slice(0, 10);
                    if (date === dateString) {
                        let main = weather.main;
                        let weatherDetail = weather.weather[0];
                        result = "Temperature: " + main.temp + "°C<br>"
                                + "Humidity: " + main.humidity + "%<br>"
                                + "Description: " + weatherDetail.description + "<br>"
                                + "<img src='https://openweathermap.org/img/w/" + weatherDetail.icon + ".png'>";
                        break;
                    }
                }
                if (result === "") {
                    result = "Weather data not found for the selected date.";
                }
                document.getElementById("result").innerHTML = result;
            },
            error: function (xhr) {
                document.getElementById("result").innerHTML = xhr.responseText;
            }
        });
    }
</script>
</html>
