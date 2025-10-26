import 'package:flutter/material.dart';
import 'package:trip_fuel_cost_estimater/Estimater.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FuelEstimator()));
    });
    // Wait and navigate to the next route. Adjust duration as needed.
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(//make the interface into the center of app
        child: Column(
          mainAxisSize: MainAxisSize.min,//can Adjust the size according to the content and position
          
          children: [
            Image.asset('assets/fuel_picture.png', width: 250, height: 250),
            SizedBox(height: 16),//add gap between image and text
            Text(
              'Trip Fuel Cost Estimator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:Colors.blueAccent,
                
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(// add loading progress item
              color: Colors.blueAccent,
              ),
          ],
        ),
      ),
      bottomNavigationBar : BottomAppBar(//make the bottom has an ownership or creater name
        child: Padding(
          padding: const EdgeInsets.all(8.0),//make it fit in the middle and no reach the end of side
          child: Text(
            '© 2025 Muhammad Azri Asnawi',style: TextStyle(
              fontSize: 12,
              color: Colors.blueAccent  
            ),
            textAlign: TextAlign.center,
          ),
        ),
    ),
    );
     
  }
}