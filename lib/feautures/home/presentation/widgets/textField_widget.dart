import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kncha_app/core/constans/constans.dart';
import 'package:kncha_app/core/styles/styles.dart';


class TextFormFieldCustom extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool enabled;
  final bool showError;
  final bool showLoading;
  final bool showFill;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  const TextFormFieldCustom({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.inputFormatters,
    this.suffixIcon,
    this.onChanged,
    this.enabled = true,
    this.showError = false,
    this.showLoading = false,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.fillColor,
    this.showFill = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingLeftFill = showFill ? 10.0 : 00.0;
    return AbsorbPointer(
      absorbing: !enabled,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText, style: textThemeLabelForm),
            const SizedBox(height: 2),
            TextFormField(
              contextMenuBuilder: (BuildContext context,
                  EditableTextState editableTextState){
                return Stack();
              },
              keyboardType: keyboardType,
              autovalidateMode: autovalidateMode,
              obscureText: obscureText,
              controller: controller,
              style: textFormField,
              initialValue: initialValue,
              decoration: InputDecoration(
                filled: !(enabled || showLoading) || showFill,
                fillColor: fillColor ?? ColorConstants.grayBackground,
                contentPadding:
                    EdgeInsets.fromLTRB(paddingLeftFill, 2, 0, 14),
                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                
                hintText: hintText,
                hintStyle: textThemeHintText,
                border: styleInputBorder,
                enabledBorder: styleInputBorder,
                focusedBorder: styleInputBorder,
                errorBorder:
                    showError ? styleInputErrorBorder : styleInputBorder,
                focusedErrorBorder:
                    showError ? styleInputErrorBorder : styleInputBorder,
                errorStyle: showError
                    ? textThemeErrorFormCustom
                    : const TextStyle(height: 0),
              ),
              onSaved: onSaved,
              validator: validator,
              onChanged: onChanged,
              inputFormatters: inputFormatters,
            ),
          ],
        ),
      ),
    );
  }
}
