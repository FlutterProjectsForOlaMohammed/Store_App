part of 'payment_products_cubit.dart';

@immutable
sealed class PaymentProductsState {}

final class PaymentProductsInitial extends PaymentProductsState {}

final class PaymentProductsDelete extends PaymentProductsState {
  final List<ProductModel> productsList;

  PaymentProductsDelete({required this.productsList});
}

final class PaymentProductsAdded extends PaymentProductsState {
  final List<ProductModel> productsList;

  PaymentProductsAdded({required this.productsList});
}
