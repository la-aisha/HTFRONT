import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Titre extends Text {
  Titre({
    required data,
    required Color color,
    required double size,
    required FontWeight weight,
    FontStyle? style,
  }) : super(data,
    style: GoogleFonts.sourceSansPro(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ));
}
