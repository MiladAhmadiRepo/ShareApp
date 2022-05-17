import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';
import 'injection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(api: sl<Api>()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Api api;

  MyHomePage({required this.api});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _joke = '';
  bool _isLoading = false;
  late Api _api;

  @override
  void initState() {
    super.initState();
    _api = widget.api;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter test example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_joke, textAlign: TextAlign.center),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              key: ValueKey('getJokeButton'),
              onPressed: _getJoke,
              child: Text('Get Joke'),
            )
          ],
        ),
      ),
    );
  }

  void _getJoke() async {
    setState(() {
      _isLoading = true;
    });
    _joke = await _api.getRandomJoke();
    setState(() {
      _isLoading = false;
    });
  }
}