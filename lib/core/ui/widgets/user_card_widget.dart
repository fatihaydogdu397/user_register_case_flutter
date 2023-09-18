import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/extensions/date_time_extensions.dart';
import 'package:user_register_case_flutter/core/extensions/edge_insets_functions.dart';
import 'package:user_register_case_flutter/core/extensions/num_extensions.dart';
import 'package:user_register_case_flutter/core/localization/app_strings.dart';
import 'package:user_register_case_flutter/core/ui/style/global_colors.dart';
import 'package:user_register_case_flutter/core/ui/style/global_text_styles.dart';
import 'package:user_register_case_flutter/core/ui/widgets/app_outlined_button_widget.dart';
import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';
import 'package:user_register_case_flutter/feature/user_list/viewmodel/user_list_view_model.dart';

class UserCardWidget extends StatelessWidget {
  final UserListViewModel userListViewModel;
  final UserModel user;
  const UserCardWidget({
    super.key,
    required this.user,
    required this.userListViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(offset: Offset(0, 0), spreadRadius: 1, blurRadius: 5)],
            color: context.white,
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.name, style: context.px14w600),
                        SizedBox(height: 3.h),
                        Text(AppStrings.surname, style: context.px14w600),
                        SizedBox(height: 3.h),
                        Text(AppStrings.phoneNumber, style: context.px14w600),
                        SizedBox(height: 3.h),
                        Text(AppStrings.birthDate, style: context.px14w600),
                        SizedBox(height: 3.h),
                        Text(AppStrings.identityNumber, style: context.px14w600),
                        SizedBox(height: 3.h),
                        Text(AppStrings.salary, style: context.px14w600),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, style: context.px14w400),
                        SizedBox(height: 3.h),
                        Text(user.surname, style: context.px14w400),
                        SizedBox(height: 3.h),
                        Text(user.phoneNumber, style: context.px14w400),
                        SizedBox(height: 3.h),
                        Text(user.birthDate.dMMMMYYYY, style: context.px14w400),
                        SizedBox(height: 3.h),
                        Text(user.identityNumber, style: context.px14w400),
                        SizedBox(height: 3.h),
                        Text(user.salary, style: context.px14w400),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppOutlinedButton(
                      onPressed: () {
                        userListViewModel.selectUpdateUser(user: user);
                      },
                      buttonText: AppStrings.update,
                      backgroundColor: context.greyText,
                    ),
                    AppOutlinedButton(
                      onPressed: () => userListViewModel.deleteSelectedUser(id: user.id!),
                      buttonText: AppStrings.delete,
                      backgroundColor: context.red,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
