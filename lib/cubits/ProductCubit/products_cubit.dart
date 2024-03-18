import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/Services/get_all_products_service.dart';
import 'package:storeapp/Services/get_products_related_to_specific_category_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getAllProducts();
  }
  List<ProductModel> list = [];
  getSpecificCategoryProducts({required String category}) async {
    List<ProductModel> list = [];
    try {
      emit(ProductsLoading());
      list = await GetProductsRelatedToSpecificCategory()
          .getRelatedProductsService(categoryName: category);
      emit(ProductsSuccess(productsList: list));
    } on Exception catch (e) {
      emit(ProductsFailure(errMessage: e.toString()));
    }
  }

  Future<void> getAllProducts() async {
    list = [];
    try {
      emit(ProductsLoading());
      list = await GetAllProductsService().getProductsService();
      emit(ProductsSuccess(productsList: list));
    } on Exception catch (e) {
      emit(ProductsFailure(errMessage: e.toString()));
    }
  }
}
