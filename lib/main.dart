import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hup/core/helper_function/on_generate_route.dart';
import 'package:fruit_hup/core/services/custom_bloc_observer.dart';
import 'package:fruit_hup/core/services/get_it.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/features/splash/presentation/view/splash_view.dart';
import 'package:fruit_hup/firebase_options.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  await Supabase.initialize(
    url: 'https://inzeylarwroabotcpadi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImluemV5bGFyd3JvYWJvdGNwYWRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTExMDcwMzQsImV4cCI6MjA2NjY4MzAzNH0.Nj4mw160HGd8b0yiVYiBxZg1zy7cqLKpj46kdN9KRhk',
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FuritHup());
}

class FuritHup extends StatelessWidget {
  const FuritHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale("ar"),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
