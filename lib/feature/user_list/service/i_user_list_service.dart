import 'package:user_register_case_flutter/core/init/network/api_response.dart';
import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';

abstract class IUserListService {
  Future<ApiResponse<List<UserModel>>> getUserList();
  Future<ApiResponse<UserModel>> deleteUser({required String id});
}
