import 'package:flutter/material.dart';
import 'package:storeapp/Views/add_new_product_view.dart';
import 'package:storeapp/Views/home_view.dart';
import 'package:storeapp/Views/update_product_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProduct.id: (context) => const UpdateProduct(),
        AddNewOne.id: (context) => const AddNewOne(),
      },
      initialRoute: HomePage.id,
    );
  }
}
