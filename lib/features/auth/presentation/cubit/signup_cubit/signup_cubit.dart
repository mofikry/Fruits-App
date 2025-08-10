import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserAndPasaword(
      String email, String password, String name) async {
    emit(SignupLoading());

    final result = await authRepo.createUserAndPasaword(email, password, name);
    result.fold((Failure) => emit(SignupError(Failure.message)),
        (UserEntity) => emit(SignupSuccess(UserEntity)));
  }
}
