import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/Screen/weather/Model/weatherScreenModel.dart';
import 'package:wather_app/Screen/weather/Provider/weatherScreenProvider.dart';

class weatherScreen extends StatefulWidget {
  const weatherScreen({Key? key}) : super(key: key);

  @override
  State<weatherScreen> createState() => _weatherScreenState();
}

class _weatherScreenState extends State<weatherScreen> {
  WeatherScreenProvider? weatherScreenProviderTrue;
  WeatherScreenProvider? weatherScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    weatherScreenProviderFalse =
        Provider.of<WeatherScreenProvider>(context, listen: false);
    weatherScreenProviderTrue =
        Provider.of<WeatherScreenProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'add');
            },
            icon: Icon(Icons.add),
          ),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("======================hello1");
              Weather? w1 = snapshot.data as Weather;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${w1.id}"),
                  );
                },
                itemCount: 1,
              );
            } else if (snapshot.hasData) {
              print("======================hello");
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
          future: weatherScreenProviderFalse!.weatherData(),
        ),
      ),
    );
  }
}
