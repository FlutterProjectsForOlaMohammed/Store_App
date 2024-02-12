import 'package:flutter/material.dart';
import 'package:storeapp/Components/add_new_product_form.dart';
import 'package:storeapp/constants.dart';

int idGlobal = 20;

class AddNewOne extends StatelessWidget {
  static const String id = "AddNewOne";

  const AddNewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Add New Product ",
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: AddNewProductForm(),
      ),
    );
  }
}
