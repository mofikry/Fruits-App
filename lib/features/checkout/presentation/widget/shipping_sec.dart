import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/shipping_item.dart';

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
        SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40',
          isSelected: seclectedIndex == 0,
          onTap: () {
            seclectedIndex = 0;
            setState(() {});
          },
        ),
        SizedBox(height: 8),
        ShippingItem(
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
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
