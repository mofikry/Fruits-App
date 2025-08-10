import 'package:fruit_hup/core/utils/app_images.dart';

class BottonNavBarEntaty {
  final String activeImage, inActiveImage;
  final String name;
  BottonNavBarEntaty(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottonNavBarEntaty> get getBottonNavBars => [
      BottonNavBarEntaty(
        activeImage: Assets.imagesVuesaxBoldHome,
        inActiveImage: Assets.imagesVuesaxOutlineHome,
        name: "الرئيسية",
      ),
      BottonNavBarEntaty(
        activeImage: Assets.imagesVuesaxBoldElement3,
        inActiveImage: Assets.imagesVuesaxOutlineElement3,
        name: "المنتجات",
      ),
      BottonNavBarEntaty(
        activeImage: Assets.imagesVuesaxBoldShoppingCart,
        inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
        name: "سلة التسوق",
      ),
      BottonNavBarEntaty(
        activeImage: Assets.imagesVuesaxBoldUser,
        inActiveImage: Assets.imagesVuesaxOutlineUser,
        name: "حسابى",
      ),
    ];
