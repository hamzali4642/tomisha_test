import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start drawing from the bottom-left corner
    path.lineTo(0, size.height);

    // Draw a curve from the bottom-left to the bottom-right
    path.quadraticBezierTo(
        size.width / 4, size.height - 60, size.width / 2, size.height - 40);

    // Draw a curve from the bottom-right to the top-right
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height - 60);

    // Draw a straight line from the top-right to the top-left
    path.lineTo(size.width, 0);

    // Draw a straight line from the top-left to the bottom-left
    path.lineTo(0, 0);

    // Close the path to complete the shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}