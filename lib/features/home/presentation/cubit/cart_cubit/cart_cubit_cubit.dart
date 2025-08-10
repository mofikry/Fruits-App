import 'package:bloc/bloc.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);

    if (isProductExist) {
      cartItem.inCreaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCartItem(carItem);
    emit(CartItemRemoved());
  }
}
