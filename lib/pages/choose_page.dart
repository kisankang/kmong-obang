import 'package:flutter/material.dart';
import 'package:obang/pages/show_card_page.dart';
import 'package:obang/utils/image_path.dart';
import 'package:obang/widgets/background.dart';
import 'package:obang/widgets/custom_image.dart';

class ChoosePage extends StatelessWidget {
  final int howMany;
  const ChoosePage({
    super.key,
    required this.howMany,
  });

  buildSelection(BuildContext context, {required int num}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ShowCardPage(
              howMany: howMany,
              showNumber: num,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 300,
          height: 170,
          child: Stack(
            children: [
              Background(imagePath: bgTile_3),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        num,
                        (index) => CustomImage(
                          imagePath: smallCardBack,
                          width: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      num.toString() + "장 점사",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSelection(context, num: 1),
            SizedBox(height: 10),
            buildSelection(context, num: 2),
            SizedBox(height: 10),
            buildSelection(context, num: 3),
          ],
        ),
      ),
    );
  }
}
