import 'package:flutter/material.dart';
import 'package:pet_car_app/view/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pet Care App",
      home: const SplashScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(245, 146, 69, 1),
        useMaterial3: true,
      ),
    );
  }
}
