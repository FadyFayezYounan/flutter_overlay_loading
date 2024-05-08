import 'package:flutter/material.dart' show OverlayEntry;
import 'package:flutter/scheduler.dart' show SchedulerBinding, SchedulerPhase;

class OverlayLoadingOverlayEntry extends OverlayEntry {
  /// This class is designed to create a custom overlay that displays loading content on top of the current screen.
  /// It ensures that the overlay is displayed and updated correctly within the Flutter framework's rendering process.
  OverlayLoadingOverlayEntry({required super.builder});

  @override
  void markNeedsBuild() {
    final binding = SchedulerBinding.instance;
    // This conditional check determines the current phase of the scheduler.
    if (binding.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      // If the scheduler is in the `persistentCallbacks` phase,
      // this line schedules a callback to be executed after the current frame has been rendered.
      // `The callback then calls super.markNeedsBuild() to ensure the overlay is rebuilt in a timely manner.
      binding.addPostFrameCallback((_) {
        super.markNeedsBuild();
      });
    } else {
      // If the scheduler is not in the `persistentCallbacks` phase, the super.markNeedsBuild() call is made directly.
      super.markNeedsBuild();
    }
  }
}
