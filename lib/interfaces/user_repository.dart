import 'package:test_project_flutter/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> fetchUser();
}
