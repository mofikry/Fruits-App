import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show User;

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.displayName,
    required super.id,
  });

  factory UserModel.fromSupabaseUser(User user) => UserModel(
        email: user.email ?? 'no-email',
        displayName: user.userMetadata?['displayName'] ?? 'مستخدم بدون اسم',
        id: user.id,
      );

  factory UserModel.fromjson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        displayName: json['displayName'],
        id: json['id'],
      );

  factory UserModel.fromEntity(UserEntity user) => UserModel(
        email: user.email,
        displayName: user.displayName,
        id: user.id,
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'displayName': displayName,
        'id': id, // استخدام id
      };
}
