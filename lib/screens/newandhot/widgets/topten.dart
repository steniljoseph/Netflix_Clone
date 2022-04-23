import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import '../../../api/constants.dart';
import '../../fastlaugh/widget/listbuttons.dart';

class TopTenWidgets extends StatelessWidget {
  const TopTenWidgets({
    Key? key,
    required this.width,
    required this.imageURL,
    required this.movieName,
    required this.movieDescription,
    required this.number,
  }) : super(key: key);

  final double width;
  final String number;
  final String imageURL;
  final String movieName;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 420,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                number,
                style:const TextStyle(
                  fontSize: 19,
                  color: constWhiteColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width - 55,
          height: 420,
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
                const  Positioned(
                    left: 320,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 const Spacer(),
                  VideoListAvatarButton(
                    icon: Icons.share_outlined,
                    title: 'Share',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.add,
                    title: 'My List',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.play_arrow,
                    title: 'Play',
                    onPressed: () {},
                  ),
                ],
              ),
              constHeight,
              Text(
                movieName,
                style:const TextStyle(
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
                        style:const TextStyle(
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              constHeight,
            ],
          ),
        ),
      ],
    );
  }
}
