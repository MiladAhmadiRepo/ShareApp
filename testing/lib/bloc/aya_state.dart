part of 'aya_cubit.dart';

enum DataStatus { initial, loading, success, failure }

extension DataStatusX on DataStatus {
  bool get isInitial => this == DataStatus.initial;
  bool get isLoading => this == DataStatus.loading;
  bool get isSuccess => this == DataStatus.success;
  bool get isFailure => this == DataStatus.failure;
}
class RemoteDataState {
  late DataStatus status;
  String? error;

  RemoteDataState({required this.status, this.error});
}

class AyaState extends RemoteDataState{
  AyaModel? ayaModel;
  AyaState({required DataStatus status,this.ayaModel,String? error}) : super(status: status,error: error);
}