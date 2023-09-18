import 'package:user_register_case_flutter/core/init/network/api_response.dart';
import 'package:user_register_case_flutter/core/init/network/rest_api/api_caller.dart';

import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';

import 'i_user_create_service.dart';

class UserCreateService implements IUserCreateService {
  @override
  Future<ApiResponse<UserModel>> createUser({required UserModel user}) async {
    try {
      final responseJson = await APICaller.instance?.post(
        'users',
        data: user.toJson(),
      );
      UserModel result = UserModel.fromJson(responseJson);
      return ApiResponse.success(result);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<UserModel>> updateUser({required UserModel user}) async {
    try {
      final responseJson = await APICaller.instance?.put(
        'users/${user.id}',
        data: user.toJson(),
      );
      UserModel result = UserModel.fromJson(responseJson);
      return ApiResponse.success(result);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
