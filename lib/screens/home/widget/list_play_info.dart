import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/constants/constants.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            image: DecorationImage(
              // ignore: prefer_const_constructors
              image: NetworkImage('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/beRjbWL5yQYf8ogZ3YHFmPAZTFQ.jpg')
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(icon: Icons.add, text: "My List"),
              _playButton(),
              const CustomButtonWidget(icon: Icons.info_outline, text: "Info"),
            ],
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(constWhiteColor),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: constBlackColor,
        size: 25,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "Play",
          style: GoogleFonts.montserrat(color: constBlackColor, fontSize: 15),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: constWhiteColor,
          size: 30,
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(),
        )
      ],
    );
  }
}
