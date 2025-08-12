import 'package:fruit_hup/features/checkout/data/model/order_product_model.dart';
import 'package:fruit_hup/features/checkout/data/model/shipping_address_model.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';

class OrderModel {
  final double price;
  final String uId;
  final ShippingAdressModel shippingAdressModel;
  final List<OrderProductModel> orderProductModelList;
  final String payment;

  OrderModel({
    required this.payment,
    required this.price,
    required this.uId,
    required this.shippingAdressModel,
    required this.orderProductModelList,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
        payment: orderEntity.payWithCash! ? 'cash' : 'paypal',
        price: orderEntity.cartEntity.totalPrice(),
        uId: orderEntity.uId,
        shippingAdressModel:
            ShippingAdressModel.fromEntity(orderEntity.shippingAddressEntity),
        orderProductModelList: orderEntity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromEntity(
                  cartEntity: e,
                ))
            .toList(),
      );
  toJson() {
    return {
      'price': price,
      'uId': uId,
      'shippingAdressModel': shippingAdressModel.toJson(),
      'orderProductModelList':
          orderProductModelList.map((e) => e.toJson()).toList(),
      'payment': payment,
    };
  }
}
