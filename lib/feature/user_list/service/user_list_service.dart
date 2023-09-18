import 'package:user_register_case_flutter/core/init/network/api_response.dart';
import 'package:user_register_case_flutter/core/init/network/rest_api/api_caller.dart';

import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';

import 'i_user_list_service.dart';

class UserListService implements IUserListService {
  @override
  Future<ApiResponse<List<UserModel>>> getUserList() async {
    try {
      final responseJson = await APICaller.instance?.get(
        'users',
      );
      List<UserModel> result = (responseJson as List).map((e) => UserModel.fromJson(e)).toList();
      return ApiResponse.success(result);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<UserModel>> deleteUser({required String id}) async {
    try {
      final responseJson = await APICaller.instance?.delete(
        'users/$id',
      );
      UserModel result = UserModel.fromJson(responseJson);
      return ApiResponse.success(result);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
