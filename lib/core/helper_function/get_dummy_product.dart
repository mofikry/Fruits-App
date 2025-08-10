import 'package:fruit_hup/core/entities/prodact_entites.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'name',
    description: 'description',
    urlImage: null,
    code: 123,
    price: 0,
    isFeature: false,
    expirationDate: 6,
    numberOfCalories: 0,
    unitAmount: 0,
    isOrganic: false,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
