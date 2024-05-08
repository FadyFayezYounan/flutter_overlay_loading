import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loading/flutter_overlay_loading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: OverlayLoading.ensureInitialize(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Overlay Loading Demo 😊'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final NormalIndicatorStyle _indicatorStyle = NormalIndicatorStyle();
  final NormalIndicatorStyle _indicatorStyle2 = NormalIndicatorStyle();

  void _incrementCounter() async {
    log((_indicatorStyle == _indicatorStyle2).toString());
    OverlayLoading.onStatusChanged(
      (loadingStatus) {
        log(loadingStatus.toString());
      },
    );
    OverlayLoading.instance.indicatorStyle = IndicatorStyle.containerWithText(
      strokeCap: StrokeCap.round,
      indicatorColor: Colors.white,
      strokeWidth: 2.4,
      // indicatorBuilder: (context) => LoadingAnimationWidget.flickr(
      //   leftDotColor: Colors.tealAccent,
      //   rightDotColor: Colors.red,
      //   size: 24.0,
      // ),
      // indicatorBackgroundColor: Colors.red,
    );
    //log(OverlayLoading.instance.status.toString());
    OverlayLoading.show(
        // builder: (context) => Container(
        //   decoration: ShapeDecoration(
        //     color: Colors.black54,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(4.0),
        //     ),
        //   ),
        //   constraints: BoxConstraints(
        //     minWidth: 64.0,
        //     minHeight: 64.0,
        //   ),
        //   child:
        // LoadingAnimationWidget.flickr(
        //     leftDotColor: Colors.tealAccent,
        //     rightDotColor: Colors.red,
        //     size: 24.0,
        //   ),
        // ),
        );
    //log(OverlayLoading.instance.status.toString());
    await Future.delayed(Duration(seconds: 3));
    OverlayLoading.hide();
    //log(OverlayLoading.instance.status.toString());
  }

  void _incrementCounter2() async {
    OverlayLoading.onStatusChanged(
      (loadingStatus) {
        log(loadingStatus.toString());
      },
    );
    //OverlayLoading.instance.backgroundColor = Colors.teal.withOpacity(0.3);
    //log(OverlayLoading.instance.status.toString());
    OverlayLoading.show(
      builder: (context) => CircularProgressIndicator(
        color: Colors.teal,
      ),
    );
    //log(OverlayLoading.instance.status.toString());
    await Future.delayed(Duration(seconds: 3));
    OverlayLoading.hide();
    //log(OverlayLoading.instance.status.toString());
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Wrap(
          children: <Widget>[
            FilledButton(
              onPressed: _incrementCounter,
              child: Text("Example 1"),
            ),
            FilledButton(
              onPressed: _incrementCounter,
              child: Text("Example 2"),
            ),
            FilledButton(
              onPressed: _incrementCounter,
              child: Text("Example 3"),
            ),
            FilledButton(
              onPressed: _incrementCounter,
              child: Text("Example 4"),
            ),
            FilledButton(
              onPressed: _incrementCounter,
              child: Text("Example 5"),
            ),
            FilledButton(
              onPressed: _incrementCounter,
              child: Text("Example 6"),
            ),
          ],
        ),
      ),
    );
  }
}
