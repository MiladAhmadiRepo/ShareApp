import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/MultiAndProxyProvider/model/minutes.dart';
import 'package:provider_stream/MultiAndProxyProvider/model/seconds.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/cheap_obeject.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/expensive_object.dart';
import 'package:provider_stream/WatchAndSelectProvider/provider/object_provider.dart';

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
