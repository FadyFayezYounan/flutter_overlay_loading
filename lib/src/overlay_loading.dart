import 'package:flutter/material.dart'
    show Widget, BuildContext, WidgetBuilder, Color;

import 'utils/utils.dart';
import 'widgets/widgets.dart';

/// Singleton class for managing and displaying overlay loading indicators.
///
/// This class provides methods to show and hide overlay loading indicators
/// and ensures that only one instance of the overlay is created, making it
/// accessible across the application.
///
/// Usage:
/// In your material app, import the [OverlayLoading] class and use it like so:
/// ``` dart
/// import 'package:overlay_loading/overlay_loading.dart';
///
/// MaterialApp(
///   builder: OverlayLoading.ensureInitialize(),
/// );
/// ```
/// then use it like so:
/// ```dart
/// await OverlayLoading.show(
///   builder: (BuildContext context) {
///     // Build your custom loading indicator here or use the default one
///   },
///   dismissOnTap: true,
///   overlayPosition: OverlayPosition.center,
///   backgroundColor: Colors.black.withOpacity(0.5),
/// );
///
/// // Hide the overlay loading indicator
/// await OverlayLoading.hide();
/// ```
final class OverlayLoading {
  static OverlayLoading? _instance;

  /// Private constructor for OverlayLoading.
  OverlayLoading._internal();

  /// Returns the instance of OverlayLoading.
  static OverlayLoading get instance {
    _instance ??= OverlayLoading._internal();
    return _instance!;
  }

  /// A callback function to ensure the initialization of the overlay.
  ///
  /// Returns an [OverlayInitializationCallBack] with an optional [builder] parameter.
  static OverlayInitializationCallBack ensureInitialize({
    OverlayInitializationCallBack? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, OverlayLoadingBuilder(child: child));
      } else {
        return OverlayLoadingBuilder(child: child);
      }
    };
  }

  /// Whether user interaction should be allowed when the overlay is displayed.
  bool? allowUserInterAction;

  /// The background color of the overlay.
  Color? backgroundColor;

  // Nullable widget indicator
  Widget? _indicator;

  /// Getter for the indicator
  Widget? get indicator => _indicator;

  /// The style of the indicator.
  IndicatorStyle indicatorStyle = const IndicatorStyle.normal();

  /// This entry is used to show the overlay loading indicator.
  OverlayLoadingOverlayEntry? overlayEntry;

  OverlayLoadingStatus? _status;

  /// Getter for the status of the overlay loading.
  OverlayLoadingStatus? get status => _status;

  OverlayLoadingStatusCallback? _statusCallback;

  /// **onStatusChanged**
  /// Sets a callback function to be invoked when the status of the OverlayLoading changes.
  ///
  /// **Example:**
  /// ```dart
  /// OverlayLoading.instance.onStatusChanged((status) {
  ///   print("Status changed: $status");
  /// });
  static void onStatusChanged(OverlayLoadingStatusCallback callback) {
    _instance?._statusCallback = callback;
  }

  void _changeStatus(OverlayLoadingStatus status) {
    _status = status;
    _statusCallback?.call(status);
  }

  /// Show an overlay with the provided parameters.
  ///
  /// Parameters:
  /// - builder: The widget builder for the overlay.
  /// - dismissOnTap: Whether the overlay should be dismissed on tap.
  /// - overlayPosition: The position of the overlay.
  /// - backgroundColor: The background color of the overlay.
  ///
  /// Returns a Future that completes when the overlay is shown.
  static void show({
    WidgetBuilder? builder,
    bool dismissOnTap = false,
    OverlayPosition overlayPosition = OverlayPosition.center,
  }) {
    return _instance?._show(
      builder: builder,
      dismissOnTap: dismissOnTap,
      overlayPosition: overlayPosition,
      backgroundColor: _instance?.backgroundColor,
      allowUserInteraction: _instance?.allowUserInterAction ?? false,
    );
  }

  void _show({
    WidgetBuilder? builder,
    OverlayPosition overlayPosition = OverlayPosition.center,
    Color? backgroundColor,
    required bool dismissOnTap,
    required bool allowUserInteraction,
  }) {
    assert(
      overlayEntry != null,
      'You should call OverlayLoading.ensureInitialize() in your MaterialApp',
    );
    _indicator = OverlayLoadingIndicator(
      overlayPosition: overlayPosition,
      builder: builder,
      backgroundColor: backgroundColor,
      dismissOnTap: dismissOnTap,
      allowUserInteraction: allowUserInteraction,
      indicatorStyle:
          _instance?.indicatorStyle ?? const IndicatorStyle.normal(),
    );
    _changeStatus(OverlayLoadingStatus.visible);
    _overlayMarkNeedsBuild();
  }

  /// Hides the overlay loading.
  static void hide() {
    return _instance?._hide();
  }

  /// Hides the overlay and resets the indicator and loading status.
  void _hide() {
    _instance?._reset();
  }

  /// Resets the indicator, triggers the overlay to rebuild, and appends the loading status.
  void _reset() {
    _indicator = null;
    _overlayMarkNeedsBuild();
    _changeStatus(OverlayLoadingStatus.hidden);
  }

  /// Marks the overlay as needing to rebuild.
  void _overlayMarkNeedsBuild() {
    return overlayEntry?.markNeedsBuild();
  }
}
