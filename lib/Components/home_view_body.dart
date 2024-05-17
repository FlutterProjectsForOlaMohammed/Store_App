import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/drop_box.dart';
import 'package:storeapp/Components/show_grid_cards.dart';
import 'package:storeapp/cubit/ProductCubit/products_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String droppedValue = 'all';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          const Expanded(
            child: ShowGridCards(),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return DropBox(
                  droppedValue: droppedValue,
                  onChanged: (data) {
                    droppedValue = data ?? "all";
                    if (data == "all") {
                      BlocProvider.of<ProductsCubit>(context).getAllProducts();
                    } else {
                      BlocProvider.of<ProductsCubit>(context)
                          .getSpecificCategoryProducts(category: data!);
                    }
                  });
            },
          )
        ],
      ),
    );
  }
}
