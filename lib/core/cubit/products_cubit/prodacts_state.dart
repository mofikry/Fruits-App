part of 'prodacts_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProdactsInitial extends ProductsState {}

final class ProdactsLoading extends ProductsState {}

final class ProdactFailure extends ProductsState {
  final String message;
  ProdactFailure({required this.message});
}

final class ProdactsSuccess extends ProductsState {
  final List<ProductEntity> product;
  ProdactsSuccess({required this.product});
}
