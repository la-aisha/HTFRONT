import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageModel {
  final String backgroundImage;
  final String title;
  final String description;

  PageModel({
    required this.backgroundImage,
    required this.title,
    required this.description,
  });

  Widget buildTitleText({
    required Color color,
    required double size,
    required FontWeight weight,
    required int maxLines,
    required TextOverflow overflow,
    TextAlign? textAlign,
  }) {
    return Text(
      title,
      textAlign: textAlign,
      style: GoogleFonts.luckiestGuy(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
      ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  Widget buildDescriptionText({
    required Color color,
    required double size,
    required FontWeight weight,
    required int maxLines,
    required TextOverflow overflow,
    TextAlign? textAlign,
  }) {
    return Text(
      description,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
      ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

