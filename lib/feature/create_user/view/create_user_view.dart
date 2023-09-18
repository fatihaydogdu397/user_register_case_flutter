import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_register_case_flutter/core/base/view_model_provider.dart';
import 'package:user_register_case_flutter/core/extensions/edge_insets_functions.dart';
import 'package:user_register_case_flutter/core/localization/app_strings.dart';
import 'package:user_register_case_flutter/core/ui/form_validator/form_validator.dart';
import 'package:user_register_case_flutter/core/ui/style/global_colors.dart';
import 'package:user_register_case_flutter/core/ui/widgets/app_outlined_button_widget.dart';
import 'package:user_register_case_flutter/core/ui/widgets/app_text_form_field.dart';
import 'package:user_register_case_flutter/feature/create_user/model/create_user_view_argument.dart';
import 'package:user_register_case_flutter/feature/create_user/viewmodel/create_user_view_model.dart';
import 'package:provider/provider.dart';

class CreateUserView extends StatefulWidget {
  final CreateUserViewArgument? createUserViewArgument;
  const CreateUserView({super.key, required this.createUserViewArgument});

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateUserViewModel>(
      builder: (createUserViewModel) {
        return Consumer<CreateUserViewModel>(
          builder: (context, createUserViewModel, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: context.red,
                foregroundColor: context.black,
                title: Text(widget.createUserViewArgument?.pageTitle ?? AppStrings.createNewUser),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: createUserViewModel.nameCtrl,
                        labelText: AppStrings.name,
                      ),
                      AppTextFormField(
                        controller: createUserViewModel.surnameCtrl,
                        labelText: AppStrings.surname,
                      ),
                      AppTextFormField(
                        controller: createUserViewModel.phoneNumberCtrl,
                        labelText: AppStrings.phoneNumber,
                      ),
                      AppTextFormField(
                        controller: createUserViewModel.birthDateCtrl,
                        onTap: () {
                          createUserViewModel.selectDate(context);
                        },
                        labelText: AppStrings.birthDate,
                      ),
                      AppTextFormField(
                        controller: createUserViewModel.salaryCtrl,
                        labelText: AppStrings.salary,
                      ),
                      AppTextFormField(
                        controller: createUserViewModel.identityCtrl,
                        labelText: AppStrings.identityNumber,
                        validator: MinLengthValidator(11, errorText: AppStrings.identityValidatorError),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AppOutlinedButton(
                            onPressed: () {
                              createUserViewModel.updateOrCreate(isUpdate: (widget.createUserViewArgument?.isUpdate ?? false));
                            },
                            buttonText: (widget.createUserViewArgument?.isUpdate ?? false) ? AppStrings.update : AppStrings.create),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
