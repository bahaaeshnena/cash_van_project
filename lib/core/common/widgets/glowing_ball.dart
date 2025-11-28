import 'package:flutter/material.dart';

class GlowingBall extends StatelessWidget {
  const GlowingBall({
    super.key,
    required this.color1,
    required this.color2,
    required this.alignmentBegin,
    required this.alignmentEnd,
    this.width,
    this.height,
  });

  final Color color1;
  final Color color2;
  final AlignmentGeometry alignmentBegin;
  final AlignmentGeometry alignmentEnd;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 280,
      height: height ?? 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: alignmentBegin,
          end: alignmentEnd,
        ),
      ),
    );
  }
}
