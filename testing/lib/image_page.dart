import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("size-box"),
      body: Center(
          child: SizedBox(
              width: 200,
              height: 300,
              child: Image.asset("assets/first.jpg"))
      ),
    );
  }
}
