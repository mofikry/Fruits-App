import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/utils/backend_endpoint.dart';
import 'package:fruit_hup/features/checkout/data/model/order_model.dart';
import 'package:fruit_hup/features/checkout/domain/entites/paypal_payment_entity/order_entity.dart';

class OrderRepoImpl extends OrderRepo {
  final DatabaseServices _supabaseServices;
  OrderRepoImpl(this._supabaseServices);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      final orderModel = OrderModel.fromEntity(order);
      final data = orderModel.toJson();
      log('Data being sent to addOrder: $data'); // تتبع البيانات
      log('Path used: ${BackendEndpoint.addOrder}'); // تتبع المسار
      await _supabaseServices.addData(
        path: BackendEndpoint.addOrder,
        documantUId: orderModel.uId,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
