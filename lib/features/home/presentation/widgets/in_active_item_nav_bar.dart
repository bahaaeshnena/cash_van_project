import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItemNavBar extends StatelessWidget {
  const InActiveItemNavBar({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: 30,
      height: 30,
      colorFilter: const ColorFilter.mode(
        Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
