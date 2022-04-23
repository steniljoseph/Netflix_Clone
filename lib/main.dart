import 'package:flutter/material.dart';
import 'package:netflix/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        cardColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      home: MainScreen(),
    );
  }
}
