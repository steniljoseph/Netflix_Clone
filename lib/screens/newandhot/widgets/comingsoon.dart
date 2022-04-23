import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

import '../../../api/constants.dart';
import '../../fastlaugh/widget/listbuttons.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    Key? key,
    required this.width,
    required this.date,
    required this.day,
    required this.imageURL,
    required this.comingSoonDate,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  final double width;
  final String date;
  final String day;
  final String imageURL;
  final String comingSoonDate;
  final String movieName;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  color: backgroundGrey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: width - 55,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${Constants.imageId}$imageURL',
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 180,
                  ),
                  const Positioned(
                    left: 330,
                    top: 150,
                    child: Icon(
                      Icons.volume_off_outlined,
                      size: 20,
                    ),
                  ),
                ],
              ),
              constHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  VideoListAvatarButton(
                    icon: Icons.add_alert,
                    title: 'Remind Me',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onPressed: () {},
                  ),
                ],
              ),
             
              Text(
                comingSoonDate,
              ),
              constHeight,
              Text(
                movieName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              constHeight,
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieDescription,
                        style: const TextStyle(overflow: TextOverflow.fade),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
