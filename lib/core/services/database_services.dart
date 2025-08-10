abstract class DatabaseServices {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documantUId});
  Future<dynamic> getData({
    required String path,
    String? documantUId,
    Map<String, dynamic>? query,
  });

  Future<bool> isExist({required String path, required String documantUId});
}
