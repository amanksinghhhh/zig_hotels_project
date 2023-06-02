import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '_app_bar_theme.dart';
part '_buttons_theme.dart';
part '_colors_theme.dart';
part '_colors_theme_extension.dart';
part '_dimension_themes.dart';
part '_divider_theme.dart';
part '_input_theme.dart';
part '_text_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _colorScheme,
  textTheme: _textTheme,
  fontFamily: 'Ubuntu',
  extensions: [
    Dimensions(
      spaces: _spaceDimensions,
      insets: _insetsDimensions,
      borderWidths: _borderWidthDimensions,
      radii: _radiiDimensions,
    ),
    zigHotelsColorsExtension,
  ],
  appBarTheme: _appBar,
  elevatedButtonTheme: _elevatedButton,
  textButtonTheme: _textButton,
  outlinedButtonTheme: _outlinedButton,
  dividerTheme: _divider,
  scaffoldBackgroundColor: _colorScheme.background,
  inputDecorationTheme: _inputTheme,
);
