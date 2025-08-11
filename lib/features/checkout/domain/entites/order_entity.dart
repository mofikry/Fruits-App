import 'package:fruit_hup/features/checkout/domain/entites/shipping_adress_entity.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final bool? payWithCash;
  final ShippingAdressEntity? shippingAdress;

  OrderEntity(this.cartEntity, {this.payWithCash, this.shippingAdress});
}
