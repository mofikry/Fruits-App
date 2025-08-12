import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final int code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity({required CartItemEntity cartEntity}) {
    return OrderProductModel(
      name: cartEntity.productEntity.name,
      code: cartEntity.productEntity.code.toInt(),
      imageUrl: cartEntity.productEntity.urlImage!,
      price: cartEntity.productEntity.price.toDouble(),
      quantity: cartEntity.quantity,
    );
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
