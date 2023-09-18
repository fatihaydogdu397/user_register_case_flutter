import 'package:get_it/get_it.dart';
import 'package:user_register_case_flutter/core/localization/language_view_model.dart';
import 'package:user_register_case_flutter/feature/create_user/service/i_user_create_service.dart';
import 'package:user_register_case_flutter/feature/create_user/service/user_create_service.dart';
import 'package:user_register_case_flutter/feature/create_user/viewmodel/create_user_view_model.dart';
import 'package:user_register_case_flutter/feature/user_list/service/i_user_list_service.dart';
import 'package:user_register_case_flutter/feature/user_list/service/user_list_service.dart';
import 'package:user_register_case_flutter/feature/user_list/viewmodel/user_list_view_model.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //services
  serviceLocator.registerLazySingleton<IUserListService>(() => UserListService());
  serviceLocator.registerLazySingleton<IUserCreateService>(() => UserCreateService());

  //viewmodels
  serviceLocator.registerLazySingleton<LanguageSettingsProvider>(() => LanguageSettingsProvider());
  serviceLocator.registerLazySingleton<UserListViewModel>(() => UserListViewModel(serviceLocator()));
  serviceLocator.registerFactory<CreateUserViewModel>(() => CreateUserViewModel(serviceLocator()));
}
