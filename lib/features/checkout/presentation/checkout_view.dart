import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_function/get_user.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hup/core/services/get_it.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_body.dart';
import 'package:fruit_hup/features/checkout/domain/entites/paypal_payment_entity/order_entity.dart';
import 'package:fruit_hup/features/checkout/domain/entites/shipping_adress_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/cubit/check_out_cubit_cubit.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/checkout_view_body.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrderRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider.value(
            value: OrderEntity(
              shippingAddressEntity: ShippingAdressEntity(),
              uId: getUser().id,
              cartEntity,
            ),
            child: CheckoutViewBody()),
      ),
    );
  }
}
