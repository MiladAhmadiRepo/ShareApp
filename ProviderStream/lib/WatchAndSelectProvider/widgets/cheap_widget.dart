import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/cheap_obeject.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/expensive_object.dart';
import 'package:provider_stream/WatchAndSelectProvider/provider/object_provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cheapObject=context.select<ObjectProvider, CheapObject>(
      (provider) => provider.cheapObject,
    );
    return Container(
      color: Colors.blue,
      height: 100,
      child: Column(
        children: <Widget>[
          Text('cheap object'),
          Text('last update'),
          Text(cheapObject.lastUpdated),
        ],
      ),
    );
  }
}
