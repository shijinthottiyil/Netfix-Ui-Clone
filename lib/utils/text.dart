import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;

  ModifiedText({super.key, required this.text, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size,
      ),
    );
  }
}
