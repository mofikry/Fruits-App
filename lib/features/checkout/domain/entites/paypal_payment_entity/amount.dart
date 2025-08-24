import 'package:fruit_hup/core/helper_function/get_currency.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/domain/entites/paypal_payment_entity/details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderInputEntity entity) {
    return Amount(
      total: entity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    );
  }

  toJson() => {
        'total': total,
        'currency': currency,
        'details': details!.toJson(),
      };
}
