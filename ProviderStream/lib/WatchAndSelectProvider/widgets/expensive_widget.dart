import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/expensive_object.dart';
import 'package:provider_stream/WatchAndSelectProvider/provider/object_provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expensiveObject=context.select<ObjectProvider, ExpensiveObject>(
      (provider) => provider.expensiveObject,
    );
    return Container(
      color: Colors.yellow,
      height: 100,
      child: Column(
        children: <Widget>[
          Text('expensive object'),
          Text('last update'),
          Text(expensiveObject.lastUpdated),
        ],
      ),
    );
  }
}
