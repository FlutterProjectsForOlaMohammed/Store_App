import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/show_new_products_list_view.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubit/ProductCubit/products_cubit.dart';

class NewProductsView extends StatelessWidget {
  const NewProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        title: const Text(
          "New Trends",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(),
        child: const SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 16),
          child: Expanded(child: ShowNewProducts()),
        )),
      ),
    );
  }
}
