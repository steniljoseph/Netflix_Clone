import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final double? size;
  final Color? color;
  final Color? iconColor;
  final FontWeight? weight;
  final double? gape;
  final double? iconSize;
  const NavBarItem(
      {Key? key,
      required this.iconData,
      this.iconSize,
      required this.text,
      this.size,
      this.color,
      this.gape,
      this.iconColor,
      this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: iconSize,
        ),
        SizedBox(
          height: gape ?? 2,
        ),
        customText(
          text: text,
          weight: weight ?? FontWeight.w600,
          size: size ?? 14,
          color: color,
        ),
      ],
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
