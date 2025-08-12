import 'package:fruit_hup/features/checkout/domain/entites/shipping_adress_entity.dart';

class ShippingAdressModel {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;

  String? floor;

  ShippingAdressModel({
    this.floor,
    this.city,
    this.email,
    this.name,
    this.address,
    this.phone,
  });

  factory ShippingAdressModel.fromEntity(ShippingAdressEntity entity) =>
      ShippingAdressModel(
        floor: entity.floor,
        city: entity.city,
        email: entity.email,
        name: entity.name,
        address: entity.address,
        phone: entity.phone,
      );

  toJson() {
    return {
      'floor': floor,
      'city': city,
      'email': email,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return ' $floor  $address $city';
  }
}
