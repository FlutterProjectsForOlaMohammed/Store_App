import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/Components/home_view_body.dart';
import 'package:storeapp/Models/user_data.dart';
import 'package:storeapp/Views/favorite_products_view.dart';
import 'package:storeapp/Views/new_products_view.dart';
import 'package:storeapp/Views/payment_view.dart';
import 'package:storeapp/Views/profile_view.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubit/ProductCubit/products_cubit.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';

  const HomePage({super.key, required this.user});
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CircleAvatar(
            radius: 19,
            backgroundColor: const Color.fromARGB(255, 218, 217, 217),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FavoriteProductsView(
                            product: favoriteProductsList);
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red[900],
                )),
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
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoDialogRoute(
                      builder: (context) {
                        return PaymentView(user: user);
                      },
                      context: context),
                );
              },
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoDialogRoute(
                    builder: (context) {
                      return ProfileView(user: user);
                    },
                    context: context),
              );
            },
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 28,
              child: const Icon(
                Icons.person_2,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoDialogRoute(
                      builder: (context) {
                        return NewProductsView();
                      },
                      context: context),
                );
              },
              icon: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 24,
                child: const Icon(
                  Icons.new_releases_outlined,
                  size: 32,
                  color: Colors.black,
                ),
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
