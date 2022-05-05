import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/MultiAndStreamProvider/model/seconds.dart';

class SecondsWidget extends StatelessWidget {
  const SecondsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seconds=context.watch<Seconds>();
    return Container(
      color: Colors.blue,
      height: 100,
      child: Column(
        children: <Widget>[
          Text(seconds.value),
        ],
      ),
    );
  }
}
