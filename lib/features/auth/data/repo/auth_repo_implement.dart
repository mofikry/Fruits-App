import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/exceptions.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/services/supabase_auth_service.dart';
import 'package:fruit_hup/core/services/supabase_services.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/utils/backend_endpoint.dart';
import 'package:fruit_hup/features/auth/data/model/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseAuthServices supabaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.supabaseAuthServices,
    required this.databaseServices,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserAndPasaword(
      String email, String password, String displayName) async {
    User? user;
    try {
      user = await supabaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity =
          UserEntity(email: email, displayName: displayName, id: user.id);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await supabaseAuthServices.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await supabaseAuthServices.deleteUser();
      }
      log("Exception createUserAndPasaword: ${e.toString()}");
      return Left(ServerFailure("حدث خطأ: $e"));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    final data = UserModel.fromEntity(user).toMap();
    log("Adding user data: $data");
    await databaseServices.addData(
      documantUId: user.id,
      path: BackendEndpoint.addUserData,
      data: data,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await databaseServices.getData(
      path: BackendEndpoint.getUserData,
      documantUId: uId,
    );
    return UserModel.fromjson(data);
  }

  @override
  Future<void> saveUser({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString('userData', jsonData);
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await supabaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      final userEntity = UserEntity(
        email: user.email ?? email,
        displayName: user.userMetadata?['displayName'] ?? 'Unknown',
        id: user.id,
      );
      await saveUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception signInWithEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure("حدث خطأ أثناء تسجيل الدخول: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await supabaseAuthServices.signInWithGoogle();
      final userEntity = UserEntity(
        email: user.email ?? 'no-email',
        displayName: user.userMetadata?['displayName'] ?? 'Unknown',
        id: user.id,
      );
      await addUserData(user: userEntity);
      await saveUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception signInWithGoogle: ${e.toString()}");
      return Left(ServerFailure("حدث خطأ أثناء تسجيل الدخول بـ Google: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await supabaseAuthServices.signInWithFacebook();
      final userEntity = UserEntity(
        email: user.email ?? 'no-email',
        displayName: user.userMetadata?['name'] ?? 'Unknown',
        id: user.id,
      );
      await addUserData(user: userEntity);
      await saveUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception signInWithFacebook: ${e.toString()}");
      return Left(ServerFailure("حدث خطأ أثناء تسجيل الدخول بـ Facebook: $e"));
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    final user = supabaseAuthServices.supabase.auth.currentUser;
    return user != null;
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = supabaseAuthServices.supabase.auth.currentUser;
    if (user == null) return null;
    final storedData = await Prefs.getString('userData');
    if (storedData != null) {
      final userMap = jsonDecode(storedData);
      return UserEntity(
        email: userMap['email'],
        displayName: userMap['displayName'],
        id: userMap['id'],
      );
    }
    return UserEntity(
      email: user.email ?? 'no-email',
      displayName: user.userMetadata?['displayName'] ?? 'Unknown',
      id: user.id,
    );
  }
}
