import 'package:flutter/material.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color color;
  const IconAndText({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: Dimensions.width05 - 1),
        SmallText(text: text, color: color),
      ],
    );
  }
}
