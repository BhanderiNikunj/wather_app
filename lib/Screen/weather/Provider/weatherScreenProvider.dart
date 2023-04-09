import 'package:flutter/cupertino.dart';
import 'package:wather_app/Screen/weather/Model/weatherScreenModel.dart';
import 'package:wather_app/Utils/ApiHelper.dart';

class WeatherScreenProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  WeatherModel? weatherModel;


  String Name = "Surat";
  TextEditingController txtcityname = TextEditingController();

  void changeData(String name){
    Name = name;
    notifyListeners();
  }


  Future<WeatherModel?> weatherData(String name) async {
    weatherModel = await apiHelper.WeatherApiCall(name);
    return weatherModel;
  }
}
