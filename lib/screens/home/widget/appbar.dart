import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';


class AppBarProfile extends StatelessWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.cast,
          size: 27,
          color: constWhiteColor,
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
            width: 25,
            height: 25,
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png?20201013161117',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
