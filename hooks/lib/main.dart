import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
void main() {
  runApp(const MyApp());
}

/*
1-
  در مثال اول یک استریم درست میکنیم
  که هر یک ثانیه مقدار appbar
 با مقداری که از زمان جاری سیستم اپدیت میکند
*/

Stream<String> getTime()
{
  return Stream.periodic(Duration(seconds: 1),(_)=>DateTime.now().toIso8601String());
}
/*-------------------------------------------------------*/
class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime=useStream(getTime());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(dateTime.data??'Home page'),
        ),
      ),
    );
  }
}


