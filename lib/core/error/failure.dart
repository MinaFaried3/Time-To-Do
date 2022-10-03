import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String failureMessage;

  const Failure(this.failureMessage);

  @override
  List<Object> get props => [failureMessage];
}

class LocalFailure extends Failure {
  const LocalFailure(super.failureMessage);
}
