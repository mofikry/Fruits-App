class ShippingAdressEntity {
  final String? name;
  final String? address;
  final String? phone;
  final String? city;
  final String? email;
  final String? addressDetails;

  ShippingAdressEntity(
    this.city,
    this.email,
    this.addressDetails, {
    this.name,
    this.address,
    this.phone,
  });
}
