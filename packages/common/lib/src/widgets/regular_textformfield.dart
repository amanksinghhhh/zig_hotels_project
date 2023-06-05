import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularTextFormField extends StatelessWidget {
  RegularTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.numKeyboard = false,
    required this.validation,
  }) : super(key: key);

  final hintText;
  final TextEditingController controller;
  final bool? numKeyboard;
  final Function(String?) validation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      keyboardType:
          (numKeyboard == true) ? TextInputType.number : TextInputType.text,
      validator: (value) => validation(value),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      style: theme.textTheme.titleMedium
          ?.copyWith(color: theme.zigHotelsColors.onPrimary),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.zigHotelsColors.onBackground.withOpacity(0.55),
        border: _OutlineInputBorder(),
        focusedBorder: _OutlineInputBorder(),
        enabledBorder: _OutlineInputBorder(),
        focusedErrorBorder: _OutlineInputBorder(),
        disabledBorder: _OutlineInputBorder(),
        errorBorder: _OutlineInputBorder(),
        // hintText: hintText,
        // hintStyle: theme.textTheme.titleMedium?.copyWith(
        //   color: theme.zigHotelsColors.onSurfaceVariant,
        // ),
         label: Text(hintText),
         labelStyle: theme.textTheme.titleMedium?.copyWith(
           color: theme.zigHotelsColors.onSurfaceVariant,
         ),
      ),
    );
  }

  OutlineInputBorder _OutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
