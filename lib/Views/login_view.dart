import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/login_view_body.dart';
import 'package:storeapp/cubit/LoginAuthentication/login_authentication_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginAuthenticationCubit(),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}
