import 'package:flutter/material.dart';
import 'shape.dart';

class AnimationOnePage extends StatefulWidget {
  const AnimationOnePage({super.key});

  @override
  State<AnimationOnePage> createState() => _AnimationOnePageState();
}

class _AnimationOnePageState extends State<AnimationOnePage> {
  bool inicialState = true;
  Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          AnimatedAlign(
            duration: duration,
            alignment:
                inicialState ? Alignment.bottomRight : Alignment.topCenter,
            child: ShapeWidget(
              shape: inicialState
                  ? Circle(size: 50, color: Colors.blue)
                  : Rectangle(width: 100, height: 50, color: Colors.blue),
              onTap: (() {
                setState(() {
                  inicialState = !inicialState;
                });
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ShapeWidget extends StatelessWidget {
  final Shape shape;
  final void Function() onTap;
  const ShapeWidget({super.key, required this.shape, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 500),
        width: shape.width,
        height: shape.height,
        decoration: BoxDecoration(
          color: shape.color,
          borderRadius: BorderRadius.circular(
            shape.borderRadius,
          ),
        ),
      ),
    );
  }
}
