import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

// when api request is successful
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

// when an error has occured
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
