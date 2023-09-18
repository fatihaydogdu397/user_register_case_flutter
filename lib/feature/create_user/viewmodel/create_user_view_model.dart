import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/base/base_view_model.dart';
import 'package:user_register_case_flutter/core/extensions/date_time_extensions.dart';
import 'package:user_register_case_flutter/core/init/locator.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/data/route_manager.dart';
import 'package:user_register_case_flutter/core/localization/language_view_model.dart';
import 'package:user_register_case_flutter/feature/create_user/service/i_user_create_service.dart';
import 'package:user_register_case_flutter/feature/user_list/model/user_model/user_model.dart';
import 'package:user_register_case_flutter/feature/user_list/viewmodel/user_list_view_model.dart';
import 'package:intl/intl.dart';

class CreateUserViewModel extends BaseViewModel {
  final IUserCreateService _iUserCreateService;
  CreateUserViewModel(this._iUserCreateService) {
    _init();
  }
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController surnameCtrl = TextEditingController();
  TextEditingController birthDateCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController salaryCtrl = TextEditingController();
  TextEditingController identityCtrl = TextEditingController();

  DateTime? selectedBirthDate;

  var outputFormat = DateFormat('d MMMM yyyy', serviceLocator<LanguageSettingsProvider>().languageCode.value);

  UserModel? updateUserModel;

  void _init() {
    selectedBirthDate = updateUserModel?.birthDate ?? DateTime.now();
    if (serviceLocator<UserListViewModel>().selectedUser != null) {
      updateUserModel = serviceLocator<UserListViewModel>().selectedUser;
      nameCtrl = TextEditingController(text: updateUserModel?.name ?? "");
      surnameCtrl = TextEditingController(text: updateUserModel?.surname ?? "");
      birthDateCtrl = TextEditingController(text: updateUserModel?.birthDate.dMMMMYYYY ?? "");
      phoneNumberCtrl = TextEditingController(text: updateUserModel?.phoneNumber ?? "");
      salaryCtrl = TextEditingController(text: updateUserModel?.salary ?? "");
      identityCtrl = TextEditingController(text: updateUserModel?.identityNumber ?? "");
    }
    refreshView();
  }

  Future<void> selectDate(BuildContext context) async {
    selectedBirthDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );
    birthDateCtrl.text = (selectedBirthDate ?? DateTime.now()).dMMMMYYYY;
    refreshView();
  }

  Future<void> updateOrCreate({required bool isUpdate}) async {
    if (isUpdate) {
      await updateUser();
    } else {
      await createUser();
    }

    serviceLocator<UserListViewModel>().fetchUserList();
    Go.to.back();
  }

  Future<void> updateUser() async {
    var user = UserModel(
        id: updateUserModel?.id ?? "",
        name: nameCtrl.text,
        surname: surnameCtrl.text,
        birthDate: outputFormat.parse(birthDateCtrl.text),
        phoneNumber: phoneNumberCtrl.text,
        identityNumber: identityCtrl.text,
        salary: salaryCtrl.text);
    await _iUserCreateService.updateUser(user: user);
  }

  Future<void> createUser() async {
    var user = UserModel(
        name: nameCtrl.text,
        surname: surnameCtrl.text,
        birthDate: outputFormat.parse(birthDateCtrl.text),
        phoneNumber: phoneNumberCtrl.text,
        identityNumber: identityCtrl.text,
        salary: salaryCtrl.text);
    await _iUserCreateService.createUser(user: user);
  }
}
