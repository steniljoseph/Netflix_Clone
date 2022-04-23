import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

import '../../../api/constants.dart';
import '../../fastlaugh/widget/listbuttons.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    required this.imageURL,
    required this.movieTitle,
    required this.movieDescription,
    Key? key,
  }) : super(key: key);

  final String imageURL;
  final String movieTitle;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${Constants.imageId}$imageURL'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
           const Spacer(),
            VideoListAvatarButton(
              icon: Icons.share_outlined,
              title: 'Share',
              onPressed: (){},
            ),
            VideoListAvatarButton(
              icon: Icons.add,
              title: 'My List',
              onPressed: (){},
            ),
            VideoListAvatarButton(
              icon: Icons.play_arrow,
              title: 'Play',
              onPressed: (){},
            ),
          ],
        ),
        constHeight,
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text(
                movieTitle,
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        constHeight,
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  movieDescription,
                ),
              ),
            ],
          ),
        ),
        constHeight,
      ],
    );
  }
}
