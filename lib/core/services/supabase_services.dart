import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
    } catch (e, stack) {
      debugPrint('addData failed: $e\n$stack');
      throw Exception('addData failed: $e');
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

        if (response is List) {
          return response.cast<Map<String, dynamic>>();
        } else {
          throw Exception('Expected list but got ${response.runtimeType}');
        }
      }
    } catch (e, stack) {
      debugPrint('getData failed: $e\n$stack');
      throw Exception('getData failed: $e');
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
    } catch (e, stack) {
      debugPrint('isExist failed: $e\n$stack');
      throw Exception('isExist failed: $e');
    }
  }

  Future<bool> isConnected() async {
    try {
      await _supabase.from('health_check').select().limit(1);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteData({
    required String path,
    required String documentUId,
  }) async {
    try {
      await _supabase.from(path).delete().eq('id', documentUId);
    } on PostgrestException catch (e) {
      debugPrint('Supabase error: ${e.message}');
      throw Exception('Failed to delete: ${e.message}');
    }
  }
}
