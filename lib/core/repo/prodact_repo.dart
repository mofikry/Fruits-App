import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/core/error/faluir.dart';

 abstract class ProdactRepo {
  Future<Either<Failure,List<ProductEntity>>> getAllProdact();
  Future<Either<Failure,List<ProductEntity>>> getBestSelleingProdact();

  
}