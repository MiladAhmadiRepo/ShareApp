abstract class UseCase<T,P> {
  Future<T> getData({required P params});
}

class DataUseCase implements UseCase<String,int>{
  @override
  Future<String> getData({required int params}) {
    return Future.delayed(Duration(seconds: 0),(){
      return 'data is $params';
    });
  }
}

final dataUseCase=DataUseCase();
final data =dataUseCase(12);

abstract class UseCase<T,P> {
  Future<T> getData({required P params});
}

class DataUseCase implements UseCase<String,int>{
  @override
  Future<String> getData({required int params}) {
    return Future.delayed(Duration(seconds: 0),(){
      return 'data is $params';
    });
  }
}

final dataUseCase=DataUseCase();
final data =dataUseCase(12);