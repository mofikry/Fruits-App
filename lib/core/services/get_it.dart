import 'package:fruit_hup/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hup/core/repo/order_repo/order_repo_impl.dart';
import 'package:fruit_hup/core/repo/prodact_repo.dart';
import 'package:fruit_hup/core/repo/prodact_repo_impl.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/services/firebase_auth_services.dart';
import 'package:fruit_hup/core/services/supabase_services.dart';
import 'package:fruit_hup/features/auth/data/repo/auth_repo_implement.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<FirebaseAuthServices>(
      () => FirebaseAuthServices());

  getIt.registerLazySingleton<DatabaseServices>(() => SupabaseServices());

  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        firebaseAuthServices: getIt<FirebaseAuthServices>(),
        databaseServices: getIt<DatabaseServices>(),
      ));
  getIt.registerLazySingleton<ProdactRepo>(
      () => ProdactRepoImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerLazySingleton<OrderRepo>(
      () => OrderRepoImpl(getIt<DatabaseServices>()));
}
