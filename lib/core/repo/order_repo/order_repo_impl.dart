import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/utils/backend_endpoint.dart';
import 'package:fruit_hup/features/checkout/data/model/order_model.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';

class OrderRepoImpl extends OrderRepo {
  final DatabaseServices _supabaseServices;
  OrderRepoImpl(this._supabaseServices);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      await _supabaseServices.addData(
          path: BackendEndpoint.addOrder,
          data: OrderModel.fromEntity(order).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
