import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uId,
  });

  factory UserModel.fireBaseUser(User user) => UserModel(
        email: user.email ?? 'no-email',
        name: user.displayName ?? 'مستخدم بدون اسم',
        uId: user.uid,
      );
  factory UserModel.fromjson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        uId: json['uId'],
      );

    factory UserModel.fromEntity(UserEntity user) => UserModel(
        email: user.email,
        name: user.name,
        uId: user.uId,
      );
        toMap() => {'email': email, 'name': name, 'uId': uId};
}
