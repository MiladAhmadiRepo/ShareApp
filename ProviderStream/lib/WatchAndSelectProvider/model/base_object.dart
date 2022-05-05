import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class BaseObject{
  final String id;
  final String lastUpdated;

  BaseObject():id=Uuid().v4(),lastUpdated=DateTime.now().toIso8601String();

  @override
  bool operator ==(covariant BaseObject other) {
    return id==other.id;
  }

  @override
  int get hashCode => id.hashCode;
}