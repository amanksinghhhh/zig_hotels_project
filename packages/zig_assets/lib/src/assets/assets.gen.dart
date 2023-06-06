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

  /// File path: assets/images/arrow-long-left.svg
  SvgGenImage get arrowLongLeft =>
      const SvgGenImage('assets/images/arrow-long-left.svg');

  /// File path: assets/images/dashboard_background.png
  AssetGenImage get dashboardBackground =>
      const AssetGenImage('assets/images/dashboard_background.png');

  /// File path: assets/images/entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('assets/images/entertainment.png');

  /// File path: assets/images/extra_pillow.png
  AssetGenImage get extraPillow =>
      const AssetGenImage('assets/images/extra_pillow.png');

  /// File path: assets/images/gym.png
  AssetGenImage get gym => const AssetGenImage('assets/images/gym.png');

  /// File path: assets/images/heaven_bar.png
  AssetGenImage get heavenBar =>
      const AssetGenImage('assets/images/heaven_bar.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/indian_restaurant.png
  AssetGenImage get indianRestaurant =>
      const AssetGenImage('assets/images/indian_restaurant.png');

  /// File path: assets/images/italian_cafe.png
  AssetGenImage get italianCafe =>
      const AssetGenImage('assets/images/italian_cafe.png');

  /// File path: assets/images/laundry.png
  AssetGenImage get laundry => const AssetGenImage('assets/images/laundry.png');

  /// File path: assets/images/lobby_bar.png
  AssetGenImage get lobbyBar =>
      const AssetGenImage('assets/images/lobby_bar.png');

  /// File path: assets/images/login_background.png
  AssetGenImage get loginBackground =>
      const AssetGenImage('assets/images/login_background.png');

  /// File path: assets/images/luggage_services.png
  AssetGenImage get luggageServices =>
      const AssetGenImage('assets/images/luggage_services.png');

  /// File path: assets/images/massage_beauty.png
  AssetGenImage get massageBeauty =>
      const AssetGenImage('assets/images/massage_beauty.png');

  /// File path: assets/images/minibar_refil.png
  AssetGenImage get minibarRefil =>
      const AssetGenImage('assets/images/minibar_refil.png');

  /// File path: assets/images/more.png
  AssetGenImage get more => const AssetGenImage('assets/images/more.png');

  /// File path: assets/images/restuarrants.png
  AssetGenImage get restuarrants =>
      const AssetGenImage('assets/images/restuarrants.png');

  /// File path: assets/images/resturant.png
  AssetGenImage get resturant =>
      const AssetGenImage('assets/images/resturant.png');

  /// File path: assets/images/room_control.png
  AssetGenImage get roomControl =>
      const AssetGenImage('assets/images/room_control.png');

  /// File path: assets/images/room_dining.png
  AssetGenImage get roomDining =>
      const AssetGenImage('assets/images/room_dining.png');

  /// File path: assets/images/room_make_up.png
  AssetGenImage get roomMakeUp =>
      const AssetGenImage('assets/images/room_make_up.png');

  /// File path: assets/images/room_service.png
  AssetGenImage get roomService =>
      const AssetGenImage('assets/images/room_service.png');

  /// File path: assets/images/sauna.png
  AssetGenImage get sauna => const AssetGenImage('assets/images/sauna.png');

  /// File path: assets/images/spa.png
  AssetGenImage get spa => const AssetGenImage('assets/images/spa.png');

  /// File path: assets/images/spa_image.png
  AssetGenImage get spaImage =>
      const AssetGenImage('assets/images/spa_image.png');

  /// File path: assets/images/spa_ritual.png
  AssetGenImage get spaRitual =>
      const AssetGenImage('assets/images/spa_ritual.png');

  /// File path: assets/images/tray_removal.png
  AssetGenImage get trayRemoval =>
      const AssetGenImage('assets/images/tray_removal.png');

  /// File path: assets/images/where_to.png
  AssetGenImage get whereTo =>
      const AssetGenImage('assets/images/where_to.png');

  /// List of all assets
  List<dynamic> get values => [
        arrowLongLeft,
        dashboardBackground,
        entertainment,
        extraPillow,
        gym,
        heavenBar,
        home,
        indianRestaurant,
        italianCafe,
        laundry,
        lobbyBar,
        loginBackground,
        luggageServices,
        massageBeauty,
        minibarRefil,
        more,
        restuarrants,
        resturant,
        roomControl,
        roomDining,
        roomMakeUp,
        roomService,
        sauna,
        spa,
        spaImage,
        spaRitual,
        trayRemoval,
        whereTo
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/namaste.json
  LottieGenImage get namaste =>
      const LottieGenImage('assets/lottie/namaste.json');

  /// List of all assets
  List<LottieGenImage> get values => [namaste];
}

class ZigHotelsAssets {
  ZigHotelsAssets._();

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
    String? package = 'zig_assets',
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
    String? package = 'zig_assets',
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/zig_assets/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package = 'zig_assets',
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

  String get keyName => 'packages/zig_assets/$_assetName';
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
    String? package = 'zig_assets',
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

  String get keyName => 'packages/zig_assets/$_assetName';
}
