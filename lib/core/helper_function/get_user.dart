import 'dart:convert';

import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/features/auth/data/model/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString('userData');
  var userEntity = UserModel.fromjson(jsonDecode(jsonString));
  return userEntity;
}
