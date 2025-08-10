import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hup/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_cubit_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold((Failure) => emit(SigninError(Failure.message)),
        (UserEntity) => emit(SigninSuccess(UserEntity)));
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold((Failure) => emit(SigninError(Failure.message)),
        (UserEntity) => emit(SigninSuccess(UserEntity)));
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold((Failure) => emit(SigninError(Failure.message)),
        (UserEntity) => emit(SigninSuccess(UserEntity)));
  }
}
