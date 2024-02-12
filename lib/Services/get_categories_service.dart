import '../Helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getCategoriesService() async {
    List<dynamic> returnedData = await Api()
        .getRequest(url: 'https://fakestoreapi.com/products/categories');
    return returnedData;
  }
}
