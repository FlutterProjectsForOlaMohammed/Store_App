import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/constants.dart';
part 'login_authentication_state.dart';

class LoginAuthenticationCubit extends Cubit<AuthenticationState> {
  LoginAuthenticationCubit() : super(AuthenticationLoginInitial());

  login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthenticationLoginLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthenticationLoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          AuthenticationLoginFailure(message: "User Not Found"),
        );
        await toastMessage(msg: "User Not Found");
      } else if (e.code == 'wrong-password') {
        emit(
          AuthenticationLoginFailure(
            message: "Wrong Password",
          ),
        );
        await toastMessage(msg: "Wrong Password");
      } else {
        emit(
          AuthenticationLoginFailure(
            message: e.toString(),
          ),
        );
        await toastMessage(msg: e.toString());
      }
    } catch (e) {
      emit(
        AuthenticationLoginFailure(
          message: e.toString(),
        ),
      );
      await toastMessage(msg: e.toString());
    }
  }
}
