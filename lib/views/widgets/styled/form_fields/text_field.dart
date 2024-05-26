import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;
  final bool required;
  final Widget? suffix;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLines;
  final bool? autofocus;

  FormTextField({
    required this.labelText,
    required this.controller,
    this.placeholder,
    this.validator,
    this.required = false,
    this.suffix,
    this.obscureText,
    this.keyboardType,
    this.prefix,
    this.onChanged,
    this.enabled,
    this.readOnly,
    this.maxLines,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: theme.primaryColor,
          ),
        ),
        TextFormField(
          enabled: enabled ?? true,
          readOnly: readOnly ?? false,
          maxLines: maxLines ?? 1,
          autofocus: autofocus ?? false,
          controller: controller,
          validator: (value) {
            if (required && (value == null || value.isEmpty)) {
              return 'Please enter $labelText';
            }
            if (validator != null) {
              return validator!(value);
            }
            return null;
          },
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.primaryColor.withOpacity(0.1),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            hintText: placeholder ?? labelText,
            suffixIcon: suffix,
            suffixIconColor: Theme.of(context).primaryColor,
            suffixStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
            ),
            prefixIcon: prefix,
          ),
        ),
      ],
    );
  }
}
