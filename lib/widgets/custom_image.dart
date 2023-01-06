import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final bool repeat;
  const CustomImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.repeat = false,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imagePath),
      width: width,
      height: height,
      repeat: repeat ? ImageRepeat.repeat : ImageRepeat.noRepeat,
    );
  }
}
