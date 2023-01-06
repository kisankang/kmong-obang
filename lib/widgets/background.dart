import 'package:flutter/material.dart';
import 'package:obang/widgets/custom_image.dart';

class Background extends StatelessWidget {
  final String imagePath;
  const Background({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomImage(
        imagePath: imagePath,
        repeat: true,
      ),
    );
  }
}
