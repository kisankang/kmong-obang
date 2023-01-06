import 'package:flutter/material.dart';
import 'package:obang/pages/main_page.dart';
import 'package:obang/utils/image_path.dart';
import 'package:obang/widgets/background.dart';
import 'package:obang/widgets/custom_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const MainPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: const [
          Background(imagePath: bgTile_3),
          Positioned(
            top: 100,
            child: CustomImage(
              imagePath: splashTop,
              width: 300,
            ),
          ),
          Positioned(
            bottom: 50,
            child: CustomImage(
              imagePath: splashBottom,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
