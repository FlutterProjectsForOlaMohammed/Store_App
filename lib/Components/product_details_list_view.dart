import 'package:flutter/material.dart';
import 'package:storeapp/Components/add_to_cart.dart';
import 'package:storeapp/Components/price_widget.dart';
import 'package:storeapp/Models/product_model.dart';

class ProductDetailsListView extends StatelessWidget {
  const ProductDetailsListView({
    super.key,
    required this.productData,
  });

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        Image.network(
          productData.image,
          height: 200,
          width: 150,
        ),
        const SizedBox(
          height: 70,
        ),
        Text(
          productData.title,
          style: const TextStyle(
              color: Color.fromARGB(255, 28, 75, 77),
              fontWeight: FontWeight.w600,
              fontSize: 24,
              shadows: []),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          productData.description,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PriceWidget(productData: productData),
        const SizedBox(
          height: 20,
        ),
        AddToCartWidget(
          product: productData,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
