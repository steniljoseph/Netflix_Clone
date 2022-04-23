// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix/bottomnav.dart';
import 'screens/download/download.dart';
import 'screens/fastlaugh/fastlaugh.dart';
import 'screens/home/homescreen.dart';
import 'screens/newandhot/newandhot.dart';
import 'screens/search/search.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _pages = [
    HomePage(),
    NewAndHotPage(),
    FastLaughs(),
    SearchPage(),
    DownloadsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}