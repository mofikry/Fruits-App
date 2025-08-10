import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hup/core/error/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserAndPasaword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw CustomException(
            message: 'فشل إنشاء المستخدم: المستخدم غير موجود');
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception FirebaseAuthServices_createUserAndPasaword : ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(
            message: 'كلمة المرور ضعيفة، يجب أن تكون على الأقل 6 أحرف');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'يوجد حساب بالفعل بهذا البريد الإلكتروني');
      } else {
        throw CustomException(message: '  حدث خطأ: $e');
      }
    } catch (e) {
      log("Exception FirebaseAuthServices_createUserAndPasaword : ${e.toString()} and code is ${e.hashCode}");
      throw CustomException(message: ' حدث خطأ: $e');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw CustomException(message: 'فشل تسجيل الدخول: المستخدم غير موجود');
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception FirebaseAuthServices_signInWithEmailAndPassword : ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'لا يوجد حساب بهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(message: '  حدث خطأ: $e');
      }
    } catch (e) {
      log("Exception FirebaseAuthServices_signInWithEmailAndPassword : ${e.toString()} and code is ${e.hashCode}");
      throw CustomException(message: ' حدث خطأ: $e');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  bool isLogin() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
