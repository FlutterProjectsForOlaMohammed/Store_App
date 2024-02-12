import 'package:storeapp/Helper/api.dart';
import 'package:storeapp/Models/product_model.dart';

class GetProductsRelatedToSpecificCategory {
  Future<List<ProductModel>> getRelatedProductsService(
      {required String categoryName}) async {
    List<dynamic> returnedData = await Api().getRequest(
        url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> data = [];
    for (int i = 0; i < returnedData.length; i++) {
      data.add(ProductModel.fromJson(returnedData[i]));
    }
    return data;
  }
}
