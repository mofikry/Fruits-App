part of 'check_out_cubit_cubit.dart';

sealed class AddOrderCubitState extends Equatable {
  const AddOrderCubitState();

  @override
  List<Object> get props => [];
}

final class AddOrderCubitInitial extends AddOrderCubitState {}

final class AddOrderCubitLoading extends AddOrderCubitState {}

final class AddOrderCubitError extends AddOrderCubitState {
  final String message;
  const AddOrderCubitError({required this.message});
}

final class AddOrderCubitSuccess extends AddOrderCubitState {}
