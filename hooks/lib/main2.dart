import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
void main() {
  runApp(const MyApp());
}

/*
1-
  در مثال  دوم یک texteditorcontroller درست میکنیم
  در داخل hookwidget تا نیاز به
 مقدار دهی اولیهtexteditorcontroller نباشیم و
 از hook به جای آن استفاده کنیم
*/

/*-------------------------------------------------------*/
class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=useTextEditingController();
    //این بخش برای ست کردن hook و ساخت آن استفاده میشود
    // در این قسمت مقداری را نسبت به hook داده
    final text=useState('');
    useEffect((){
      controller.addListener(() {
        text.value=controller.text;
      });
    },[controller]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text( 'Home page'),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Text('you typing : ${text.value}'),
          ],
        ),
      ),
    );
  }
}


