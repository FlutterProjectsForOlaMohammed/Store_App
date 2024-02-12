import 'package:storeapp/Helper/api.dart';

class UpdateProductDetailsService {
  Future<dynamic> updateService({
    required String title,
    required String description,
    required String image,
    required String price,
    required String category,
    required String ID,
  }) async {
    await Api().putRequest(
      productID: ID,
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'description': description,
        'image': image,
        'price': price,
        'category': category,
      },
    );
  }
}
