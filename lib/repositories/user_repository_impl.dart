import 'package:test_project_flutter/data/models/user_model.dart';
import 'package:test_project_flutter/data/network/user_api.dart';
import 'package:test_project_flutter/interfaces/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.userAPI,
  });

  final UserApi userAPI;

  @override
  Future<UserModel> fetchUser() async {
    try {
      final user = await userAPI.fetchUser();
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
