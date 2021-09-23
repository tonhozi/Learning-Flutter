import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static CupertinoThemeData stocksThemeData = const CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        color: CupertinoColors.label,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      ),
    ),
  );

  static TextStyle headlineText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  static TextStyle minorText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: const Color.fromRGBO(128, 128, 128, 1),
      );

  static TextStyle headlineName(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle cardTitleText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: const Color.fromRGBO(0, 0, 0, 0.9),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle cardCategoryText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: const Color.fromRGBO(255, 255, 255, 0.9),
      );

  static TextStyle cardDescriptionText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: const Color.fromRGBO(0, 0, 0, 0.9),
      );

  static TextStyle detailsTitleText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  static TextStyle detailsPreferredCategoryText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle detailsBoldDescriptionText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: const Color.fromRGBO(0, 0, 0, 0.9),
        fontWeight: FontWeight.bold,
      );

  static TextStyle detailsServingHeaderText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: const Color.fromRGBO(176, 176, 176, 1),
        fontWeight: FontWeight.bold,
      );

  static TextStyle detailsServingLabelText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle detailsServingNoteText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontStyle: FontStyle.italic,
      );

  static TextStyle triviaFinishedTitleText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontSize: 32,
      );

  static TextStyle triviaFinishedBigText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontSize: 48,
      );

  static TextStyle settingsGroupHeaderText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: CupertinoColors.inactiveGray,
        fontSize: 13.5,
        letterSpacing: -0.5,
      );

  static TextStyle settingsGroupFooterText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        color: Styles.settingsGroupSubtitle,
        fontSize: 13,
        letterSpacing: -0.08,
      );

  static const appBackground = Color(0xffd0d0d0);

  static Color? scaffoldBackground(Brightness brightness) =>
      brightness == Brightness.light
          ? CupertinoColors.lightBackgroundGray
          : null;

  static const frostedBackground = Color(0xccf8f8f8);

  static const closeButtonUnpressed = Color(0xff101010);

  static const closeButtonPressed = Color(0xff808080);

  static TextStyle settingsItemSubtitleText(CupertinoThemeData themeData) =>
      themeData.textTheme.textStyle.copyWith(
        fontSize: 12,
        letterSpacing: -0.2,
      );

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const uncheckedIcon = IconData(
    0xf372,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const checkedIcon = IconData(
    0xf373,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const transparentColor = Color(0x00000000);

  static const shadowColor = Color(0xa0000000);

  static const shadowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [transparentColor, shadowColor],
  );

  static const Color settingsMediumGray = Color(0xffc7c7c7);

  static const Color settingsItemPressed = Color(0xffd9d9d9);

  static Color settingsItemColor(Brightness brightness) =>
      brightness == Brightness.light
          ? CupertinoColors.tertiarySystemBackground
          : CupertinoColors.darkBackgroundGray;

  static Color settingsLineation(Brightness brightness) =>
      brightness == Brightness.light
          ? const Color(0xffbcbbc1)
          : const Color(0xff4c4b4b);

  static const Color settingsBackground = Color(0xffefeff4);

  static const Color settingsGroupSubtitle = Color(0xff777777);

  static const Color iconBlue = Color(0xff0000ff);

  static const Color iconGold = Color(0xffdba800);

  static const preferenceIcon = IconData(
    0xf443,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const resetIcon = IconData(
    0xf4c4,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const calorieIcon = IconData(
    0xf3bb,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const checkIcon = IconData(
    0xf383,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const servingInfoBorderColor = Color(0xffb0b0b0);

  static const ColorFilter desaturatedColorFilter =
      // 222222 is a random color that has low color saturation.
      ColorFilter.mode(Color(0xff222222), BlendMode.saturation);
}

// Colors
const Color lightBackgroundColor = Color(0xFFECECEC);

// Padding
const double paddingZero = 0.0;
const double paddingXS = 2.0;
const double paddingS = 4.0;
const double paddingM = 8.0;
const double paddingL = 16.0;
const double paddingXL = 32.0;

// Margin
const double marginZero = 0.0;
const double marginXS = 2.0;
const double marginS = 4.0;
const double marginM = 8.0;
const double marginL = 16.0;
const double marginXL = 32.0;

// Spacing
const double spaceXS = 2.0;
const double spaceS = 4.0;
const double spaceM = 8.0;
const double spaceL = 16.0;
const double spaceXL = 32.0;

// Assets
const String stocksJsonPath = 'assets/data/stocks.json';
const String markdownPath = 'assets/markdown/';

// Routes
const String initialRoute = '/';
const String categoryRoute = '/category';
