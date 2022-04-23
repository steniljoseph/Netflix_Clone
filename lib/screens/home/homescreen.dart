import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/screens/home/widget/customlist.dart';

import '../../api/constants.dart';
import '../../api/service.dart';
import 'widget/appbar.dart';
import 'widget/iconandtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpServices httpServices = HttpServices();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder(
          future: httpServices.getTopRated(Constants.topRated),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      excludeHeaderSemantics: true,
                      elevation: 0,
                      floating: true,
                      snap: true,
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 90,
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/netflix_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const AppBarProfile(),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          isChanged
                              ? Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return ListViewCustom(
                                                isCategory: false,
                                              );
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          customText(
                                              text: 'Movies',
                                              size: 18,
                                              weight: FontWeight.bold),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: constWhiteColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return ListViewCustom(
                                                isCategory: true,
                                              );
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          customText(
                                              text: 'All categories', size: 14),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: customText(
                                          text: 'TV Shows', size: 16),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isChanged = true;
                                          });
                                        },
                                        child: customText(
                                            text: 'Movies', size: 16)),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return ListViewCustom(
                                                isCategory: true,
                                              );
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          customText(
                                              text: 'Categories', size: 16),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    )
                  ];
                },
                body: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            child: Image.network(
                              '${Constants.imageId}${snapshot.data[7].imageLink}',
                              fit: BoxFit.cover,
                            ),
                            height: 450,
                            width: double.infinity,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const NavBarItem(
                                iconData: Icons.add,
                                text: 'My List',
                                
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 3),
                                decoration: const BoxDecoration(
                                    color: constWhiteColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))),
                                child: Row(
                                  children: [
                                    const Icon(Icons.play_arrow,color: Colors.black,),
                                    const SizedBox(
                                      width: 4.5,
                                    ),
                                    customText(text: 'Play', color: constBlackColor)
                                  ],
                                ),
                              ),
                              const NavBarItem(
                                iconData: Icons.info_outline,
                                text: 'Info',
                                iconColor: constWhiteColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: const CategoryHeading(text: 'My List'),
                    ),
                    SizedBox(
                      height: 170,
                      child: FutureBuilder(
                        future: httpServices.getTopRated(Constants.topRated),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<dynamic>> snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> list = snapshot.data!;
                            return ListView.builder(
                              itemCount: list.length,
                              padding: const EdgeInsets.only(left: 14,right: 14),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: SizedBox(
                                      width: 100,
                                      child: Image.network(
                                        '${Constants.imageId}${list[index].imageLink}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: const CategoryHeading(text: 'Continue Watching for Stenil'),
                    ),
                    SizedBox(
                      height: 184,
                      width: double.infinity,
                      child: FutureBuilder(
                          future: httpServices
                              .getTopRated(Constants.continueWatching),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data!;
                              return ListView.builder(
                                itemCount: list.length,
                                padding: const EdgeInsets.only(left: 14),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                width: 100,
                                                child: Image.network(
                                                  '${Constants.imageId}${list[index].imageLink}',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 150,
                                                width: 100,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  constWhiteColor),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.black
                                                              .withOpacity(.5)),
                                                      child: const Icon(
                                                        Icons.play_arrow,
                                                        color: constWhiteColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    customText(
                                                        text:
                                                            'S${index + 1} : E${index * 2}',
                                                        size: 10,
                                                        weight: FontWeight.bold)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 4,
                                            child: LinearProgressIndicator(
                                              value: randomNumber(),
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(Colors.red),
                                              backgroundColor: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 30,
                                            color: Colors.grey[900],
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Icon(
                                                    Icons.info_outline,
                                                    color: constWhiteColor,
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    color: constWhiteColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: const CategoryHeading(text: 'Popular on Netflix'),
                    ),
                    SizedBox(
                      height: 170,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(Constants.popular),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data;
                              return ListView.builder(
                                itemCount: list.length,
                                padding: const EdgeInsets.only(left: 14),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        width: 100,
                                        child: Image.network(
                                          '${Constants.imageId}${list[index].imageLink}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: const CategoryHeading(text: 'Only on Netflix'),
                    ),
                    SizedBox(
                      height: 277,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(Constants.netflix),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data;
                              return ListView.builder(
                                itemCount: list.length,
                                padding: const EdgeInsets.only(left: 14),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 14),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Image.network(
                                          '${Constants.imageId}${list[index].imageLink}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: const CategoryHeading(text: 'Top 10 in India Today'),
                    ),
                    SizedBox(
                      height: 180,
                      child: FutureBuilder(
                          future: httpServices.getTopRated(Constants.continueWatching),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic> list = snapshot.data;
                              return ListView.builder(
                                itemCount: 10,
                                padding: const EdgeInsets.only(left: 14,right: 14),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 180,
                                    width: 140,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: SizedBox(
                                            width: 120,
                                            height: 180,
                                            child: Image.network(
                                              '${Constants.imageId}${list[index].imageLink}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -20,
                                          left: -5,
                                          child: Stack(
                                            children: [
                                              Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                    fontSize: 100,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 7
                                                      ..color =
                                                          constWhiteColor),
                                              ),
                                              Text(
                                                '${index + 1}',
                                                style: const TextStyle(
                                                    fontSize: 100,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }

  double randomNumber() {
    var rng = Random();
    int num = 0;
    for (var i = 1; i < 101; i++) {
      num = rng.nextInt(100);
    }
    double newNum = num / 100;
    return newNum;
  }

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

class CategoryHeading extends StatelessWidget {
  final String text;
  const CategoryHeading({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10, bottom: 2),
      child: customText(
          text: text, weight: FontWeight.w900, size: 16),
    );
  }
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