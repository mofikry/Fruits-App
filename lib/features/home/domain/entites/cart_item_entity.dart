import 'package:equatable/equatable.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 0});

  num totalPrice() => productEntity.price * quantity;
  num totalWight() => productEntity.unitAmount * quantity;
  inCreaseCount() => quantity++;
  deCreaseCount() => quantity--;

  @override
  List<Object?> get props => [
        productEntity,
      ];
}
