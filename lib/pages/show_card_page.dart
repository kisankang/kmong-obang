import 'dart:math';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:obang/models/cardModel.dart';
import 'package:obang/utils/card_data.dart';
import 'package:obang/utils/image_path.dart';
import 'package:obang/widgets/background.dart';
import 'package:obang/widgets/card_widget.dart';
import 'package:obang/widgets/custom_image.dart';

class ShowCardPage extends StatefulWidget {
  final int howMany;
  final int showNumber;
  const ShowCardPage(
      {super.key, required this.howMany, required this.showNumber});

  @override
  State<ShowCardPage> createState() => _ShowCardPageState();
}

class _ShowCardPageState extends State<ShowCardPage> {
  List<CardModel> cardList = [];
  List<CardController> selectedCardControllerList = [];
  List<FlipCardController> selectedCardFlipControllerList = [];
  mountedSetState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = getCardList(widget.howMany);

    for (var i = 0; i < widget.showNumber; i++) {
      int selectedIndex = Random().nextInt(widget.howMany - i);
      selectedCardControllerList.add(
        CardController(
          cardModel: cardList[selectedIndex],
          isBig: false,
        ),
      );
      selectedCardFlipControllerList.add(FlipCardController());
      selectedCardControllerList[i].addListener(() {
        if (selectedCardControllerList[i].isBig == true) {
          showBig = true;
          showBigIndex = i;
        } else {
          showBig = false;
          showBigIndex = null;
        }
        if (selectedCardControllerList[i].isAlreadyOpen) {
          mountedSetState();
        }
      });

      cardList.remove(cardList[selectedIndex]);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var element in selectedCardControllerList) {
      element.cardModel.isOpened = false;
    }
    selectedCardControllerList.forEach((element) {
      element.dispose();
    });
  }

  bool showBig = false;
  int? showBigIndex;

  @override
  Widget build(BuildContext context) {
    debugPrint("### ShowCardPage is built");
    return Scaffold(
      body: Stack(
        children: [
          Background(
              imagePath: widget.showNumber == 1
                  ? bgTile_1
                  : widget.showNumber == 2
                      ? bgTile_2
                      : bgTile_3),
          AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          Center(
            child: !showBig
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedCardControllerList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 10),
                        child: CardWidget(
                          cardController: selectedCardControllerList[index],
                          flipCardController:
                              selectedCardFlipControllerList[index],
                        ),
                      );
                    })
                : CardWidget(
                    cardController: selectedCardControllerList[showBigIndex!],
                    isBig: true,
                  ),
          ),
        ],
      ),
    );
  }
}
