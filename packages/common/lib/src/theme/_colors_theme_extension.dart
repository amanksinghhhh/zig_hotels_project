part of 'theme.dart';

// ignore_for_file: unused_field
// We use this to be able to define symbols not used yet
abstract class _ZigHotelsColorValues {
  static const primary = Color(0xff641FE3);
  static const onPrimary = Color(0xffFFFFFF);

  static const secondary = Color(0xff6B3BC7);
  static const onSecondary = Color(0xffFFFFFF);

  static const surface = Color(0xffFFFFFF);
  static const onSurface = Color(0xff000000);
  static const surfaceVariant = Color(0xffF3F3F3);

  static const background = Color(0xffFFFFFF);
  static const onBackground = Color(0xff000000);

  static const border = Color(0xffD9D9D9);
  static const disabled = Color(0xffDADADA);

  static const error = Color(0xffBE2845);
  static const onError = Color(0xffFFFFFF);

  static const errorContainer = Color(0xffF9DEDC);
  static const onErrorContainer = Color(0xff410E0B);

  static const success = Color(0xff0B920B);
  static const onSuccess = Color(0xffFFFFFF);

  static const successContainer = Color(0xffB3EAB3);
  static const onSuccessContainer = Color(0xff008b00);

  static const identityCardBusinessHeader = Color(0xff474747);
  static const identityCardBusinessFooter = Color(0xff2B2B2B);

  static const paymentCardPersonal = Color(0xff009AF1);
  static const paymentCardPersonalWallet = Color(0xff17499D);
  static const paymentCardBusiness = Color(0xff0B920B);

  static const walletCardIndianaBackground = Color(0xff4285F4);
  static const walletCardIndianaUserMail = Color(0xff7FCAFF);

  static const walletCardGaryBackground = Color(0xff0B920B);
  static const walletCardGaryUserMail = Color(0xffB3EAB3);

  static const walletCardBritainBackground = Color(0xffEB1878);
  static const walletCardBritainUserMail = Color(0xffFFB7D8);
}

@immutable
class ZigHotelsColors extends ThemeExtension<ZigHotelsColors> {
  const ZigHotelsColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.background,
    required this.onBackground,
    required this.border,
    required this.disabled,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.unboxCity,
    required this.unboxLitter,
    required this.unboxGrants,
    required this.unboxEducation,
    required this.unboxPrivacyMoney,
    required this.unboxWellBeing,
    required this.unboxSupplyChain,
    required this.unboxTourism,
    required this.unboxHumanDAID,
  });

  final Color primary;
  final Color onPrimary;

  final Color secondary;
  final Color onSecondary;

  final Color surface;
  final Color onSurface;

  final Color surfaceVariant;
  final Color onSurfaceVariant;

  final Color background;
  final Color onBackground;

  final Color border;

  final Color disabled;

  final Color error;
  final Color onError;

  final Color errorContainer;
  final Color onErrorContainer;

  final Color success;
  final Color onSuccess;

  final Color successContainer;
  final Color onSuccessContainer;

  final Color unboxCity;
  final Color unboxLitter;
  final Color unboxGrants;
  final Color unboxEducation;
  final Color unboxPrivacyMoney;
  final Color unboxWellBeing;
  final Color unboxSupplyChain;
  final Color unboxTourism;
  final Color unboxHumanDAID;

  @override
  ZigHotelsColors copyWith() {
    // We don't use copyWith for the moment
    // Colors are not well defined enough to maintain this
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ZigHotelsColors> lerp(
    ThemeExtension<ZigHotelsColors>? other,
    double t,
  ) {
    // We don't use colors lerp for the moment
    // Colors are not well defined enough to maintain this
    if (other == null) return this;
    return t < .5 ? this : other;
  }
}

ZigHotelsColors zigHotelsColorsExtension = const ZigHotelsColors(
  primary: Color(0xff641FE3),
  onPrimary: Color(0xffFFFFFF),
  secondary: Color(0xff6B3BC7),
  onSecondary: Color(0xffFFFFFF),
  surface: Color(0xffFFFFFF),
  onSurface: Color(0xff000000),
  onSurfaceVariant: Color(0xffB3B3B3),
  background: Color(0xffFFFFFF),
  onBackground: Color(0xff000000),
  border: Color(0xffD9D9D9),
  error: Color(0xffBE2845),
  onError: Color(0xffFFFFFF),
  errorContainer: Color(0xffF9DEDC),
  onErrorContainer: Color(0xff410E0B),
  success: Color(0xff0B920B),
  onSuccess: Color(0xffFFFFFF),
  successContainer: Color(0xffB3EAB3),
  onSuccessContainer: Color(0xff008b00),
  unboxCity: Color(0xff50C120),
  unboxLitter: Color(0xffEB1878),
  unboxGrants: Color(0xff3577E5),
  unboxEducation: Color(0xffC80000),
  unboxPrivacyMoney: Color(0xff3F578E),
  unboxWellBeing: Color(0xff00B6A0),
  unboxSupplyChain: Color(0xff553D07),
  unboxTourism: Color(0xffCF5843),
  unboxHumanDAID: Color(0xff3FAD5E),
  surfaceVariant: Color(0xffF3F3F3),
  disabled: Color(0xffDADADA),
);

extension ZigHotelsColorsExtensions on ThemeData {
  ZigHotelsColors get zigHotelsColors => extension<ZigHotelsColors>()!;
}
