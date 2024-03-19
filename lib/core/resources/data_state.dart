import 'package:dio/dio.dart';

abstract class DataState<T> {

  final T ? data;
  final DioException ? dioException;

  const DataState({this.data, this.dioException});
}

class DataLoading<T> extends DataState<T> {

  const DataLoading(T data) : super(data: data);
}

class DataSuccess<T> extends DataState<T> {

  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {

  const DataFailed(DioException dioException) : super(dioException: dioException);
}