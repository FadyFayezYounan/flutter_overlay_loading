import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ContainerWithTextIndicatorStyleWidget extends StatelessWidget {
  /// Widget for displaying a container with an indicator inside
  const ContainerWithTextIndicatorStyleWidget({
    Key? key,
    this.indicatorColor,
    this.containerColor,
    required this.containerRadius,
    required this.indicatorSize,
    this.indicatorBackgroundColor,
    this.strokeCap,
    required this.strokeWidth,
    required this.width,
    required this.height,
    this.indicatorBuilder,
    required this.text,
    this.loadingTextStyle,
  }) : super(key: key);

  /// Color of the indicator
  final Color? indicatorColor;

  /// Color of the container
  final Color? containerColor;

  /// Radius of the container
  final double containerRadius;

  /// Size of the indicator
  final double indicatorSize;

  /// Background color of the indicator
  final Color? indicatorBackgroundColor;

  /// Stroke cap of the indicator
  final StrokeCap? strokeCap;

  /// Stroke width of the indicator
  final double strokeWidth;

  /// Width of the container.
  final double width;

  /// Height of the container.
  final double height;

  /// Builder for the indicator
  final WidgetBuilder? indicatorBuilder;

  /// Text to display in the container
  final String text;

  /// Text style for the text
  final TextStyle? loadingTextStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: containerColor ?? kIndicatorContainerColor,
          borderRadius: BorderRadius.circular(containerRadius),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: width,
            minHeight: height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: indicatorSize,
                height: indicatorSize,
                child: indicatorBuilder?.call(context) ??
                    CircularProgressIndicator(
                      color: indicatorColor,
                      backgroundColor: indicatorBackgroundColor,
                      strokeWidth: strokeWidth,
                      strokeCap: strokeCap,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                style: loadingTextStyle ??
                    const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
