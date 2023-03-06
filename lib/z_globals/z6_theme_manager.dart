import 'package:flutter/material.dart';

import 'Z5_color_manager.dart';
import 'z8_font_manager.dart';
import 'z7_styles_manager.dart';
import 'z9_ui_values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1, // will be used in case of disabled button for example

    // Ripple color :
    splashColor: ColorManager.primaryOpacity70,

    // Card view them
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: GameSize.s8,
      shadowColor: ColorManager.grey,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: GameSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s16,
        )),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: Colors.transparent,
      splashColor: ColorManager.primaryOpacity70,
    ),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.success,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            GameSize.s12,
          ),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
        displayLarge: getBlackStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSizeManager.s22,
        ),
        displayMedium: getBoldStyle(
          color: ColorManager.error,
          fontFamily: FontFamily.pixelSansSerif,
          fontSize: FontSizeManager.s12,
        ),
        titleMedium: getMediumStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
        titleSmall: getMediumStyle(
          color: ColorManager.primary,
          fontSize: FontSizeManager.s14,
        ),
        bodySmall: getRegularStyle(
          color: ColorManager.grey1,
        ),
        bodyLarge: getRegularStyle(
          color: ColorManager.grey,
          fontFamily: FontFamily.pixelSansSerif,
        ),
        labelLarge: getMediumStyle(
          fontSize: FontSizeManager.s16,
          color: ColorManager.white,
        )),

    // Input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(GamePadding.p8),
      // Hint style
      hintStyle: getRegularStyle(
        color: ColorManager.grey1,
      ),
      // Label style
      labelStyle: getRegularStyle(
        color: ColorManager.darkGrey,
      ),
      // Error style
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),

      // Enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: GameSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            GameSize.s8,
          ),
        ),
      ),

      // Focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: GameSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            GameSize.s8,
          ),
        ),
      ),

      // Error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: GameSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            GameSize.s8,
          ),
        ),
      ),

      // Focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: GameSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            GameSize.s8,
          ),
        ),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
  );
}
