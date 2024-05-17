import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/cubit/PaymentProducts/payment_products_cubit.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await BlocProvider.of<PaymentProductsCubit>(context)
            .checkQuantity(product);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 28, 75, 77),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Add To Cart",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
