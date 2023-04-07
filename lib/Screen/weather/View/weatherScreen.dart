import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: FutureBuilder(
          future: weatherScreenProviderFalse!.weatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      "Assets/Images/img.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${weatherModel!.name}",
                                style: GoogleFonts.alice(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 60,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${weatherModel.main.temp} °F",
                                style: GoogleFonts.alice(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff343651),
                                Color(0x8C54AC),
                                Color(0xff343651),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Minimum Temp",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${weatherModel.main.tempMin} °F",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Maximum Temp",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${weatherModel.main.tempMax} °F",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Wind Speed",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${weatherModel.wind.speed}",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
