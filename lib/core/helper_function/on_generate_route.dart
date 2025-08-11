import 'package:flutter/material.dart';
import 'package:fruit_hup/features/auth/presentation/view/login_view.dart';
import 'package:fruit_hup/features/auth/presentation/view/signup.dart';
import 'package:fruit_hup/features/best_selling_fruit/presentation/best_selling_view.dart';
import 'package:fruit_hup/features/checkout/presentation/checkout_view.dart';
import 'package:fruit_hup/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/main_view.dart';
import 'package:fruit_hup/features/on_bording/presentation/view/on_boarding_view.dart';
import 'package:fruit_hup/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (contaxt) => const SplashView());
    case OnBordingView.routeName:
      return MaterialPageRoute(builder: (contaxt) => const OnBordingView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (contaxt) => const BestSellingView());

    case Signup.routeName:
      return MaterialPageRoute(builder: (contaxt) => const Signup());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (contaxt) => const LoginView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (contaxt) => const MainView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
          builder: (contaxt) => CheckoutView(
                cartEntity: settings.arguments as CartEntity,
              ));

    default:
      return MaterialPageRoute(builder: (constax) => const Scaffold());
  }
}
