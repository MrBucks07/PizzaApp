import 'package:flutter/material.dart';
import 'package:pizza_app/Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr.Bucks Pizza',
      initialRoute: "/",
      routes: {"/": (context) => const HomeScreen()},
    );
  }
}
