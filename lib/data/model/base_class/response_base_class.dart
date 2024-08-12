abstract class DataState<T, E> {
  final T? data;
  final E? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T, dynamic> {
  DataSuccess(T data) : super(data: data);
}

class DataFailure<E> extends DataState<dynamic, E> {
  DataFailure(E error) : super(error: error);
}
