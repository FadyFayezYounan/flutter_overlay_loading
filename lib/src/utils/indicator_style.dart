import 'dart:ui';

import 'package:flutter/material.dart';

import 'utils.dart';

sealed class IndicatorStyle {
  const IndicatorStyle({
    this.size = kIndicatorSize,
    this.indicatorBackgroundColor,
    this.strokeCap,
    this.strokeWidth = 4.0,
  });
  final Color? indicatorBackgroundColor;
  final StrokeCap? strokeCap;
  final double strokeWidth;
  final double size;

  const factory IndicatorStyle.normal({
    Color? indicatorColor,
    Color? indicatorBackgroundColor,
    StrokeCap? strokeCap,
    double strokeWidth,
  }) = NormalIndicatorStyle;

  const factory IndicatorStyle.normalAdaptive({
    Color? indicatorBackgroundColor,
    StrokeCap? strokeCap,
    double strokeWidth,
  }) = NormalAdaptiveIndicatorStyle;

  const factory IndicatorStyle.container({
    Color? indicatorColor,
    Color? containerColor,
    double containerRadius,
    Color? indicatorBackgroundColor,
    StrokeCap? strokeCap,
    double strokeWidth,
    double size,
    double width,
    double height,
    WidgetBuilder? indicatorBuilder,
  }) = ContainerIndicatorStyle;

  const factory IndicatorStyle.containerWithText({
    Color? indicatorColor,
    Color? containerColor,
    double containerRadius,
    Color? indicatorBackgroundColor,
    StrokeCap? strokeCap,
    double strokeWidth,
    double size,
    double width,
    double height,
    WidgetBuilder? indicatorBuilder,
    String text,
    TextStyle? loadingTextStyle,
  }) = ContainerWithTextIndicatorStyle;

  @override
  String toString() =>
      'IndicatorStyle(backgroundColor: $indicatorBackgroundColor, strokeCap: $strokeCap, strokeWidth: $strokeWidth)';

  @override
  int get hashCode => Object.hash(
        indicatorBackgroundColor,
        strokeCap,
        strokeWidth,
        size,
      );

  @override
  bool operator ==(Object other) =>
      other is IndicatorStyle && hashCode == other.hashCode;
}

final class NormalIndicatorStyle extends IndicatorStyle {
  const NormalIndicatorStyle({
    this.indicatorColor,
    super.indicatorBackgroundColor,
    super.strokeCap,
    super.strokeWidth,
    super.size,
  });
  final Color? indicatorColor;

  @override
  String toString() =>
      'NormalIndicatorStyle(indicatorColor: $indicatorColor, backgroundColor: $indicatorBackgroundColor, strokeCap: $strokeCap, strokeWidth: $strokeWidth)';

  @override
  int get hashCode => indicatorColor.hashCode;

  @override
  bool operator ==(Object other) =>
      other is NormalIndicatorStyle && identical(this, other) ||
      other is NormalIndicatorStyle &&
          runtimeType == other.runtimeType &&
          indicatorColor == other.indicatorColor;
}

final class NormalAdaptiveIndicatorStyle extends IndicatorStyle {
  const NormalAdaptiveIndicatorStyle({
    super.indicatorBackgroundColor,
    super.strokeCap,
    super.strokeWidth,
    super.size,
  });

  @override
  String toString() =>
      'NormalIndicatorStyle(backgroundColor: $indicatorBackgroundColor, strokeCap: $strokeCap, strokeWidth: $strokeWidth, size: $size)';
}

final class ContainerIndicatorStyle extends IndicatorStyle {
  const ContainerIndicatorStyle({
    this.indicatorColor,
    this.containerRadius = 4.0,
    this.containerColor,
    this.width = kIndicatorContainerSizes,
    this.height = kIndicatorContainerSizes,
    this.indicatorBuilder,
    super.indicatorBackgroundColor,
    super.strokeCap,
    super.strokeWidth,
    super.size,
  });
  final Color? indicatorColor;
  final Color? containerColor;
  final double containerRadius;
  final double width;
  final double height;
  final WidgetBuilder? indicatorBuilder;

  @override
  String toString() =>
      '''NormalIndicatorStyle(indicatorColor: $indicatorColor, containerColor: $containerColor, 
      strokeCap: $strokeCap, strokeWidth: $strokeWidth , indicatorBackgroundColor : $indicatorBackgroundColor, 
      containerRadius: $containerRadius, size: $size , width: $width,
      height: $height, indicatorBuilder: $indicatorBuilder)''';

  @override
  int get hashCode => Object.hash(
        indicatorColor,
        containerColor,
        containerRadius,
        width,
        height,
        indicatorBuilder,
        size,
      );

  @override
  bool operator ==(Object other) =>
      other is NormalIndicatorStyle && identical(this, other) ||
      other is NormalIndicatorStyle &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}

final class ContainerWithTextIndicatorStyle extends IndicatorStyle {
  const ContainerWithTextIndicatorStyle({
    this.indicatorColor,
    this.containerRadius = 4.0,
    this.containerColor,
    this.width = kIndicatorContainerSizes,
    this.height = kIndicatorContainerSizes,
    this.indicatorBuilder,
    super.indicatorBackgroundColor,
    super.strokeCap,
    super.strokeWidth,
    super.size,
    this.text = kLoadingText,
    this.loadingTextStyle,
  });
  final Color? indicatorColor;
  final Color? containerColor;
  final double containerRadius;
  final double width;
  final double height;
  final WidgetBuilder? indicatorBuilder;
  final String text;
  final TextStyle? loadingTextStyle;

  @override
  String toString() =>
      '''NormalIndicatorStyle(indicatorColor: $indicatorColor, containerColor: $containerColor, 
      strokeCap: $strokeCap, strokeWidth: $strokeWidth , indicatorBackgroundColor : $indicatorBackgroundColor, 
      containerRadius: $containerRadius, size: $size , width: $width,
      height: $height, indicatorBuilder: $indicatorBuilder text: $text, 
      loadingTextStyle: $loadingTextStyle)''';

  @override
  int get hashCode => Object.hash(
        indicatorColor,
        containerColor,
        containerRadius,
        width,
        height,
        indicatorBuilder,
        size,
        text,
        loadingTextStyle,
      );

  @override
  bool operator ==(Object other) =>
      other is NormalIndicatorStyle && identical(this, other) ||
      other is NormalIndicatorStyle &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;
}
