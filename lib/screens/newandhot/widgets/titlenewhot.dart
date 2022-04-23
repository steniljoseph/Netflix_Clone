import 'package:flutter/material.dart';

class TitleNewHot extends StatelessWidget {
  final String text;
  final Color? containerColor;
  final Color? textColor;
  final String iconText;
  const TitleNewHot(
      {Key? key,
      required this.text,
      this.containerColor,
      this.textColor,
      required this.iconText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Text(
              iconText,
              style:const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
