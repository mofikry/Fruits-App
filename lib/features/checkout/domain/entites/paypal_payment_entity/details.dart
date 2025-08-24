import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(OrderInputEntity entity) => DetailsEntity(
        subtotal: entity.cartEntity.totalPrice().toString(),
        shipping: entity.calculateShippingCost().toString(),
        shippingDiscount: entity.calcualteShippingDiscount(),
      );
}
