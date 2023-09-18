import 'package:user_register_case_flutter/core/base/base_view_model.dart';
import 'package:user_register_case_flutter/core/init/network/api_response.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/data/route_manager.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/domain/entity/route.dart';
import 'package:user_register_case_flutter/core/localization/app_strings.dart';
import 'package:user_register_case_flutter/feature/create_user/model/create_user_view_argument.dart';
import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';
import 'package:user_register_case_flutter/feature/user_list/service/i_user_list_service.dart';

class UserListViewModel extends BaseViewModel {
  final IUserListService _iUserListService;
  UserListViewModel(this._iUserListService) {
    fetchUserList();
  }

  ApiResponse<List<UserModel>> userList = ApiResponse.idle();
  ApiResponse<UserModel> deletedUser = ApiResponse.idle();

  UserModel? selectedUser;

  Future<void> fetchUserList() async {
    userList = ApiResponse.loading();
    refreshView();
    userList = await _iUserListService.getUserList();
    refreshView();
  }

  Future<void> deleteSelectedUser({required String id}) async {
    deletedUser = ApiResponse.loading();
    deletedUser = await _iUserListService.deleteUser(id: id);
    userList.data?.removeWhere((user) => user.id == deletedUser.data?.id);
    refreshView();
  }

  void selectUpdateUser({required UserModel user}) {
    selectedUser = user;
    Go.to.page(
      userCreatePageRoute,
      argument: CreateUserViewArgument(
        isUpdate: true,
        pageTitle: AppStrings.updateUser,
      ),
    );
  }
}
