import 'package:flutter/material.dart';

import '../../flutter_overlay_loading.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class OverlayLoadingIndicator extends StatelessWidget {
  /// Widget for displaying a loading indicator overlay.
  const OverlayLoadingIndicator({
    super.key,
    required this.builder,
    required this.overlayPosition,
    required this.backgroundColor,
    required this.dismissOnTap,
    required this.allowUserInteraction,
    required this.indicatorStyle,
  }) : _ignoreWhen =
            dismissOnTap ? false : (allowUserInteraction ? true : false);

  /// Builder for the overlay loading indicator.
  final WidgetBuilder? builder;

  /// The position of the overlay loading indicator.
  final OverlayPosition overlayPosition;

  /// The background color of the overlay.
  final Color? backgroundColor;

  /// Whether the overlay should be dismissed on tap or not.
  final bool dismissOnTap;

  /// Whether user interaction should be allowed when the overlay is displayed.
  final bool allowUserInteraction;

  /// Whether to ignore user interaction based on dismissOnTap and allowUserInteraction.
  final bool _ignoreWhen;

  /// The style of the indicator.
  final IndicatorStyle indicatorStyle;

  @override
  Widget build(BuildContext context) {
    /// Returns a circular progress indicator that adapts to the platform.
    return Stack(
      alignment: switch (overlayPosition) {
        OverlayPosition.top => Alignment.topCenter,
        OverlayPosition.center => Alignment.center,
        OverlayPosition.bottom => Alignment.bottomCenter,
      },
      children: [
        builder?.call(context) ??
            _IndicatorWidgetFromIndicatorStyle(indicatorStyle),
        IgnorePointer(
          ignoring: _ignoreWhen,
          child: dismissOnTap
              ? GestureDetector(
                  onTap: _dismissOnTap,
                  child: _BackGroundColoredWidget(backgroundColor),
                )
              : _BackGroundColoredWidget(backgroundColor),
        ),
      ],
    );
  }

  // Dismisses the overlay on tap if dismissOnTap is true.
  void _dismissOnTap() async {
    if (dismissOnTap) {
      OverlayLoading.hide();
    }
  }
}

class _IndicatorWidgetFromIndicatorStyle extends StatelessWidget {
  const _IndicatorWidgetFromIndicatorStyle(this.style);
  final IndicatorStyle style;

  @override
  Widget build(BuildContext context) {
    return switch (style) {
      NormalIndicatorStyle(indicatorColor: final indicatorColor) =>
        CircularProgressIndicator(
          color: indicatorColor,
          backgroundColor: style.indicatorBackgroundColor,
          strokeWidth: style.strokeWidth,
          strokeCap: style.strokeCap,
        ),
      NormalAdaptiveIndicatorStyle() => CircularProgressIndicator.adaptive(
          backgroundColor: style.indicatorBackgroundColor,
          strokeWidth: style.strokeWidth,
          strokeCap: style.strokeCap,
        ),
      ContainerIndicatorStyle(
        indicatorColor: final indicatorColor,
        containerColor: final containerColor,
        containerRadius: final containerRadius,
        width: final width,
        height: final height,
        indicatorBuilder: final indicatorBuilder,
      ) =>
        ContainerIndicatorStyleWidget(
          indicatorColor: indicatorColor,
          containerColor: containerColor,
          containerRadius: containerRadius,
          indicatorSize: style.size,
          strokeWidth: style.strokeWidth,
          indicatorBackgroundColor: style.indicatorBackgroundColor,
          strokeCap: style.strokeCap,
          width: width,
          height: height,
          indicatorBuilder: indicatorBuilder,
        ),
      // TODO: Handle this case.
      ContainerWithTextIndicatorStyle(
        indicatorColor: final indicatorColor,
        containerColor: final containerColor,
        containerRadius: final containerRadius,
        width: final width,
        height: final height,
        indicatorBuilder: final indicatorBuilder,
        text: final text,
        loadingTextStyle: final loadingTextStyle,
      ) =>
        ContainerWithTextIndicatorStyleWidget(
          indicatorColor: indicatorColor,
          containerColor: containerColor,
          containerRadius: containerRadius,
          indicatorSize: style.size,
          strokeWidth: style.strokeWidth,
          indicatorBackgroundColor: style.indicatorBackgroundColor,
          strokeCap: style.strokeCap,
          width: width,
          height: height,
          indicatorBuilder: indicatorBuilder,
          text: text,
          loadingTextStyle: loadingTextStyle,
        ),
    };
  }
}

class _BackGroundColoredWidget extends StatelessWidget {
  /// Widget that creates a colored background
  const _BackGroundColoredWidget(this.color);

  /// [Color] for the background for the overlay
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      // Use the default kBackgroundColor if no color is provided
      child: ColoredBox(
        color: color ?? kBackgroundColor,
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// import '../../flutter_overlay_loading.dart';
// import '../utils/utils.dart';

// class OverlayLoadingIndicator extends StatelessWidget {
//   /// Widget for displaying a loading indicator overlay.
//   const OverlayLoadingIndicator({
//     super.key,
//     required this.builder,
//     required this.overlayPosition,
//     required this.backgroundColor,
//     required this.dismissOnTap,
//     required this.allowUserInteraction,
//     required this.indicatorStyle,
//   }) : _ignoreWhen =
//             dismissOnTap ? false : (allowUserInteraction ? true : false);

//   /// Builder for the overlay loading indicator.
//   final WidgetBuilder? builder;

//   /// The position of the overlay loading indicator.
//   final OverlayPosition overlayPosition;

//   /// The background color of the overlay.
//   final Color? backgroundColor;

//   /// Whether the overlay should be dismissed on tap or not.
//   final bool dismissOnTap;

//   /// Whether user interaction should be allowed when the overlay is displayed.
//   final bool allowUserInteraction;

//   /// Whether to ignore user interaction based on dismissOnTap and allowUserInteraction.
//   final bool _ignoreWhen;

//   final IndicatorStyle indicatorStyle;

//   @override
//   Widget build(BuildContext context) {
//     /// Returns a circular progress indicator that adapts to the platform.
//     return Stack(
//       alignment: switch (overlayPosition) {
//         OverlayPosition.top => Alignment.topCenter,
//         OverlayPosition.center => Alignment.center,
//         OverlayPosition.bottom => Alignment.bottomCenter,
//       },
//       children: [
//         builder?.call(context) ??
//             const CircularProgressIndicator.adaptive(
//               backgroundColor: kBackgroundColor,
//             ),
//         IgnorePointer(
//           ignoring: _ignoreWhen,
//           child: dismissOnTap
//               ? GestureDetector(
//                   onTap: _dismissOnTap,
//                   child: _BackGroundColoredWidget(backgroundColor),
//                 )
//               : _BackGroundColoredWidget(backgroundColor),
//         ),
//       ],
//     );
//   }

//   // Dismisses the overlay on tap if dismissOnTap is true.
//   void _dismissOnTap() async {
//     if (dismissOnTap) {
//       OverlayLoading.hide();
//     }
//   }
// }

// class _IndicatorWidgetFromIndicatorStyle extends StatelessWidget {
//   const _IndicatorWidgetFromIndicatorStyle(this.indicatorStyle);
//   final IndicatorStyle indicatorStyle;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class _BackGroundColoredWidget extends StatelessWidget {
//   /// Widget that creates a colored background
//   const _BackGroundColoredWidget(this.color);

//   /// [Color] for the background for the overlay
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: double.infinity,
//       // Use the default kBackgroundColor if no color is provided
//       child: ColoredBox(
//         color: color ?? kBackgroundColor,
//       ),
//     );
//   }
// }
