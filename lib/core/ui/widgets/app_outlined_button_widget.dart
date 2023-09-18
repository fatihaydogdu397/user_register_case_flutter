import 'package:flutter/material.dart';
import 'package:user_register_case_flutter/core/extensions/edge_insets_functions.dart';
import 'package:user_register_case_flutter/core/extensions/num_extensions.dart';
import 'package:user_register_case_flutter/core/ui/style/global_colors.dart';
import 'package:user_register_case_flutter/core/ui/style/global_text_styles.dart';

class AppOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String buttonText;
  const AppOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        vertical: 5,
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? context.grey),
          overlayColor: MaterialStateProperty.all(
            backgroundColor ?? context.grey,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(REdgeInsets.all(4)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(buttonText,
              textAlign: TextAlign.center,
              style: context.px16w500.copyWith(
                color: context.white,
              ),
              maxLines: 1),
        ),
      ),
    );
  }
}
