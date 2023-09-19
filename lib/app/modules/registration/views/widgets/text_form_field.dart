import 'package:flutter/material.dart';
import 'package:sentiapractice/app/modules/registration/values/dimens.dart';
import 'package:sentiapractice/app/modules/registration/values/pallet.dart';

class FormWidgetStyles {
  static const TextStyle inputFieldTextStyle = TextStyle(
    fontSize: Dimen.formTextSize,
    color: Pallet.formText,
  );

  static OutlineInputBorder inputFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimen.formFieldRadius),
    borderSide: const BorderSide(
      color: Pallet.formFieldStroke,
      width: 1.0,
    ),
  );

  static InputDecoration inputFieldDecoration = InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.only(
      left: 8,
      right: 8,
      top: 8,
      bottom: 8,
    ),
    hintStyle: const TextStyle(
      fontSize: Dimen.formTextSize,
      color: Pallet.formHintText,
    ),
    suffixStyle: const TextStyle(
      fontSize: Dimen.formTextSize,
      color: Pallet.formPrefixSuffixText,
    ),
    border: inputFieldBorder,
    enabledBorder: inputFieldBorder,
    filled: true,
    fillColor: Pallet.formFieldFillColor,
  );

  static InputDecoration inputFieldDecorationWithAddRemove(
      TextEditingController editingController) {
    return FormWidgetStyles.inputFieldDecoration.copyWith(
        // suffixIcon: Padding(
        //   padding: const EdgeInsets.only(right: 8),
        //   child: InkWell(
        //     onTap: () async {
        //       String currentText = editingController.text;
        //       int currentValue = int.tryParse(currentText) ?? 0;
        //       int newValue = currentValue + 1;
        //       editingController.text = newValue.toString();
        //     },
        //     child: const Icon(
        //       Icons.add,
        //       color: Pallet.formHintText,
        //     ),
        //   ),
        // ),
        // suffixIconConstraints: const BoxConstraints(
        //   minWidth: 0,
        //   minHeight: 0,
        // ),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(left: 8),
        //   child: InkWell(
        //     onTap: () async {
        //       String currentText = editingController.text;
        //       int currentValue = int.tryParse(currentText) ?? 0;
        //       int newValue = currentValue;
        //       if (currentValue != 0) {
        //         newValue--;
        //       }
        //       editingController.text = newValue.toString();
        //     },
        //     child: const Icon(
        //       Icons.remove,
        //       color: Pallet.formHintText,
        //     ),
        //   ),
        // ),
        // prefixIconConstraints: const BoxConstraints(
        //   minWidth: 0,
        //   minHeight: 0,
        // ),
        );
  }

  static EdgeInsetsGeometry inputFieldPaddingLTR = const EdgeInsets.only(
    top: Dimen.formFieldSpace,
    right: Dimen.formFieldSpace,
    left: Dimen.formFieldSpace,
  );
}
