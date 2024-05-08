import 'package:flutter/material.dart';

import '../overlay_loading.dart';
import 'overlay_entry.dart';

class OverlayLoadingBuilder extends StatefulWidget {
  /// Widget for building overlay with loading indicator
  const OverlayLoadingBuilder({
    super.key,
    this.child,
  });

  /// The child widget to display in the overlay
  final Widget? child;

  @override
  State<OverlayLoadingBuilder> createState() => _OverlayLoadingBuilderState();
}

class _OverlayLoadingBuilderState extends State<OverlayLoadingBuilder> {
  late final OverlayLoadingOverlayEntry _overlayEntry;
  @override
  void initState() {
    super.initState();
    _overlayEntry = OverlayLoadingOverlayEntry(
      builder: (context) =>
          OverlayLoading.instance.indicator ?? const SizedBox.shrink(),
    );
    OverlayLoading.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          OverlayLoadingOverlayEntry(
            builder: (context) => widget.child ?? const SizedBox.shrink(),
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
