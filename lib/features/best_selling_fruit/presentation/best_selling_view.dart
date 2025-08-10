import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widget/custom_app_bar_body.dart';

import 'package:fruit_hup/features/best_selling_fruit/presentation/widget/best_selling_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الاكثر مبيعا',
        ),
        body: const BestSellingBody());
  }
}
