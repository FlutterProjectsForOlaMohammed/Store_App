import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/product_card.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/cubit/ProductCubit/products_cubit.dart';

class ShowNewProducts extends StatelessWidget {
  const ShowNewProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductModel> finalProducts = [];
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) async {
        if (state is ProductsFailure) {
          errorMessage(context, state);
        } else if (state is ProductsSuccess) {
          finalProducts = state.productsList;
        }
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.brown[900],
          ));
        } else {
          return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: finalProducts.isEmpty ? 0 : 5,
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
      },
    );
  }

  void errorMessage(BuildContext context, ProductsFailure state) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: const Text(
            "Error",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          content: Text(
            state.errMessage,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Text(
                "Ok",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
