part of 'theme.dart';

final _elevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: _ZigHotelsColors.secondaryForestGreen,
    foregroundColor: _ZigHotelsColors.white,
    disabledBackgroundColor: _ZigHotelsColors.divider,
    disabledForegroundColor: _ZigHotelsColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

final _outlinedButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: _ZigHotelsColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBackgroundColor: _ZigHotelsColors.white,
    disabledForegroundColor: _ZigHotelsColors.divider,
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ).copyWith(
    side: MaterialStateProperty.resolveWith((states) {
      // If the button is disabled, return border side purple, otherwise grey
      if (states.contains(MaterialState.disabled)) {
        return const BorderSide(color: _ZigHotelsColors.divider);
      }
      return const BorderSide(
        width: 4,
        color: _ZigHotelsColors.teal,
      );
    }),
  ),
);

final _textButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: _ZigHotelsColors.transparent,
    foregroundColor: _ZigHotelsColors.secondaryForestGreen,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBackgroundColor: _ZigHotelsColors.transparent,
    disabledForegroundColor: _ZigHotelsColors.divider,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);
