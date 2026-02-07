import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 50); // Start from top-left and go down 50px
    path.quadraticBezierTo(
      size.width / 2, // Control point (center of the width)
      0, // Peak of the curve
      size.width, // End point (right side)
      50, // Bottom of the curve
    );
    path.lineTo(size.width, size.height); // Continue to the bottom-right
    path.lineTo(0, size.height); // Bottom-left
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
