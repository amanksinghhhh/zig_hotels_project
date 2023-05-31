/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogoPng =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/app_logo.svg
  SvgGenImage get appLogoSvg => const SvgGenImage('assets/images/app_logo.svg');

  /// File path: assets/images/cancel_appointment.png
  AssetGenImage get cancelAppointment =>
      const AssetGenImage('assets/images/cancel_appointment.png');

  /// File path: assets/images/close_icon.svg
  SvgGenImage get closeIcon =>
      const SvgGenImage('assets/images/close_icon.svg');

  /// File path: assets/images/email.png
  AssetGenImage get email => const AssetGenImage('assets/images/email.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/hear_aboutus.png
  AssetGenImage get hearAboutus =>
      const AssetGenImage('assets/images/hear_aboutus.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/language.png
  AssetGenImage get language =>
      const AssetGenImage('assets/images/language.png');

  /// File path: assets/images/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/images/location.png');

  /// File path: assets/images/location_icon.svg
  SvgGenImage get locationIcon =>
      const SvgGenImage('assets/images/location_icon.svg');

  /// File path: assets/images/location_image.png
  AssetGenImage get locationImage =>
      const AssetGenImage('assets/images/location_image.png');

  /// File path: assets/images/more.png
  AssetGenImage get more => const AssetGenImage('assets/images/more.png');

  /// File path: assets/images/notifications.png
  AssetGenImage get notifications =>
      const AssetGenImage('assets/images/notifications.png');

  /// File path: assets/images/open_hr.png
  AssetGenImage get openHr => const AssetGenImage('assets/images/open_hr.png');

  /// File path: assets/images/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/phone.png');

  /// File path: assets/images/privacy_policy.png
  AssetGenImage get privacyPolicy =>
      const AssetGenImage('assets/images/privacy_policy.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/qr_code_blue.png
  AssetGenImage get qrCodeBlue =>
      const AssetGenImage('assets/images/qr_code_blue.png');

  /// File path: assets/images/qr_code_scanner.png
  AssetGenImage get qrCodeScanner =>
      const AssetGenImage('assets/images/qr_code_scanner.png');

  /// File path: assets/images/qr_code_scanner_grey.png
  AssetGenImage get qrCodeScannerGrey =>
      const AssetGenImage('assets/images/qr_code_scanner_grey.png');

  /// File path: assets/images/sample.jpeg
  AssetGenImage get sample => const AssetGenImage('assets/images/sample.jpeg');

  /// File path: assets/images/smartphone.png
  AssetGenImage get smartphone =>
      const AssetGenImage('assets/images/smartphone.png');

  /// File path: assets/images/terms_condition.png
  AssetGenImage get termsCondition =>
      const AssetGenImage('assets/images/terms_condition.png');

  /// File path: assets/images/tickets.png
  AssetGenImage get tickets => const AssetGenImage('assets/images/tickets.png');

  /// List of all assets
  List<dynamic> get values => [
        appIcon,
        appLogoPng,
        appLogoSvg,
        cancelAppointment,
        closeIcon,
        email,
        google,
        hearAboutus,
        home,
        language,
        location,
        locationIcon,
        locationImage,
        more,
        notifications,
        openHr,
        phone,
        privacyPolicy,
        profile,
        qrCodeBlue,
        qrCodeScanner,
        qrCodeScannerGrey,
        sample,
        smartphone,
        termsCondition,
        tickets
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/particles.json
  LottieGenImage get particles =>
      const LottieGenImage('assets/lottie/particles.json');

  /// List of all assets
  List<LottieGenImage> get values => [particles];
}

class MyAssets {
  MyAssets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package = 'my_assets',
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package = 'my_assets',
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/my_assets/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package = 'my_assets',
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/my_assets/$_assetName';
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package = 'my_assets',
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/my_assets/$_assetName';
}
