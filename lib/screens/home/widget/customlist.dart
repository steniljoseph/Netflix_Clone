// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {
  final bool isCategory;
  ListViewCustom({Key? key, required this.isCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          isCategory ? categoryList.length : homeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: customText(
                              text: isCategory
                                  ? categoryList[index]
                                  : homeList[index],
                              align: TextAlign.center,
                              color: Colors.white70,
                              size: 20,
                              weight: (isCategory == false && index == 2)
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        );
                      }),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.clear),
                  )),
            )
          ],
        ),
      ),
    );
  }

  final List<String> categoryList = [
    'Home',
    'My List',
    'Available for Download',
    'Hindi',
    'Tamil',
    'Punjabi',
    'Telugu',
    'Malayalam',
    'Marathi',
    'Bengali',
    'English',
    'Action',
    'Anime',
    'Award Winners',
    'Biographical',
    'Bollywood',
    'Blockbusters',
    'Children & Family',
    'Comedies',
    'Documentaries',
    'Dramas',
    'Fantasy',
    'Hollywood',
    'Horror',
    'International',
    'Indian',
    'Music & Musicals',
    'Reality & Talk',
    'Romance',
    'Sci-Fi',
    'Stand-up',
    'Thrillers',
  ];

  final List<String> homeList = ['Home', 'TV Shows', 'Movies'];

  Widget customText(
      {required String text,
      Color? color,
      double? size,
      FontWeight? weight,
      TextAlign? align}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
