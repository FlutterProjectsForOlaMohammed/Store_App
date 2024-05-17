import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Components/custom_elvated_button.dart';
import 'package:storeapp/Components/custom_text_field.dart';
import 'package:storeapp/Components/flash_chat_logo.dart';
import 'package:storeapp/Models/user_data.dart';
import 'package:storeapp/Views/home_view.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubit/LoginAuthentication/login_authentication_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '', password = "";
  UserData? user;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlashChatLogo(),
          CustomTextField(
            onSaved: (value) {
              email = value!;
            },
            label: "Email",
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return emailValidation(value);
              }
              return "Required";
            },
          ),
          CustomTextField(
            onSaved: (value) {
              password = value!;
            },
            label: "Password",
            obsureText: true,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return passwordValidation(value);
              } else {
                return "Required";
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          BlocConsumer<LoginAuthenticationCubit, AuthenticationState>(
            listener: (context, state) async {
              if (state is AuthenticationLoginSuccess) {
                user = await getSenderData(email: email);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return HomePage(
                        user: UserData(
                          firstName: user!.firstName,
                          lastName: user!.lastName,
                          email: user!.email,
                        ),
                      );
                    },
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomElvatedButton(
                text: (state is AuthenticationLoginLoading)
                    ? const CupertinoActivityIndicator()
                    : "Login",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    await BlocProvider.of<LoginAuthenticationCubit>(context)
                        .login(
                      email: email,
                      password: password,
                    );
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
