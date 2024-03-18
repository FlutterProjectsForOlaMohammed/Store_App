import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/Components/home_view_body.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubits/ProductCubit/products_cubit.dart';
import 'add_new_product_view.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AddNewOne.id);
          },
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "New Trends",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(),
        child: const HomeViewBody(),
      ),
    );
  }
}
