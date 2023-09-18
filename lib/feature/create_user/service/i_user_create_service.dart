import 'package:user_register_case_flutter/core/init/network/api_response.dart';
import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';

abstract class IUserCreateService {
  Future<ApiResponse<UserModel>> updateUser({required UserModel user});
  Future<ApiResponse<UserModel>> createUser({required UserModel user});
}
