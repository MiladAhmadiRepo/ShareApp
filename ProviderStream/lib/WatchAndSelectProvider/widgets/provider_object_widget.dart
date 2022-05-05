import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/expensive_object.dart';
import 'package:provider_stream/WatchAndSelectProvider/provider/object_provider.dart';

class ProviderObjectWidget extends StatelessWidget {
  const ProviderObjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerObject=context.watch<ObjectProvider>();
    return Container(
      color: Colors.green,
      height: 100,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('provider object'),
          Text('id'),
          Text(providerObject.id),
        ],
      ),
    );
  }
}
