import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/MultiAndStreamProvider/model/minutes.dart';

class MinutesWidget extends StatelessWidget {
  const MinutesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minutes=context.watch<Minutes>();
    return Container(
      color: Colors.yellow,
      height: 100,
      child: Column(
        children: <Widget>[
          Text(minutes.value),
        ],
      ),
    );
  }
}
