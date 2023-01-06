import 'package:flutter/material.dart';
import 'package:obang/utils/image_path.dart';
import 'package:obang/widgets/background.dart';
import 'package:obang/widgets/custom_image.dart';

class CardView extends StatelessWidget {
  final bool isTen;
  final double width;
  final double hieght;
  final String label;
  final String bgImagePath;
  const CardView({
    super.key,
    required this.bgImagePath,
    required this.isTen,
    required this.width,
    required this.hieght,
    required this.label,
  });

  cardRow() => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          5,
          (index) => Padding(
            padding: index != 0 ? EdgeInsets.only(left: 10) : EdgeInsets.all(0),
            child: CustomImage(
              imagePath: smallCardBack,
              width: 30,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      child: Stack(
        children: [
          Background(imagePath: bgImagePath),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cardRow(),
                  if (isTen) ...[
                    SizedBox(height: 10),
                    cardRow(),
                  ],
                  SizedBox(height: 20),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
