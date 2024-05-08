# Overlay Loading

A Flutter package for managing and displaying overlay loading indicators.

## Description

This package provides a singleton class `OverlayLoading` that allows you to show and hide overlay loading indicators across your application. You can customize the appearance and behavior of the overlay, such as the background color, the position, the dismiss option, and the loading indicator widget.

## Installation

To use this package, add `overlay_loading` as a dependency in your `pubspec.yaml` file.

```yml
dependencies:
  flutter_overlay_loading: ^0.0.1
```

## Features

- **Customizable Loading Indicator**: Easily build and customize your loading indicator or use the default one provided.
- **Dismiss on Tap**: Choose whether the overlay should be dismissed when tapped.
- **Background Color**: Set the background color of the overlay to fit your application's design.
- **Status Change Callback**: Set a callback function to be notified when the status of `OverlayLoading` changes.
- **Lightweight and Developer-Friendly**: The `overlay_loading` package is designed with simplicity in mind, offering clean and lightweight code. It's developer-friendly and won't burden your application with unnecessary complexity.
- Allows user interaction when the overlay is displayed

## Usage

In your material app, import the `OverlayLoading` class and use it like so:

```dart
import 'package:overlay_loading/overlay_loading.dart';

MaterialApp(
  builder: OverlayLoading.ensureInitialize(),
  home: MyApp(),
);
```

Then, you can show and hide the overlay loading indicator anywhere in your app by calling the OverlayLoading.show and OverlayLoading.hide methods. For example:

```dart
// Show the overlay loading indicator
OverlayLoading.show(
  builder: (BuildContext context) {
    // Build your custom loading indicator here or use the default one
  },
  dismissOnTap: true,
  overlayPosition: OverlayPosition.center,
  backgroundColor: Colors.black.withOpacity(0.5),
);

// Hide the overlay loading indicator
OverlayLoading.hide();
```

You can also listen to the status changes of the overlay loading by using the OverlayLoading.onStatusChanged method. For example:

```dart
OverlayLoading.onStatusChanged((status) {
  print("Status changed: $status");
});
```
