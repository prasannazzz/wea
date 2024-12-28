import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=18.5204&lon=73.8567&appid=509079b22fae7e954dff8403ef5eba0e"),
        //  " https://api.openweathermap.org/data/2.5/weather?lat=18.5204&lon=73.8567&appid=9671f984889b5453b9f284cb9c732b2f"),
    );
    // now we can cange latitude and longitude and let's see how it perfrom.
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}