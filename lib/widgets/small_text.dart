import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;

  const SmallText(
      {Key? key,
      this.color = const Color(0xFF5c524f),
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(color: color, fontSize: size, height: height)),
    );
  }
}
