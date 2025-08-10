import 'package:equatable/equatable.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  double totalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  bool isExist(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return item;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ProductEntity];
}
