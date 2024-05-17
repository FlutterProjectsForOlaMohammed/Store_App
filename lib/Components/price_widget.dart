import 'package:flutter/material.dart';
import 'package:storeapp/Models/product_model.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.productData,
  });

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 28, 75, 77),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Price : ",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            productData.price.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            r" $",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
