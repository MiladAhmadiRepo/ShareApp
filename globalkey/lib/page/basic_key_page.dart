import 'package:flutter/material.dart';
import 'package:key_global_example/main.dart';
import 'package:key_global_example/utils.dart';

class BasicKeyPage extends StatelessWidget {
  /// --1--
  //یک global key از توع کلاس state فرزندی که میخواهیم
  //به مقادیرش دسترسی داشته باشیم میسازیم
  final keyCounter = GlobalKey<_CounterWidgetState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          ///--2--
          //در زمان نمونه ساختن از کلاس فرزند کلید global
          // را به عتوان key به آن پاس میدهیم
          child: CounterWidget(key: keyCounter),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            ///--4--
            //حالا میتوان به وسیله کلید به
            //متغییرها و توابع در کلاس state فرزند دسترسی داشت
            final counter = keyCounter.currentState!.counter;

            keyCounter.currentState!.increment();
            final newCounter = keyCounter.currentState!.counter;

            Utils.showSnackBar(context,
                text: 'Counter: $counter -> $newCounter');
          },
        ),
      );
}

class CounterWidget extends StatefulWidget {
  ///--3--
  //در سازنده فرزند کلید global رو گرفته و به super
  //پاس میدهیم
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment() => setState(() => counter += 5);

  @override
  Widget build(BuildContext context) => Text(
        'Counter: $counter',
        style: TextStyle(fontSize: 32),
      );
}
