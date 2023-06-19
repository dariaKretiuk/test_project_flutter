part of '../cubits/user_cubit.dart';

class UserState {
  final UserStatus status;
  final UserModel user;

  UserState({
    required this.status,
    required this.user,
  });

  UserState copyWith({
    UserStatus? status,
    UserModel? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}

abstract class UserStatus {}

class LoadingUser extends UserStatus {}

class OkUserInfo extends UserStatus {}

class ErrorUser extends UserStatus {}
