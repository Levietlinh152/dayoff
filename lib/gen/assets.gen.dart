/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/chat.svg
  String get chat => 'assets/icons/chat.svg';

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/google-plus.svg
  String get googlePlus => 'assets/icons/google-plus.svg';

  /// File path: assets/icons/login.svg
  String get login => 'assets/icons/login.svg';

  /// File path: assets/icons/signup.svg
  String get signup => 'assets/icons/signup.svg';

  /// File path: assets/icons/twitter.svg
  String get twitter => 'assets/icons/twitter.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/left_top.png
  AssetGenImage get leftTop =>
      const AssetGenImage('assets/images/left_top.png');

  /// File path: assets/images/left_top_pink.png
  AssetGenImage get leftTopPink =>
      const AssetGenImage('assets/images/left_top_pink.png');

  /// File path: assets/images/right_bottom.png
  AssetGenImage get rightBottom =>
      const AssetGenImage('assets/images/right_bottom.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
