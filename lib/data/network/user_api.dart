import 'package:test_project_flutter/data/MOCK_data/user_data.dart';
import 'package:test_project_flutter/data/models/user_model.dart';

class UserApi {
  Future<UserModel> fetchUser() async {
    return user;
  }
}
