import '../Helper/api.dart';

class AddNewProductService {
  Future<dynamic> addProductService(
      {required String title,
      required String description,
      required String price,
      required String image,
      required String category,
      required String id}) async {
    await Api().postRequest(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'description': description,
        'price': price,
        'image': image,
        'category': category,
        'id': id
      },
    );
  }
}
