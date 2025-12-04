import 'package:flutter/material.dart';
import 'pages/car_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Banter JDM Car~",
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
