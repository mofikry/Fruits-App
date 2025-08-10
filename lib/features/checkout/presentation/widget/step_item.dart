import 'package:flutter/material.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/active_step_item.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.text,
      required this.index,
      required this.isActive});
  final String text;
  final String index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: InActiveStepItem(text: text, index: index),
      secondChild: ActiveStepItem(
        text: text,
      ),
    );
  }
}
