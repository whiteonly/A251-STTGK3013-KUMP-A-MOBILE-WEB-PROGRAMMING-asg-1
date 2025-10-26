import 'package:flutter/material.dart';
import 'package:trip_fuel_cost_estimater/SplashScreen.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: SplashScreen()//call to SplashScreen.dart
    );
  }
}
