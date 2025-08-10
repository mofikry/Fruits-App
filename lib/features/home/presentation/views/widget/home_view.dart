import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/cubit/products_cubit/prodacts_cubit.dart';
import 'package:fruit_hup/core/repo/prodact_repo.dart';
import 'package:fruit_hup/core/services/get_it.dart';

import 'package:fruit_hup/features/home/presentation/views/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProdactRepo>(),
      ),
      child: HomeViewBoday(),
    );
  }
}
