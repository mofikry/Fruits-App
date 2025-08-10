import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      String? documantUId,
      required Map<String, dynamic> data}) async {
    if (documantUId != null) {
      await firestore.collection(path).doc(documantUId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {Map<String, dynamic>? query,
      required String path,
      String? documantUId}) async {
    if (documantUId != null) {
      var data = await firestore.collection(path).doc(documantUId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = await firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByFiled = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByFiled, descending: descending);
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isExist(
      {required String path, required String documantUId}) async {
    var data = await firestore.collection(path).doc(documantUId).get();
    return data.exists;
  }
}
