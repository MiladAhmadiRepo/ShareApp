import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP,scaleFactor: 1.5),
          ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
