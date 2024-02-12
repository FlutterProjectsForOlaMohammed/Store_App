import 'package:flutter/material.dart';
import 'package:storeapp/Components/update_product_form.dart';
import 'package:storeapp/constants.dart';

class UpdateProduct extends StatelessWidget {
  static String id = 'UpdateProduct';

  const UpdateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Update Product",
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ),
      body: const UpdateProductForm(),
    );
  }
}
