import 'package:flutter/material.dart';

abstract class Shape {
  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  Shape(
      {required this.width,
      required this.height,
      required this.color,
      required this.borderRadius});
}

class Rectangle extends Shape {
  Rectangle({
    required super.width,
    required super.height,
    required super.color,
  }) : super(borderRadius: 0);
}

class Circle extends Shape {
  Circle({
    required double size,
    required super.color,
  }) : super(
          height: size,
          width: size,
          borderRadius: size / 2,
        );
}
