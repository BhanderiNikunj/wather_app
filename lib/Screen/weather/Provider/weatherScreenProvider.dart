import 'package:flutter/cupertino.dart';
import 'package:wather_app/Screen/weather/Model/weatherScreenModel.dart';
import 'package:wather_app/Utils/ApiHelper.dart';

class WeatherScreenProvider extends ChangeNotifier
{
    ApiHelper apiHelper = ApiHelper();
    Weather? w1;

    Future<void> weatherData()
    async {
        w1 = await apiHelper.WeatherApiCall();
    }
}