import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSec extends StatefulWidget {
  const ShippingSec({super.key});

  @override
  State<ShippingSec> createState() => _ShippingSecState();
}

class _ShippingSecState extends State<ShippingSec> {
  int seclectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: ('${context.read<OrderEntity>().cartEntity.totalPrice()}40'),
          isSelected: seclectedIndex == 0,
          onTap: () {
            seclectedIndex = 0;
            setState(() {});
          },
        ),
        const SizedBox(height: 8),
        ShippingItem(
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: context.read<OrderEntity>().cartEntity.totalPrice().toString(),
          isSelected: seclectedIndex == 1,
          onTap: () {
            seclectedIndex = 1;
            setState(() {});
          },
        )
      ],
    );
  }
}
