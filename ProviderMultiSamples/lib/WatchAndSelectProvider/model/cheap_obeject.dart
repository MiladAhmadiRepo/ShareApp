
import 'package:flutter/material.dart';
import 'package:provider_stream/WatchAndSelectProvider/model/base_object.dart';

// @immutable
class CheapObject extends BaseObject{
  @override
  bool operator ==(covariant BaseObject other) {
    return id==other.id;
  }

  @override
  int get hashCode => id.hashCode;
}