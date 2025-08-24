import 'dart:developer';
import 'package:fruit_hup/core/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruit_hup/core/error/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SupabaseAuthServices {
  final SupabaseClient supabase = Supabase.instance.client;

  // حذف المستخدم
  Future<void> deleteUser() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw CustomException(message: 'لا يوجد مستخدم حالي لحذفه');
      }
      // حذف بيانات المستخدم من جدول users
      await SupabaseServices().deleteData(path: 'users', documentUId: user.id);
      // تسجيل خروج المستخدم
      await supabase.auth.signOut();
    } catch (e) {
      log("Exception SupabaseAuthServices_deleteUser: ${e.toString()}");
      throw CustomException(message: 'فشل حذف المستخدم: $e');
    }
  }

  // إنشاء مستخدم باستخدام البريد الإلكتروني وكلمة المرور
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        throw CustomException(
            message: 'فشل إنشاء المستخدم: المستخدم غير موجود');
      }
      return user;
    } on AuthException catch (e) {
      log("Exception SupabaseAuthServices_createUserWithEmailAndPassword: ${e.message}");
      if (e.message.contains('weak password')) {
        throw CustomException(
            message: 'كلمة المرور ضعيفة، يجب أن تكون على الأقل 6 أحرف');
      } else if (e.message.contains('network')) {
        throw CustomException(message: 'لا يوجد اتصال بالإنترنت');
      } else if (e.message.contains('email already exists')) {
        throw CustomException(
            message: 'يوجد حساب بالفعل بهذا البريد الإلكتروني');
      } else {
        throw CustomException(message: 'حدث خطأ: ${e.message}');
      }
    } catch (e) {
      log("Exception SupabaseAuthServices_createUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(message: 'حدث خطأ: $e');
    }
  }

  // تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        throw CustomException(message: 'فشل تسجيل الدخول: المستخدم غير موجود');
      }
      return user;
    } on AuthException catch (e) {
      log("Exception SupabaseAuthServices_signInWithEmailAndPassword: ${e.message}");
      if (e.message.contains('invalid login credentials')) {
        throw CustomException(
            message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.message.contains('network')) {
        throw CustomException(message: 'لا يوجد اتصال بالإنترنت');
      } else {
        throw CustomException(message: 'حدث خطأ: ${e.message}');
      }
    } catch (e) {
      log("Exception SupabaseAuthServices_signInWithEmailAndPassword: ${e.toString()}");
      throw CustomException(message: 'حدث خطأ: $e');
    }
  }

  // تسجيل الدخول باستخدام Google
  Future<User> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth == null) {
        throw CustomException(message: 'فشل تسجيل الدخول باستخدام Google');
      }

      final response = await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'myapptest://com.example.auth_ui_example',
      );
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw CustomException(message: 'فشل تسجيل الدخول: المستخدم غير موجود');
      }
      return user;
    } catch (e) {
      log("Exception SupabaseAuthServices_signInWithGoogle: ${e.toString()}");
      throw CustomException(message: 'حدث خطأ: $e');
    }
  }

  // تسجيل الدخول باستخدام Facebook
  Future<User> signInWithFacebook() async {
    try {
      final loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success) {
        throw CustomException(message: 'فشل تسجيل الدخول باستخدام Facebook');
      }

      final response = await supabase.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: 'myapptest://com.example.auth_ui_example',
      );
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw CustomException(message: 'فشل تسجيل الدخول: المستخدم غير موجود');
      }
      return user;
    } catch (e) {
      log("Exception SupabaseAuthServices_signInWithFacebook: ${e.toString()}");
      throw CustomException(message: 'حدث خطأ: $e');
    }
  }

  // التحقق مما إذا كان المستخدم مسجل الدخول
  bool isLogin() {
    return supabase.auth.currentUser != null;
  }
}
