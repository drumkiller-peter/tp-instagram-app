part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignUpRequested extends AuthEvent {}

class AuthSignUpWithPhoneNumberRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {}
