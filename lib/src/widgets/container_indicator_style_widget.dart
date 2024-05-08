import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ContainerIndicatorStyleWidget extends StatelessWidget {
  /// Widget for displaying a container with an indicator inside
  const ContainerIndicatorStyleWidget({
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
            maxWidth: width,
            maxHeight: height,
          ),
          child: Center(
            child: SizedBox(
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
          ),
        ),
      ),
    );
  }
}
