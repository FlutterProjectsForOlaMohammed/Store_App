import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/custom_elvated_button.dart';
import 'package:storeapp/Components/flash_chat_logo.dart';
import 'package:storeapp/Components/select_language_drop_box.dart';
import 'package:storeapp/Views/login_view.dart';
import 'package:storeapp/Views/register_view.dart';
import 'package:storeapp/cubit/ProductCubit/products_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  String newValue = 'EN';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlashChatLogo(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
            children: [
              CustomElvatedButton(
                text: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (contxet) {
                        return const LoginView();
                      },
                    ),
                  );
                },
              ),
              CustomElvatedButton(
                text: "Register",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (contxet) {
                        return const RegisterView();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          BlocProvider(
            create: (context) => ProductsCubit(),
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return SelectLanguageDropBox(
                  droppedValue: newValue,
                  onChanged: (data) {
                    newValue = data ?? "all";
                    BlocProvider.of<ProductsCubit>(context).refreshProducts();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
