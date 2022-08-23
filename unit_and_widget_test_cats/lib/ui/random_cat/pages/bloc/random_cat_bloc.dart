import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'random_cat_event.dart';
part 'random_cat_state.dart';

class RandomCatBloc extends Bloc<RandomCatEvent, RandomCatState> {
  RandomCatBloc() : super(RandomCatInitial()) {
    on<RandomCatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
