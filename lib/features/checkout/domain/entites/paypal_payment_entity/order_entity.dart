import 'package:fruit_hup/features/checkout/domain/entites/shipping_adress_entity.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAdressEntity shippingAddressEntity;

  OrderEntity(
    this.cartEntity, {
    required this.uId,
    required this.shippingAddressEntity,
    this.payWithCash,
  });
}
