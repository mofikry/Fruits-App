import 'package:fruit_hup/features/checkout/domain/entites/shipping_adress_entity.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';

class OrderInputEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAdressEntity shippingAddressEntity;
  OrderInputEntity(
    this.cartEntity, {
    this.payWithCash,
    required this.shippingAddressEntity,
    required this.uID,
  });

  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calcualteShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.totalPrice() +
        calculateShippingCost() -
        calcualteShippingDiscount();
  }

  @override
  String toString() {
    return 'OrderEntity{uID: $uID, cartEntity: $cartEntity, payWithCash: $payWithCash, shippingAddressEntity: $shippingAddressEntity}';
  }
}
