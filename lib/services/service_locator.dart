import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_flutter/data/network/user_api.dart';
import 'package:test_project_flutter/helpers/utils/bottom_bar_utility/bottom_bar_utility.dart';
import 'package:test_project_flutter/helpers/utils/error_handler.dart';
import 'package:test_project_flutter/interfaces/user_repository.dart';
import 'package:test_project_flutter/repositories/user_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  //Utilities
  sl.registerLazySingleton<BottomBarUtility>(() => BottomBarUtility());
  sl.registerLazySingleton<ErrorHandler>(() => ErrorHandler());

  //API
  sl.registerLazySingleton<UserApi>(() => UserApi());

  //Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userAPI: sl()));
}
