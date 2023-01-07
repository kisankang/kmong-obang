import 'package:flutter/material.dart';
import 'package:obang/pages/choose_page.dart';
import 'package:obang/utils/image_path.dart';
import 'package:obang/widgets/card_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  moveToChoosePage(
    BuildContext context, {
    required int howMany,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ChoosePage(howMany: howMany),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  moveToChoosePage(context, howMany: 5);
                },
                child: CardView(
                  bgImagePath: bgTile_3,
                  isTen: false,
                  width: 300,
                  hieght: 160,
                  label: "5장으로 보기",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  moveToChoosePage(context, howMany: 10);
                },
                child: CardView(
                  bgImagePath: bgTile_3,
                  isTen: true,
                  width: 300,
                  hieght: 200,
                  label: "10장으로 보기",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
