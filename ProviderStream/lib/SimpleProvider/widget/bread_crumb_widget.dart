import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_stream/SimpleProvider/model/model.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumbs;

  const BreadCrumbWidget({Key? key, required this.breadCrumbs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map((breadCrumb) {
        return Text(
          breadCrumb.title,
          style: TextStyle(
              color: breadCrumb.isActive ? Colors.blue : Colors.black),
        );
      }).toList(),
    );
  }
}
