import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/WatchAndSelectProvider/provider/object_provider.dart';
import 'package:provider_stream/WatchAndSelectProvider/widget/cheap_widget.dart';
import 'package:provider_stream/WatchAndSelectProvider/widget/expensive_widget.dart';
import 'package:provider_stream/WatchAndSelectProvider/widget/provider_object_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ObjectProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: "watch and select"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: CheapWidget()),
              Expanded(child: ExpensiveWidget()),
            ],
          ),
          ProviderObjectWidget(),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () {
                  context.read<ObjectProvider>().stop();
                },
                child: Text('stop'),
              )),
              Expanded(
                  child: TextButton(
                onPressed: () {
                  context.read<ObjectProvider>().start();
                },
                child: Text('start'),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
