import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/core/error/faluir.dart';
import 'package:fruit_hup/core/model/prodact.model.dart';
import 'package:fruit_hup/core/repo/prodact_repo.dart';
import 'package:fruit_hup/core/services/database_services.dart';
import 'package:fruit_hup/core/utils/backend_endpoint.dart';

class ProdactRepoImpl extends ProdactRepo {
  final DatabaseServices databaseServices;

  ProdactRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProdact() async {
    try {
      var data = await databaseServices.getData(
          path: BackendEndpoint.product,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => AddProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSelleingProdact() async {
    try {
      var data = await databaseServices.getData(
        path: BackendEndpoint.product,
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      ) as List<Map<String, dynamic>>;
      List<ProductEntity> prodacts =
          data.map((e) => AddProductModel.fromJson(e).toEntity()).toList();

      return Right(prodacts);
    } catch (e) {
      return Left(ServerFailure('failed to get prodact data $e'));
    }
  }
}
