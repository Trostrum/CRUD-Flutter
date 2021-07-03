import 'package:flutter/material.dart';
import 'main.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash screen',
      home: SplashScreenView(
        home: MyApp(),
        duration: 5000,
        imageSize: 200,
        imageSrc: "assets/image.png",
        text: "Ammar Tariq\nSP18-BCS-093",
        textType: TextType.ScaleAnimatedText,
        textStyle: TextStyle(
          fontSize: 25.0,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}