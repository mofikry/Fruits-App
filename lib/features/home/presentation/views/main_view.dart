import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/home/presentation/cubit/cart_cubit/cart_cubit_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/custom_navigation_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widget/main_view_body_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'mainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;

            setState(() {});
          },
        ),
        body: SafeArea(
            child: MainViewBodyBloc(currentViewIndex: currentViewIndex)),
      ),
    );
  }
}
