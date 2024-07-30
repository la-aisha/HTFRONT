import 'package:flutter/material.dart';

class NavBar {
  final String label;
  final String imagePath;
  final String selectedImagePath;
  final Widget page;
  final double imageWidth;
  final double imageHeight;
  final Function(BuildContext) onPressed;

  NavBar({
    required this.label,
    required this.imagePath,
    required this.selectedImagePath,
    required this.page,
    required this.onPressed,
    this.imageWidth = 30.0,
    this.imageHeight = 30.0,
  });

  BottomNavigationBarItem get item => BottomNavigationBarItem(
        icon: Image.asset(imagePath, width: imageWidth, height: imageHeight),
        activeIcon: Image.asset(selectedImagePath, width: imageWidth, height: imageHeight),
        label: label,
      );
}
