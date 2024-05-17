import 'package:flutter/material.dart';
import 'package:storeapp/Components/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String id = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const RegisterViewBody(),
    );
  }
}
