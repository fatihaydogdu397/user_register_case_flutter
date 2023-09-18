import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_register_case_flutter/core/base/base_view_model.dart';
import 'package:user_register_case_flutter/core/init/locator.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(T viewModel) builder;
  const ViewModelProvider({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: serviceLocator<T>(),
      child: Builder(
        builder: (BuildContext buildContext) {
          return builder(buildContext.read<T>());
        },
      ),
    );
  }
}
