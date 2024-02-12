import 'package:flutter/material.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/Views/update_product_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, UpdateProduct.id, arguments: product);
        },
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 5, //حده ال shadow
                spreadRadius: 0.2, // shadow هيتحرك لمسافه قد ايه
                offset: const Offset(
                    1, 1), // اتجاه ال shadow vertical and horizantal
                color: const Color.fromARGB(255, 221, 213, 213)
                    .withOpacity(0.2), // شفافيه اللون ما بين 1 و 0
                // shadow color
              )
            ]),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 7), // name
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$'
                          "${product.price}", //price
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            bottom: 110,
            child: Image.network(
              product.image,
              height: 100,
              width: 80,
            ),
          )
        ]),
      ),
    );
  }
}
