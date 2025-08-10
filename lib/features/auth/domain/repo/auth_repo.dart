import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserAndPasaword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<void> addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
  Future<void> saveUser({required UserEntity user});
  // Future<UserEntity> readUserData({required String uId});
}
