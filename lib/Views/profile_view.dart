import 'package:flutter/material.dart';
import 'package:storeapp/Components/profile_view_body.dart';
import 'package:storeapp/Models/user_data.dart';
import 'package:storeapp/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      body: ProfileViewBody(user: user),
    );
  }
}
