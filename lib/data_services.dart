import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'e4973d7d2231177dc47fc14d08add31b',
      'units': 'imperial'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

}
