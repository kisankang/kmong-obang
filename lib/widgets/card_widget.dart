import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:obang/models/cardModel.dart';
import 'package:obang/widgets/custom_image.dart';

class CardController extends ChangeNotifier {
  CardController({
    required this.cardModel,
    required this.isBig,
  });
  CardModel cardModel;
  bool isBig;
  bool isAlreadyOpen = false;
  onTapCard() {
    if (!cardModel.isOpened) {
      cardModel.isOpened = true;
    } else {
      isBig = !isBig;
    }
    notifyListeners();
    isAlreadyOpen = cardModel.isOpened;
  }
}

class CardWidget extends StatefulWidget {
  final CardController cardController;
  final FlipCardController? flipCardController;
  final bool isBig;
  const CardWidget({
    super.key,
    required this.cardController,
    this.flipCardController,
    this.isBig = false,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cardController.addListener(() {
      mountedSetState();
    });
  }

  mountedSetState() {
    if (mounted) {
      setState(() {});
    }
  }

  buildFlipCard() {
    return FlipCard(
      onFlipDone: (_) {
        widget.cardController.onTapCard();
      },
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      back: GestureDetector(
        onTap: () {
          widget.cardController.onTapCard();
        },
        child: CustomImage(
          imagePath: widget.cardController.cardModel.imagePath,
          width: 80,
        ),
      ),
      front: CustomImage(
        imagePath: widget.cardController.cardModel.backImagePath,
        width: 80,
      ),
    );
  }

  buildOpenedCard() => GestureDetector(
        onTap: () {
          widget.cardController.onTapCard();
        },
        child: CustomImage(
          imagePath: widget.cardController.cardModel.imagePath,
          width: widget.isBig ? 300 : 80,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return widget.cardController.cardModel.isOpened
        ? buildOpenedCard()
        : buildFlipCard();
  }
}
