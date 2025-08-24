import 'package:fruit_hup/core/services/supabase_auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo_impl.dart';
import 'package:fruit_hup/core/repo/prodact_repo.dart';
import 'package:fruit_hup/core/repo/prodact_repo_impl.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/services/supabase_services.dart';
import 'package:fruit_hup/features/auth/data/repo/auth_repo_implement.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<SupabaseAuthServices>(
      () => SupabaseAuthServices());
  getIt.registerLazySingleton<DatabaseServices>(() => SupabaseServices());
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        supabaseAuthServices: getIt<SupabaseAuthServices>(),
        databaseServices: getIt<DatabaseServices>(),
      ));
  getIt.registerLazySingleton<ProdactRepo>(
      () => ProdactRepoImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerLazySingleton<OrderRepo>(
      () => OrderRepoImpl(getIt<DatabaseServices>()));
}
