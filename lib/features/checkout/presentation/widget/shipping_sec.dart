import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSec extends StatefulWidget {
  const ShippingSec({super.key});

  @override
  State<ShippingSec> createState() => _ShippingSecState();
}

class _ShippingSecState extends State<ShippingSec>
    with AutomaticKeepAliveClientMixin {
  int seclectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        const SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: (orderEntity.cartEntity.totalPrice() + 40).toString(),
          isSelected: seclectedIndex == 0,
          onTap: () {
            seclectedIndex = 0;
            setState(() {});
            orderEntity.payWithCash = true;
          },
        ),
        const SizedBox(height: 8),
        ShippingItem(
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: orderEntity.cartEntity.totalPrice().toString(),
          isSelected: seclectedIndex == 1,
          onTap: () {
            seclectedIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
