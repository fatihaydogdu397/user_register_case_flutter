import 'package:flutter/cupertino.dart';
import 'package:user_register_case_flutter/core/init/route/route_manager/domain/entity/route.dart';
import 'package:user_register_case_flutter/feature/create_user/model/create_user_view_argument.dart';
import 'package:user_register_case_flutter/feature/create_user/view/create_user_view.dart';
import 'package:user_register_case_flutter/feature/user_list/view/user_list_view.dart';
import 'package:user_register_case_flutter/app.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case appPageRoute:
      return CupertinoPageRoute(settings: settings, builder: (_) => const App());
    case userListPageRoute:
      return CupertinoPageRoute(settings: settings, builder: (_) => const UserListView());
    case userCreatePageRoute:
      final CreateUserViewArgument? createUserViewArgument = settings.arguments as CreateUserViewArgument?;
      return CupertinoPageRoute(settings: settings, builder: (_) => CreateUserView(createUserViewArgument: createUserViewArgument));
    default:
      return CupertinoPageRoute(settings: settings, builder: (_) => const UserListView());
  }
}
