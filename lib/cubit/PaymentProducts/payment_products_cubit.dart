import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/Models/product_model.dart';

part 'payment_products_state.dart';

class PaymentProductsCubit extends Cubit<PaymentProductsState> {
  List<ProductModel> products = [];
  PaymentProductsCubit() : super(PaymentProductsInitial()) {
    var box = Hive.box<ProductModel>("ProductBox");
    products = [];
    products = box.values.toList();
  }

  addProducts(ProductModel product) async {
    var box = Hive.box<ProductModel>("ProductBox");
    await box.add(product);
    products = [];
    products = box.values.toList();
    emit(PaymentProductsAdded(productsList: products));
  }

  deleteProducts(ProductModel product) async {
    var box = Hive.box<ProductModel>("ProductBox");
    product.delete();
    products = [];
    products = box.values.toList();
    emit(PaymentProductsDelete(productsList: products));
  }

  checkQuantity(ProductModel product) {
    var box = Hive.box<ProductModel>("ProductBox");
    bool isFound = false;
    box.values.toList().forEach((element) {
      if (element.id == product.id) {
        product = element;
        isFound = true;
      }
    });
    if (isFound) {
      product.quantity += 1;
      product.save();
    } else {
      addProducts(product);
    }
  }
}
