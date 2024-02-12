import 'package:flutter/material.dart';
import 'package:storeapp/Components/product_card.dart';
import 'package:storeapp/Models/product_model.dart';

class ShowGridCards extends StatelessWidget {
  const ShowGridCards({
    super.key,
    required this.finalProducts,
  });

  final List<ProductModel> finalProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: finalProducts.length,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return ProductCard(
            product: finalProducts[index],
          );
        });
  }
}
