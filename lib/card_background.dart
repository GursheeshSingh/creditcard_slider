import 'package:flutter/material.dart';

abstract class CardBackground {}

class SolidColorCardBackground extends CardBackground {
  final Color backgroundColor;
  SolidColorCardBackground(this.backgroundColor);
}

class GradientCardBackground extends CardBackground {
  final Gradient gradient;
  GradientCardBackground(this.gradient);
}

class ImageCardBackground extends CardBackground {
  final ImageProvider imageProvider;
  final BoxFit boxFit;

  ImageCardBackground(
    this.imageProvider, {
    this.boxFit = BoxFit.cover,
  });

  DecorationImage build() {
    return DecorationImage(
      image: imageProvider,
      fit: boxFit,
    );
  }
}
