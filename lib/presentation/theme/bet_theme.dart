import 'package:bet_flutter/presentation/theme/bet_theme_color.dart';
import 'package:bet_flutter/presentation/theme/bet_theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BetTheme {

  factory BetTheme() {
    return _singleton;
  }

  BetTheme._internal();

  static final BetTheme _singleton = BetTheme._internal();

  static const String LIGHT = "light";
  static const String DARK = "dark";

  late ThemeData theme;

  initConfig(String type) {
    BetColorTheme colorTheme = _getColorType(type);
    TextTheme textTheme = _getTextTheme(colorTheme);
    theme = _getThemeData(colorTheme, textTheme);
  }

  BetColorTheme _getColorType(String type) {
    switch (type) {
      case BetTheme.DARK:
        return BetColorDarkTheme();
      default:
        return BetColorLightTheme();
    }
  }

  TextTheme _getTextTheme(BetColorTheme betColorTheme) {
    return TextTheme(
        bodyText1: GoogleFonts.openSans(
          fontSize: BetThemeConstant.BODY_FONT_SIZE,
          fontWeight: FontWeight.w400,
          color: betColorTheme.bodyText,
        ),
        subtitle1: GoogleFonts.openSans(
          fontSize: BetThemeConstant.BODY_FONT_SIZE,
          fontWeight: FontWeight.w400,
          color: betColorTheme.subtitleText,
        ),
        headline3: GoogleFonts.openSans(
          fontSize: BetThemeConstant.TITLE_FONT_SIZE,
          fontWeight: FontWeight.w600,
          color: betColorTheme.bodyText,
        ),
        headline6: GoogleFonts.openSans(
            fontSize: BetThemeConstant.APP_BAR_FONT_SIZE,
            fontWeight: FontWeight.w600,
            color: betColorTheme.appBarText
        )
    );
  }

  ThemeData _getThemeData(BetColorTheme betColorTheme, TextTheme textTheme) {
    return ThemeData(
      brightness: betColorTheme.brightness,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) {
            return betColorTheme.activeBackgroundButton;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: betColorTheme.foregroundButton,
        backgroundColor: betColorTheme.activeBackgroundButton,
        titleTextStyle: textTheme.headline6
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: betColorTheme.foregroundButton,
        backgroundColor: betColorTheme.activeBackgroundButton,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: betColorTheme.activeBackgroundButton,
      ),
      textTheme: textTheme,
      sliderTheme: SliderThemeData(
        disabledActiveTrackColor: betColorTheme.activeBackgroundButton,
        disabledInactiveTrackColor: betColorTheme.inactiveBackgroundButton,
        disabledThumbColor: betColorTheme.activeBackgroundButton
      )
    );
  }
}
