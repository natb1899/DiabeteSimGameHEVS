import 'package:flutter/cupertino.dart';

/// It's in this class that colors are defined
class ColorManager {
  static Color primary = AppColor.fromHex("#FFFFFF");
  static Color labelsColor = AppColor.fromHex("#735BF2");
  static Color appLightBlue = AppColor.fromHex("#738C96");
  static Color appGreyColor = AppColor.fromHex("#D9D9D9");
  static Color appRedColor = AppColor.fromHex("#FF0000");
  static Color appPurpleColor = AppColor.fromHex("#2900FF");
  static Color appGreenLightColor = AppColor.fromHex("#219653");
  static Color appBlueColor = AppColor.fromHex("#2900FF");
  static Color primary2 = AppColor.fromHex("#607D8B");
  static Color darkGrey = AppColor.fromHex("#525252");
  static Color grey = AppColor.fromHex("#737477");
  static Color lightGrey = AppColor.fromHex("#D3D3D3");
  static Color primaryOpacity70 = AppColor.fromHex("#B3ED9728");
  static Color darkPrimary = AppColor.fromHex("#d17d11");
  static Color grey1 = AppColor.fromHex("#707070");
  static Color grey2 = AppColor.fromHex("#797979");
  static Color white = AppColor.fromHex("#FFFFFF");
  static Color error = AppColor.fromHex("#e61f34");
  static Color success = AppColor.fromHex("#00B383");
}

extension AppColor on Color {
  static Color fromHex(String hexColorSting) {
    hexColorSting = hexColorSting.replaceFirst('#', 'FF');
    return Color(int.parse("0xFF$hexColorSting"));
  }
}
