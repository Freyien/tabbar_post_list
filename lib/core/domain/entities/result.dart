import 'package:equatable/equatable.dart';
import 'package:tabbar_post_list/core/domain/failures/failures.dart';

class Result<T> extends Equatable {
  const Result._({
    required this.status,
    this.data,
    this.failure,
  });

  final ResultStatus status;
  final T? data;
  final Failure? failure;

  factory Result.failed(Failure failure) => Result._(
        status: ResultStatus.failed,
        failure: failure,
      );

  factory Result.success(T data) => Result._(
        status: ResultStatus.success,
        data: data,
      );

  bool get isSuccess => status == ResultStatus.success;

  bool get isFailed => status == ResultStatus.failed;

  @override
  List<Object> get props => [status];
}

enum ResultStatus { success, failed }
