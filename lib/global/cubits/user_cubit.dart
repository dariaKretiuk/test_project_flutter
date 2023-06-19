import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_flutter/data/models/user_model.dart';
import 'package:test_project_flutter/global/cubits/app_message_cubit.dart';
import 'package:test_project_flutter/interfaces/user_repository.dart';

part '../states/user_state.dart';

class UserCubit extends Cubit<UserState> {
  // Статические методы для прослушивания и получения кубита
  static UserState watchState(BuildContext context) => context.watch<UserCubit>().state;
  static UserCubit read(BuildContext context) => context.read<UserCubit>();

  UserCubit({
    required UserRepository userRepository,
    required AppMessageCubit appMessageCubit,
  })  : _userRepository = userRepository,
        _appMessageCubit = appMessageCubit,
        super(UserState(status: LoadingUser(), user: UserModel.emptyModel()));

  final UserRepository _userRepository;
  final AppMessageCubit _appMessageCubit;

  void fetchUser() async {
    await _fetchCalls();
  }

  Future<void> _fetchCalls() async {
    try {
      final user = await _userRepository.fetchUser();
      emit(state.copyWith(status: OkUserInfo(), user: user));
    } catch (e) {
      _appMessageCubit.showErrorMessage(e.toString());
    }
  }
}
