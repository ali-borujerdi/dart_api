import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class ResponderUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class SilentUseCase<Params> {
  call(Params params);
}
