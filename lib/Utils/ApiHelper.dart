import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wather_app/Screen/weather/Model/weatherScreenModel.dart';

class ApiHelper
{
  Future<WeatherModel> WeatherApiCall()
  async {
    String link = "https://api.openweathermap.org/data/2.5/weather?lat=21.1702&lon=72.8311&appid=0883637b00b449c808ba083b3c550e8b";

    Uri uri = Uri.parse(link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);
    print("${json} \n\n\n");
    WeatherModel weatherModel = WeatherModel.fromJson(json);
    return weatherModel;
  }
}