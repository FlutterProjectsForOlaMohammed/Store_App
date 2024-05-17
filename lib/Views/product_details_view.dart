import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/update_product_body.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubit/PaymentProducts/payment_products_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  static String id = 'UpdateProduct';

  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      body: BlocProvider(
        create: (context) => PaymentProductsCubit(),
        child: ProductDetailsViewBody(
          productData: product,
        ),
      ),
    );
  }
}
