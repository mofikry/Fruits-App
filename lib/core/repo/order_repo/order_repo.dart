import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
}
