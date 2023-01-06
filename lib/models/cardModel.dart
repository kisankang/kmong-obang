import 'package:obang/utils/image_path.dart';

class CardModel {
  String smallImagePath;
  String imagePath;
  String backImagePath = smallCardBack;
  bool isOpened;
  CardModel({
    required this.smallImagePath,
    required this.imagePath,
    this.isOpened = false,
  });
}
