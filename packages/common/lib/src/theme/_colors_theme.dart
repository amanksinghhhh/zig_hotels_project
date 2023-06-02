part of 'theme.dart';

abstract class _ZigHotelsColors {
  static const Color cream = Color(0xffe5d7c2);
  static const Color secondaryForestGreen = Color(0xff3b796b);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);

  static const Color successGreen = Color(0xff0CCA6F);
  static const Color red = Color(0xffBE2845);

  static const Color border = Color(0xffD9D9D9);
  static const Color divider = Color(0xffB3B3B3);
  static const Color transparent = Color(0x00000000);

  static const Color darkBlue = Color(0xff002B5B);
  static const Color seaBlue = Color(0xff1A5F7A);
  static const Color oceanBlue = Color(0xff159895);
  static const Color teal = Color(0xff57C5B6);
}

const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _ZigHotelsColors.cream,
  onPrimary: _ZigHotelsColors.white,
  secondary: _ZigHotelsColors.secondaryForestGreen,
  onSecondary: _ZigHotelsColors.white,

  /// We gonna need a custom extension for colors
  /// to support other zigHotels services
  tertiaryContainer: _ZigHotelsColors.successGreen,
  onTertiaryContainer: _ZigHotelsColors.white,
  error: _ZigHotelsColors.red,
  onError: _ZigHotelsColors.white,
  background: _ZigHotelsColors.white,
  onBackground: _ZigHotelsColors.black,
  surface: _ZigHotelsColors.white,
  onSurface: _ZigHotelsColors.black,
);
