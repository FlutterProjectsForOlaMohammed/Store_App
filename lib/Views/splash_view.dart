import 'package:flutter/material.dart';
import 'package:storeapp/Components/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String id = 'SplashView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: SplashViewBody(),
    );
  }
}
