import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';

part 'check_out_cubit_state.dart';

class AddOrderCubit extends Cubit<AddOrderCubitState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderCubitInitial());
  final OrderRepo orderRepo;
  void addOrder({required OrderEntity order}) async {
    emit(AddOrderCubitLoading());
    final result = await orderRepo.addOrder(order: order);
    result.fold((l) => emit(AddOrderCubitError(message: l.message)),
        (r) => emit(AddOrderCubitSuccess()));
  }
}
