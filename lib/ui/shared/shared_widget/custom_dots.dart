import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


class CustomDots extends StatefulWidget {
  final int dots_count, index;
  final Color color, active_color;
  const CustomDots(
      {super.key,
      required this.dots_count,
      required this.color,
      required this.active_color,
      required this.index});

  @override
  State<CustomDots> createState() => _CustomDotsState();
}

class _CustomDotsState extends State<CustomDots> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DotsIndicator(
        position: widget.index,
        decorator: DotsDecorator(
            activeColor: widget.active_color, color: widget.color),
        dotsCount: widget.dots_count,
      ),
    );
  }
}
