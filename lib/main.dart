import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/Views/add_new_product_view.dart';
import 'package:storeapp/Views/login_view.dart';
import 'package:storeapp/Views/register_view.dart';
import 'package:storeapp/Views/splash_view.dart';
import 'package:storeapp/Views/product_details_view.dart';
import 'package:storeapp/firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>("ProductBox");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginView.id: (context) => const LoginView(),
        SplashView.id: (context) => const SplashView(),
        RegisterView.id: (context) => const RegisterView(),
        ProductDetailsView.id: (context) => const ProductDetailsView(),
        AddNewOne.id: (context) => const AddNewOne(),
      },
      initialRoute: SplashView.id,
    );
  }
}
