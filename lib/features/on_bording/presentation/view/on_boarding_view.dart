import 'package:flutter/material.dart';
import 'package:fruit_hup/features/on_bording/presentation/view/widget/on_boardaing_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = 'onBordingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardaingViewBody(),
    );
  }
}
