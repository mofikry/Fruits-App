import 'package:bloc/bloc.dart';
import 'package:fruit_hup/core/entities/prodact_entites.dart';
import 'package:fruit_hup/core/repo/prodact_repo.dart';
import 'package:meta/meta.dart';

part 'prodacts_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.prodactRepo) : super(ProdactsInitial());
  final ProdactRepo prodactRepo;
  int productlength = 0;

  Future<void> getProdact() async {
    emit(ProdactsLoading());
    final result = await prodactRepo.getAllProdact();
    result.fold((Failure) => emit(ProdactFailure(message: Failure.message)),
        (prodacts) => emit(ProdactsSuccess(product: prodacts)));
  }

  Future<void> getBestSelleingProdact() async {
    emit(ProdactsLoading());
    final result = await prodactRepo.getBestSelleingProdact();
    result.fold((Failure) => emit(ProdactFailure(message: Failure.message)),
        (prodacts) {
      productlength = prodacts.length;

      emit(ProdactsSuccess(product: prodacts));
    });
  }
}
