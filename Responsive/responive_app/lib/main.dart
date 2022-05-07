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
            //
            // از ۳۵۰ تا ۶۰۰ ریسایز میشه
            // از ۶۰۰ تا ۱۰۰۰ اسکیل میشه
            // از ۱۰۰۰ به بالا ریسایز میشه ولی اگر ضریب رو مقدار ندیم حاصل کوچیک میشه انگار گفتیم که
            // مقادیر اولیه رو ۱.۵ برابر کن بعد شروع به ریسایز کن
            //
            ///
            /// from 350 to 600 the app resizing
            /// from 600 to 1000 the app ui will scale (increase size of widget in width and height)
            /// and etc
            ///

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
