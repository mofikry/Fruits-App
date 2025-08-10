part of 'signin_cubit_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;
  SigninSuccess(this.userEntity);
}

final class SigninError extends SigninState {
  final String message;
  SigninError(this.message);
}
