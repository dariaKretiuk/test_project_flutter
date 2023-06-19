part of '../cubits/user_cubit.dart';

class UserState {
  final UserStatus status;
  final UserModel user;
  final TypeMessage typeMessage;
  final String selecteTypePhone;

  UserState({
    required this.status,
    required this.user,
    required this.typeMessage,
    required this.selecteTypePhone,
  });

  UserState copyWith({UserStatus? status, UserModel? user, TypeMessage? typeMessage, String? selecteTypePhone}) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      typeMessage: typeMessage ?? this.typeMessage,
      selecteTypePhone: selecteTypePhone ?? this.selecteTypePhone,
    );
  }
}

abstract class UserStatus {}

class LoadingUser extends UserStatus {}

class OkUserInfo extends UserStatus {}

class ErrorUser extends UserStatus {}
