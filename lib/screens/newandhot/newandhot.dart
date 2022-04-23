import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix/api/constants.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/screens/newandhot/widgets/comingsoon.dart';
import 'package:netflix/screens/newandhot/widgets/everyone.dart';
import 'package:netflix/screens/newandhot/widgets/topten.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

import '../../api/service.dart';

class NewAndHotPage extends StatelessWidget {
  const NewAndHotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'New & Hot',
          style: GoogleFonts.montserrat(
              fontSize: 30.0, fontWeight: FontWeight.w600),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.cast,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png?20201013161117',
              width: 26,
              height: 25,
            ),
          ),
        ],
      ),
      body: ScrollableListTabView(
        tabs: [
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: constWhiteColor,
              inactiveBackgroundColor: constBlackColor,
              borderRadius: BorderRadius.circular(30),
              label: '🍿 Coming Soon',
            ),
            body: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: HttpServices().getUpcoming(Constants.upComing),
                    builder: (context, AsyncSnapshot snapshot) {
                      List<dynamic> list = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: ((context, index) {
                            return ComingSoonWidgets(
                              width: width,
                              movieName: '${list[index].title}',
                              movieDescription: '${list[index].overview}',
                              date: DateFormat('MMM')
                                  .format(
                                    DateTime.parse(
                                      '${list[index].date}',
                                    ),
                                  )
                                  .toUpperCase(),
                              imageURL: '${list[index].image}',
                              day: DateFormat('dd').format(
                                DateTime.parse('${list[index].date}'),
                              ),
                              comingSoonDate:
                                  'Coming On ${DateFormat('MMMM dd').format(
                                DateTime.parse('${list[index].date}'),
                              )}',
                            );
                          }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: constWhiteColor,
              inactiveBackgroundColor: constBlackColor,
              borderRadius: BorderRadius.circular(30),
              label: '🔥 Everyone\'s watching',
            ),
            body: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: HttpServices().getUpcoming(Constants.popular),
                    builder: (context, AsyncSnapshot snapshot) {
                      List<dynamic> list = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return EveryonesWatchingWidget(
                              imageURL: '${list[index].image}',
                              movieDescription: '${list[index].overview}',
                              movieTitle: '${list[index].title}',
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: constWhiteColor,
              inactiveBackgroundColor: constBlackColor,
              borderRadius: BorderRadius.circular(30),
              label: '🔟 Top 10',
            ),
            body: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: HttpServices().getUpcoming(Constants.top10),
                    builder: ((context, AsyncSnapshot snapshot) {
                      List<dynamic> list = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return TopTenWidgets(
                              width: width,
                              imageURL: '${list[index].image}',
                              movieName: '${list[index].title}',
                              movieDescription: '${list[index].overview}',
                              number: index == 9
                                  ? '${index + 1}'
                                  : '0 ${index + 1}',
                            );
                          }),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
