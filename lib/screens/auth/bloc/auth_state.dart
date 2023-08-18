// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  String successMessage;
  AuthSuccess({
    required this.successMessage,
  });
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

class AuthOtpSend extends AuthState {}

class AuthOtpConfirm extends AuthState {}
