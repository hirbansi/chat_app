import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool submitted;
  final bool? enabled;
  final bool? readonly;
  final bool obscure;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;

  const CommonTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.validator,
    this.inputType,
    this.submitted = true,
    this.enabled,
    this.readonly,
    this.obscure = false,
    this.suffix,
    this.prefix,
    this.controller,
    this.minLines = 1,
    this.onChanged,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines,
    this.inputFormatters,
    this.autofillHints,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      inputFormatters: inputFormatters ?? [],
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        isDense: true,
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
      validator: validator,
      autovalidateMode:
          submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
      keyboardType: inputType,
      onChanged: onChanged,
      enabled: enabled,
      readOnly: readonly ?? false,
      controller: controller,
      obscureText: obscure,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: obscure ? 1 : maxLines,
      minLines: minLines,
    );
  }
}
