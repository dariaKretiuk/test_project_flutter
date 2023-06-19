import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../states/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // Статические методы для прослушивания и получения кубита
  static AuthState watchState(BuildContext context) => context.watch<AuthCubit>().state;
  static AuthCubit read(BuildContext context) => context.read<AuthCubit>();

  AuthCubit() : super(AuthState(status: LoadingAuthStatus()));

  void checkAuthorisation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(AuthState(status: AuthorisedStatus()));
  }
}
