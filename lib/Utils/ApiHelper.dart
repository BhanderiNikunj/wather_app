import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wather_app/Screen/weather/Model/weatherScreenModel.dart';

class ApiHelper
{
  Future<Weather> WeatherApiCall()
  async {
    String link = "https://api.openweathermap.org/data/2.5/weather?lat=20%C2%B056%2714.64%22N&lon=77%C2%B046%2746.56%22E&appid=0883637b00b449c808ba083b3c550e8b";

    Uri uri = Uri.parse(link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);

    Weather weather = Weather().toJson() as Weather;
    return weather;
  }
}