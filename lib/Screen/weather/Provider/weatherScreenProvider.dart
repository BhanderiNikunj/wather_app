import 'package:flutter/cupertino.dart';
import 'package:wather_app/Screen/weather/Model/weatherScreenModel.dart';
import 'package:wather_app/Utils/ApiHelper.dart';

class WeatherScreenProvider extends ChangeNotifier
{
    ApiHelper apiHelper = ApiHelper();
    WeatherModel? weatherModel;

    Future<WeatherModel?> weatherData()
    async {
        weatherModel = await apiHelper.WeatherApiCall();
        return weatherModel;
    }
}