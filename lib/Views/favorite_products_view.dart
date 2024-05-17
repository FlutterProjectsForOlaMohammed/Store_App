import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/favorite_product_card.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubit/ProductCubit/products_cubit.dart';

class FavoriteProductsView extends StatefulWidget {
  const FavoriteProductsView({super.key, required this.product});
  final List<ProductModel> product;

  @override
  State<FavoriteProductsView> createState() => _FavoriteProductsViewState();
}

class _FavoriteProductsViewState extends State<FavoriteProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Products",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (favoriteProductsList.isEmpty) {
              return const Center(
                  child: Text(
                "There are No Items in the Favorite List .",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ));
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favoriteProductsList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) {
                    return FavoriteProductCard(
                      product: favoriteProductsList[index],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

List<ProductModel> favoriteProductsList = [];
