# Overlay Loading Flutter Package

## Overview

The `overlay_loading` package is a Flutter library that provides a convenient way to manage and display overlay loading indicators. It ensures that only one instance of the overlay is created, making it easily accessible throughout your Flutter application.

## Usage

1. **Initialize the OverlayLoading in your MaterialApp:**

   ```dart
   import 'package:overlay_loading/overlay_loading.dart';

   MaterialApp(
     builder: OverlayLoading.ensureInitialize(),
     home: MyApp(),
   );
   ```

2. **Show and Hide Overlay Loading:**

   ```dart
   // Show the overlay loading indicator
   await OverlayLoading.show(
     builder: (BuildContext context) {
       // Build your custom loading indicator here or use the default one
     },
     dismissOnTap: true,
     overlayPosition: OverlayPosition.center,
     backgroundColor: Colors.black.withOpacity(0.5),
   );

   // Hide the overlay loading indicator
   await OverlayLoading.hide();
   ```

## Features

- **Singleton Instance**: Ensures that only one instance of the overlay is created and accessible throughout the application.
