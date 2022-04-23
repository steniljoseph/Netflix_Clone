import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/constants/constants.dart';
// import 'package:netflix/customappbar.dart';
import '../../api/constants.dart';
import '../../api/service.dart';
import 'widget/downloadimage.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Downloads',
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
      backgroundColor: backgroundColor,
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _widgetList[index],
        separatorBuilder: (ctx, index) => const SizedBox(height: 10),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: constWhiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        constHeight,
        Text(
            "We will download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey)),
        constHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: FutureBuilder(
            future: HttpServices().getTopRated(Constants.topRated),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      radius: size.width * 0.36,
                    ),
                    DownloadsImageWidget(
                      imageList: snapshot.data[0].imageLink,
                      angle: 20.0,
                      margin: const EdgeInsets.only(left: 170, bottom: 0),
                      size: Size(size.width * 0.35, size.height * 0.23),
                    ),
                    DownloadsImageWidget(
                      imageList: snapshot.data[1].imageLink,
                      angle: -20.0,
                      margin: const EdgeInsets.only(
                        right: 170,
                        bottom: 0,
                      ),
                      size: Size(size.width * 0.35, size.height * 0.23),
                    ),
                    DownloadsImageWidget(
                      imageList: snapshot.data[2].imageLink,
                      angle: 0.0,
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      size: Size(size.width * 0.35, size.height * 0.25),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: const Color.fromARGB(255, 9, 141, 207),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Set Up',
                  style: GoogleFonts.montserrat(
                    color: constWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        constHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: constWhiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'See what you can download',
              style: GoogleFonts.montserrat(
                color: constBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        children: [
          constWidht,
          const Icon(
            Icons.settings_outlined,
            color: constWhiteColor,
          ),
          constWidht,
          Text(
            'Smart Downloads',
            style: GoogleFonts.montserrat(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
