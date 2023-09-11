import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_instagram_app/data/shared_preference/app_shared_preference.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUpRequested>(_signUp);
    on<AuthSignUpWithPhoneNumberRequested>(_signUpWithPhoneNumber);
    on<AuthLoginRequested>(_login);
    on<AuthSendOTPRequested>(_verifyOTP);
  }

  Future<void> _verifyOTP(AuthSendOTPRequested event, Emitter emit) async {
    emit(AuthLoading());
    try {
      if (result != null) {
        final userCredential = await result!.confirm(otpController.text);
        await saveUserData(userCredential);
        emit(AuthSuccess(
          successMessage: userCredential.user?.email ?? '',
        ));
      }
    } catch (e) {
      emit(AuthFailure(error: "Couldnot verify otp. $e"));
    }
  }

  Future<void> _login(AuthLoginRequested event, Emitter emit) async {
    emit(AuthLoading());
    final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (response.user?.uid != null) {
      log(response.user.toString());
      await _sharedPreference.saveUserData(
        email: response.user?.email ?? '',
        id: response.user?.uid ?? '',
      );
      emit(AuthSuccess(
        successMessage: response.user?.email ?? '',
      ));
    }
  }

  Future<void> _signUpWithPhoneNumber(
      AuthSignUpWithPhoneNumberRequested event, Emitter emit) async {
    emit(AuthLoading());
    try {
      //  result = await _firebaseAuth.signInWithPhoneNumber(phoneController.text);
      await Future.delayed(const Duration(seconds: 2));

      emit(AuthOtpSend());
    } catch (e) {
      emit(
        AuthFailure(error: "Sign up failed $e"),
      );
    }
  }

  Future<void> _signUp(AuthSignUpRequested event, Emitter emit) async {
    log("Hey");
    print("Hello");
    emit(AuthLoading());
    try {
      UserCredential response =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      await saveUserData(response);
      emit(AuthSuccess(
        successMessage: response.user?.email ?? '',
      ));
    } catch (e) {
      emit(
        AuthFailure(error: "Sign up failed $e"),
      );
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  ConfirmationResult? result;

  final AppSharedPreference _sharedPreference = AppSharedPreference();

  Future<void> saveUserData(UserCredential userCredentials) async {
    if (userCredentials.user?.uid != null) {
      await _sharedPreference.saveUserData(
        email: userCredentials.user?.email ?? '',
        id: userCredentials.user?.uid ?? '',
      );
    }
  }
}
