import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/cheap_obeject.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/expensive_object.dart';
import 'package:uuid/uuid.dart';

class ObjectProvider extends ChangeNotifier {
  late String id;
  late CheapObject _cheapObject;
  late StreamSubscription _streamSubscriptionCheapObject;
  late ExpensiveObject _expensiveObject;
  late StreamSubscription _streamSubscriptionExpensiveObject;

  ObjectProvider()
      : id = Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject(){
    start();
  }

  CheapObject get cheapObject => _cheapObject;

  ExpensiveObject get expensiveObject => _expensiveObject;

  @override
  void notifyListeners(){
    id= const Uuid().v4();
    super.notifyListeners();
  }

  void start() {
    _streamSubscriptionCheapObject = Stream.periodic(Duration(seconds: 1)).listen((_) {
      _cheapObject = CheapObject();
      notifyListeners();
    });
    _streamSubscriptionExpensiveObject = Stream.periodic(Duration(seconds: 5)).listen((_) {
      _expensiveObject = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _streamSubscriptionExpensiveObject.cancel();
    _streamSubscriptionCheapObject.cancel();
  }
}
