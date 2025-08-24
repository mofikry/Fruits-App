import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruit_hup/core/error/exceptions.dart';
import 'package:fruit_hup/core/services/database_services.dart';

class SupabaseServices implements DatabaseServices {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<void> addData({
    required String path,
    String? documantUId,
    required Map<String, dynamic> data,
  }) async {
    try {
      if (documantUId != null) {
        await _supabase.from(path).upsert({...data, 'id': documantUId});
      } else {
        await _supabase.from(path).insert(data);
      }
    } on PostgrestException catch (e) {
      debugPrint('addData failed: ${e.message}');
      throw CustomException(message: 'فشل إضافة البيانات: ${e.message}');
    } catch (e) {
      debugPrint('addData failed: $e');
      throw CustomException(message: 'حدث خطأ غير متوقع: $e');
    }
  }

  @override
  Future<dynamic> getData({
    Map<String, dynamic>? query,
    required String path,
    String? documantUId,
  }) async {
    try {
      if (documantUId != null) {
        final response = await _supabase
            .from(path)
            .select()
            .eq('id', documantUId)
            .maybeSingle();
        if (response == null) {
          throw CustomException(message: 'المستخدم غير موجود');
        }
        return response;
      } else {
        PostgrestTransformBuilder<PostgrestList> queryBuilder =
            _supabase.from(path).select();

        if (query != null) {
          if (query['orderBy'] != null) {
            final orderByField = query['orderBy'] as String;
            final descending = query['descending'] as bool? ?? false;
            queryBuilder =
                queryBuilder.order(orderByField, ascending: !descending);
          }

          if (query['limit'] != null) {
            final limit = query['limit'] as int;
            queryBuilder = queryBuilder.limit(limit);
          }
        }

        final response = await queryBuilder;
        return response.cast<Map<String, dynamic>>();
      }
    } on PostgrestException catch (e) {
      debugPrint('getData failed: ${e.message}');
      throw CustomException(message: 'فشل استرجاع البيانات: ${e.message}');
    } catch (e) {
      debugPrint('getData failed: $e');
      throw CustomException(message: 'حدث خطأ غير متوقع: $e');
    }
  }

  @override
  Future<bool> isExist({
    required String path,
    required String documantUId,
  }) async {
    try {
      final response = await _supabase
          .from(path)
          .select('id')
          .eq('id', documantUId)
          .maybeSingle();
      return response != null;
    } on PostgrestException catch (e) {
      debugPrint('isExist failed: ${e.message}');
      throw CustomException(
          message: 'فشل التحقق من وجود المستخدم: ${e.message}');
    } catch (e) {
      debugPrint('isExist failed: $e');
      throw CustomException(message: 'حدث خطأ غير متوقع: $e');
    }
  }

  @override
  Future<bool> isConnected() async {
    try {
      await _supabase.from('health_check').select().limit(1);
      return true;
    } catch (e) {
      debugPrint('isConnected failed: $e');
      return false;
    }
  }

  @override
  Future<void> deleteData({
    required String path,
    required String documentUId,
  }) async {
    try {
      await _supabase.from(path).delete().eq('id', documentUId);
    } on PostgrestException catch (e) {
      debugPrint('deleteData failed: ${e.message}');
      throw CustomException(message: 'فشل حذف البيانات: ${e.message}');
    } catch (e) {
      debugPrint('deleteData failed: $e');
      throw CustomException(message: 'حدث خطأ غير متوقع: $e');
    }
  }
}
