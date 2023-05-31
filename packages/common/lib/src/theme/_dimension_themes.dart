part of 'theme.dart';

/// Design size is bigger than most mobiles screens
/// To keep dimensions coherent with the mockups we are using
/// .h to scale the dimensions based on current screen size.
/// Screen utils should inly be used here and for that purpose
/// Eventually we gonna use the same concept to scale fonts and radii if
/// it's relevant

final _spaceDimensions = SpaceDimensions(
  largest: 55.h,
  larger: 40.h,
  large: 30.h,
  medium: 20.h,
  small: 15.h,
  smaller: 10.h,
  smallest: 5.h,
);

final _insetsDimensions = InsetDimensions(
  largest: 50.h,
  larger: 40.h,
  large: 30.h,
  medium: 20.h,
  small: 15.h,
  smaller: 10.h,
  smallest: 5.h,
);

const double kRoundRadius = 100000;

final _radiiDimensions = RadiusDimensions(
  largest: 24,
  larger: 20,
  large: 16,
  medium: 12,
  small: 8,
  smaller: 5,
  smallest: 2,
);

final _borderWidthDimensions = BorderWidthDimensions(
  medium: 0,
  largest: 0,
  larger: 0,
  large: 0,
  small: 0,
  smaller: 0,
  smallest: 1,
);
