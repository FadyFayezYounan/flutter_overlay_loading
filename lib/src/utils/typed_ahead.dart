import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_overlay_loading/src/utils/utils.dart';

/// Callback function for overlay initialization
typedef OverlayInitializationCallBack = Widget Function(
  BuildContext context,
  Widget? child,
);

/// Callback for overlay loading status.
typedef OverlayLoadingStatusCallback = void Function(
  OverlayLoadingStatus loadingStatus,
);
