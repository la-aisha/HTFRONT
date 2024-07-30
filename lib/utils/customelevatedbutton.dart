import 'package:flutter/material.dart';
import 'package:hizboufront/utils/title.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final TitleText titleText;

  const CustomElevatedButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // Remove click animation
        backgroundColor: backgroundColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor),
        ),
      ),
      onPressed: onPressed,
      child: titleText,
    );
  }
}
