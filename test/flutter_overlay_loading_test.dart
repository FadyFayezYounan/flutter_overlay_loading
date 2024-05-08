import 'package:flutter/material.dart';
import 'package:flutter_overlay_loading/flutter_overlay_loading.dart';
import 'package:flutter_overlay_loading/src/widgets/loading_indicator.dart';
import 'package:flutter_overlay_loading/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OverlayLoading initialization', (WidgetTester tester) async {
    // Ensure that OverlayLoading is initialized properly
    await tester.pumpWidget(
      MaterialApp(
        builder: OverlayLoading.ensureInitialize(),
      ),
    );

    expect(OverlayLoading.instance, isNotNull);
  });

  testWidgets('OverlayLoading shows and hides the indicator', (tester) async {
    // Build the widget using the WidgetTester
    await tester.pumpWidget(
      MaterialApp(
        builder: OverlayLoading.ensureInitialize(),
      ),
    );

    // Verify that the indicator is not shown initially
    expect(find.byType(OverlayLoadingIndicator), findsNothing);

    // Show the overlay loading indicator
    OverlayLoading.show(
      builder: (context) => const CircularProgressIndicator(),
    );

    // Wait for the overlay to appear
    await tester.pump();

    // Verify that the indicator is shown
    expect(find.byType(OverlayLoadingIndicator), findsOneWidget);

    // Hide the overlay loading indicator
    OverlayLoading.hide();

    // Wait for the overlay to disappear
    await tester.pump();

    // Verify that the indicator is not shown anymore
    expect(find.byType(OverlayLoadingIndicator), findsNothing);
  });

  testWidgets('OverlayLoading should trigger status changes',
      (WidgetTester tester) async {
    // Build the widget using the WidgetTester
    await tester.pumpWidget(
      MaterialApp(
        builder: OverlayLoading.ensureInitialize(),
      ),
    );

    OverlayLoadingStatus? receivedStatus;

    OverlayLoading.onStatusChanged((status) => receivedStatus = status);

    OverlayLoading.show();

    // Wait for the overlay to disappear
    await tester.pump();

    // Ensure the status was updated to showing
    expect(receivedStatus, OverlayLoadingStatus.visible);

    OverlayLoading.hide();

    // Wait for the overlay to disappear
    await tester.pump();

    // Ensure the status was updated to hidden
    expect(receivedStatus, OverlayLoadingStatus.hidden);
  });
}
