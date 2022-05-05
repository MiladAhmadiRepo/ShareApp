import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/MultiAndProxyProvider/model/minutes.dart';
import 'package:provider_stream/MultiAndProxyProvider/model/seconds.dart';
import 'package:provider_stream/MultiAndProxyProvider/widgets/minutes_widget.dart';
import 'package:provider_stream/MultiAndProxyProvider/widgets/seconds_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
            value: Stream<Seconds>.periodic(const Duration(seconds: 1), (_) => Seconds()),
            initialData: Seconds()),
        StreamProvider.value(
            value: Stream<Minutes>.periodic(const Duration(seconds: 5), (_) => Minutes()),
            initialData: Minutes()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(child: MinutesWidget()),
          Expanded(child: SecondsWidget()),
        ],
      ),
    );
  }
}
