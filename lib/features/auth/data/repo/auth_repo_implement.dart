import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/core/error/exceptions.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/services/firebase_auth_services.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/utils/backend_endpoint.dart';
import 'package:fruit_hup/features/auth/data/model/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final DatabaseServices databaseServices;
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl(
      {required this.firebaseAuthServices, required this.databaseServices});
  @override
  Future<Either<Failure, UserEntity>> createUserAndPasaword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserAndPasaword(
          email: email, password: password);

      var userEntity = UserEntity(email: email, name: name, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log("Exception createUserAndPasaword : ${e.toString()}");
      return Left(ServerFailure(" حدث خطأ: $e"));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      await saveUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception signInWithEmailAndPassword : ${e.toString()}");
      return Left(ServerFailure(" حدث خطأ: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fireBaseUser(user);
      var isUserExist = await databaseServices.isExist(
        documantUId: user.uid,
        path: BackendEndpoint.isExist,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception signInWithGoogle : ${e.toString()}");
      return Left(ServerFailure(" حدث خطأ: $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fireBaseUser(user);
      var isUserExist = await databaseServices.isExist(
        documantUId: user.uid,
        path: BackendEndpoint.isExist,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception signInWithFacebook : ${e.toString()}");
      return Left(ServerFailure(" حدث خطأ: $e"));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseServices.addData(
        documantUId: user.uId,
        path: BackendEndpoint.addUserData,
        data: UserModel.fromEntity(user).toMap());
  }

  @override
  Future<UserEntity> getUserData({
    required String uId,
  }) async {
    var data = await databaseServices.getData(
        path: BackendEndpoint.getUserData, documantUId: uId);
    return UserModel.fromjson(data);
  }

  @override
  Future<void> saveUser({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString('userData', jsonData);
  }
}
