import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/feature_item.dart';

class FeatureListItem extends StatelessWidget {
  const FeatureListItem({super.key});

  @override
  Widget build(BuildContext context) {
    const itemCount = 4;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemCount, (index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 8,
              right: index == itemCount - 1 ? 0 : 0,
            ),
            child: const FeatureItem(),
          );
        }),
      ),
    );
  }
}
