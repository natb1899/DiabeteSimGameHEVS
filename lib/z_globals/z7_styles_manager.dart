import 'package:flutter/material.dart';

import 'z8_font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required String fontFamily,
  required Color color,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle _getTextStyleLineThrought({
  required double fontSize,
  required String fontFamily,
  required Color color,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: TextDecoration.lineThrough,
  );
}

TextStyle getBoldStyleLineThrought(
    {double fontSize = FontSizeManager.s12,
    String fontFamily = FontFamily.pixelSansSerif,
    required Color color}) {
  return _getTextStyleLineThrought(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: FontWeightManager.bold,
  );
}

TextStyle getBoldStyleSuccess(
    {double fontSize = FontSizeManager.s12,
    String fontFamily = FontFamily.pixelSansSerif,
    required Color color}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: FontWeightManager.bold,
  );
}

// Black : Roboto
TextStyle getBlackStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontFamily: FontFamily.pixelSansSerif,
    color: color,
    fontWeight: FontWeightManager.black,
  );
}

// Bold : Monserrat or Roboto
TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s12,
    String fontFamily = FontFamily.pixelSansSerif,
    required Color color}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: FontWeightManager.bold,
  );
}

// Medium : Roboto
TextStyle getMediumStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontFamily: FontFamily.pixelSansSerif,
    color: color,
    fontWeight: FontWeightManager.medium,
  );
}

// Regular : Monserrat or Roboto
TextStyle getRegularStyle(
    {double fontSize = FontSizeManager.s12,
    String fontFamily = FontFamily.pixelSansSerif,
    required Color color}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: FontWeightManager.regular,
  );
}

// Light : Roboto
TextStyle getLightStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontFamily: FontFamily.pixelSansSerif,
    color: color,
    fontWeight: FontWeightManager.light,
  );
}
