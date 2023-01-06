import 'package:obang/models/cardModel.dart';
import 'package:obang/utils/image_path.dart';

CardModel card1 = CardModel(smallImagePath: smallCard_1, imagePath: card_1);
CardModel card3 = CardModel(smallImagePath: smallCard_2, imagePath: card_2);
CardModel card4 = CardModel(smallImagePath: smallCard_3, imagePath: card_3);
CardModel card2 = CardModel(smallImagePath: smallCard_4, imagePath: card_4);
CardModel card5 = CardModel(smallImagePath: smallCard_5, imagePath: card_5);
CardModel card6 = CardModel(smallImagePath: smallCard_6, imagePath: card_6);
CardModel card7 = CardModel(smallImagePath: smallCard_7, imagePath: card_7);
CardModel card8 = CardModel(smallImagePath: smallCard_8, imagePath: card_8);
CardModel card9 = CardModel(smallImagePath: smallCard_9, imagePath: card_9);
CardModel card10 = CardModel(smallImagePath: smallCard_10, imagePath: card_10);

List<CardModel> cardData = [
  card1,
  card3,
  card4,
  card2,
  card5,
  card6,
  card7,
  card8,
  card9,
  card10,
];

List<CardModel> getCardList(int num) {
  List<CardModel> result = [];
  for (var i = 0; i < num; i++) {
    result.add(cardData[i]);
  }
  return result;
}
