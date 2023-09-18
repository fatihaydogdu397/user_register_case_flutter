import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_register_case_flutter/core/extensions/edge_insets_functions.dart';
import 'package:user_register_case_flutter/core/ui/style/custom_outline_input_border.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const AppTextFormField({
    super.key,
    required this.controller,
    this.onTap,
    required this.labelText,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: validator,
        onTap: onTap,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            contentPadding: REdgeInsets.all(8),
            border: CustomOutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
