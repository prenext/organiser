import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? trailingIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final bool? autovalidate;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.inputType,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.trailingIcon,
    this.focusNode,
    this.validator,
    this.autovalidate,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<String> state) {
        return TextFormField(
          controller: widget.controller,
          obscureText: _isObscure,
          validator: widget.validator ??
              (value) => _validateInput(value, widget.inputType),
          autocorrect: true,
          autovalidateMode: _hasError || widget.autovalidate == true
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          focusNode: widget.focusNode,
          // autofocus: true,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : Icon(widget.trailingIcon),
            errorText: state.errorText,
          ),
        );
      },
    );
  }

  String? _validateInput(String? value, TextInputType inputType) {
    // Trim leading and trailing spaces from the input value
    value = value?.trim();

    // Check if value is empty after trimming
    if (value == null || value.isEmpty) {
      _hasError = true;
      return 'Please enter your ' + widget.labelText;
    }

    // Custom validation based on inputType
    switch (inputType) {
      case TextInputType.emailAddress:
        // Validate email address
        if (!EmailValidator.validate(value)) {
          _hasError = true;
          return 'Please enter a valid email';
        }
        break;
      // Validate password
      case TextInputType.visiblePassword:
        if (value.length < 8) {
          _hasError = true;
          return 'Password must be 8 characters or more';
        }
        break;
      default:
        return null;
    }
    return null;
  }
}
