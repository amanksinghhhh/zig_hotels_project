part of 'theme.dart';

final _appBar = AppBarTheme(
  toolbarHeight: 50,
  backgroundColor: _ZigHotelsColors.cream,
  titleTextStyle: _textTheme.headlineSmall?.copyWith(
    fontWeight: FontWeight.w500,
    color: _ZigHotelsColors.black,
  ),
  shadowColor: Colors.transparent,
  titleSpacing: 10,
  actionsIconTheme: IconThemeData(color: _ZigHotelsColors.black),
  systemOverlayStyle: SystemUiOverlayStyle.light,
);
