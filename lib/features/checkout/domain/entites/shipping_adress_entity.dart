import 'package:fruit_hup/generated/l10n.dart';

class ShippingAdressEntity {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;

  String? floor;

  ShippingAdressEntity({
    this.floor,
    this.city,
    this.email,
    this.name,
    this.address,
    this.phone,
  });
  @override
  String toString() {
    return ' $floor  $address $city';
  }
}
