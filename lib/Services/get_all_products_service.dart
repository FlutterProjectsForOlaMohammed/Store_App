import 'package:storeapp/Helper/api.dart';
import '../Models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getProductsService() async {
    List<dynamic> returnedData =
        await Api().getRequest(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (int i = 0; i < returnedData.length; i++) {
      productsList.add(ProductModel.fromJson(returnedData[i]));
    }
    return productsList;
  }
}
