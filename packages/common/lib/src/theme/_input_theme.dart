part of 'theme.dart';

final _radius = BorderRadius.circular(_radiiDimensions.small);

OutlineInputBorder _border({
  required double width,
  required Color color,
}) =>
    OutlineInputBorder(
      borderSide: BorderSide(
        width: width,
        color: color,
      ),
      borderRadius: _radius,
    );

final _inputTheme = InputDecorationTheme(
  isDense: true,
  contentPadding: EdgeInsets.all(_spaceDimensions.small),
  fillColor: _ZigHotelsColorValues.disabled,
  enabledBorder: _border(
    width: 1,
    color: _ZigHotelsColorValues.disabled,
  ),
  focusedBorder: _border(
    width: 2,
    color: _ZigHotelsColorValues.primary,
  ),
  errorBorder: _border(
    width: 2,
    color: _ZigHotelsColorValues.error,
  ),
  focusedErrorBorder: _border(
    width: 2,
    color: _ZigHotelsColorValues.error,
  ),
  disabledBorder: _border(
    width: 1,
    color: _ZigHotelsColorValues.disabled,
  ),
);
