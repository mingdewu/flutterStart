import 'dart:async';

import 'package:book_flutter_7_async/repository/count_repository.dart';

import 'loading_bloc.dart';

class CounterBloc {
  final CountRepository _repository;
  final LoadingBloc _loadingBloc;
  final _valueController = StreamController<int>();

  Stream<int> get value => _valueController.stream;
  int _counter = 0;

  CounterBloc(this._repository, this._loadingBloc) {
    _valueController.sink.add(_counter);
  }

  void incrementCounter() async {
    _loadingBloc.loading(isLoading: true);
    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingBloc.loading(isLoading: false);
    });
    _counter += increaseCount;
    _valueController.sink.add(_counter);
  }

  void dispose() {
    _valueController.close();
  }
}