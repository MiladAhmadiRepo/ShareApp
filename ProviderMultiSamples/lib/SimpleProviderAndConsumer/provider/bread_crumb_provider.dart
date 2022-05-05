import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_stream/SimpleProviderAndConsumer/model/model.dart';

class BreadCrumbProvider extends ChangeNotifier{
  final List<BreadCrumb> _items=[];
  UnmodifiableListView<BreadCrumb>get items=>UnmodifiableListView(_items);
  void add (BreadCrumb item)
  {
    for (var listItem in _items) {
      listItem.activate();
    }
    _items.add(item);
    notifyListeners();
  }
  void reset(){
      _items.clear();
      notifyListeners();
  }
}