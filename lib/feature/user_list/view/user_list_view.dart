import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/base/view_model_provider.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/data/route_manager.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/domain/entity/route.dart';
import 'package:user_register_case_flutter/core/localization/app_strings.dart';
import 'package:user_register_case_flutter/core/ui/style/global_colors.dart';
import 'package:user_register_case_flutter/core/ui/widgets/loading_widget.dart';
import 'package:user_register_case_flutter/core/ui/widgets/user_card_widget.dart';
import 'package:user_register_case_flutter/feature/user_list/viewmodel/user_list_view_model.dart';
import 'package:provider/provider.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UserListViewModel>(builder: (userListViewModel) {
      return Consumer<UserListViewModel>(
        builder: (context, userListViewModel, child) {
          return userListViewModel.userList.isLoading || !userListViewModel.userList.isSuccess
              ? const LoadingWidget()
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: context.red,
                    title: Text(AppStrings.userListScreen),
                  ),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: context.red,
                      foregroundColor: context.black,
                      onPressed: () {
                        userListViewModel.selectedUser = null;
                        Go.to.page(userCreatePageRoute);
                      },
                      child: const Icon(
                        Icons.person_add_alt_1,
                      )),
                  body: RefreshIndicator(
                    onRefresh: () async {
                      userListViewModel.fetchUserList();
                    },
                    color: context.red,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: (userListViewModel.userList.data ?? []).length,
                      itemBuilder: (context, index) {
                        return UserCardWidget(
                          user: (userListViewModel.userList.data ?? [])[index],
                          userListViewModel: userListViewModel,
                        );
                      },
                    ),
                  ),
                );
        },
      );
    });
  }
}
