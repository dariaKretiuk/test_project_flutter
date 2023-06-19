part of '../cubits/auth_cubit.dart';

class AuthState {
  final AuthStatus status;

  AuthState({required this.status});
}

abstract class AuthStatus {}

class LoadingAuthStatus extends AuthStatus {}

class AuthorisedStatus extends AuthStatus {}

class UnauthorisedStatus extends AuthStatus {}
