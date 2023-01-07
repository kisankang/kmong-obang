import 'package:flutter/material.dart';
import 'package:obang/pages/main_page.dart';
import 'package:obang/utils/image_path.dart';
import 'package:obang/widgets/background.dart';
import 'package:obang/widgets/custom_image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  moveToMainPage(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const MainPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => moveToMainPage(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Background(imagePath: bgTile_3),
            Positioned(
              top: 100,
              child: CustomImage(
                imagePath: splashTop,
                width: MediaQuery.of(context).size.width - 20,
              ),
            ),
            const Positioned(
              bottom: 50,
              child: CustomImage(
                imagePath: splashBottom,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
