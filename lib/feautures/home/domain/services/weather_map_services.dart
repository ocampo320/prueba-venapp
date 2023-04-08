import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherMapServices {
  static Future<String> getWeatherMapServices(
      String city, String dateEntrt) async {
    String rainProbability = '';
    String location = 'Medellin';

    String apiKey = '4ecbe99f635f10a53416778bd51cad7a';

    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$apiKey'));

    var data = jsonDecode(response.body);
    var long = data["city"]["coord"]["lon"];
    var lant = data["city"]["coord"]["lat"];

    http.Response responseRain = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lant&lon=$long&appid=$apiKey'));

    var dataRain = jsonDecode(responseRain.body);

    rainProbability = dataRain["weather"].first["description"].toString();

    return rainProbability.toString();
  }
}
