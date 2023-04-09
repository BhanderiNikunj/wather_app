import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/Screen/AddData/View/AddData.dart';
import 'package:wather_app/Screen/splse/View/splseScreen.dart';
import 'package:wather_app/Screen/weather/Provider/weatherScreenProvider.dart';
import 'package:wather_app/Screen/weather/View/weatherScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherScreenProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplseScreen (),
          'weather': (context) => const weatherScreen(),
          'add': (context) => const AddData(),
        },
      ),
    ),
  );
}
