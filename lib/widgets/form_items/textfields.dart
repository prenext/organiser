import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isMultiline;
  final int maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function()? onLeadingIconTap;
  final void Function()? onTrailingIconTap;

  StyledTextField({
    required this.controller,
    required this.label,
    this.isMultiline = false,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingIconTap,
    this.onTrailingIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        _buildRegularTextField(),
      ],
    );
  }

  Widget _buildRegularTextField() {
    return TextFormField(
      controller: controller,
      keyboardType: isMultiline ? TextInputType.multiline : TextInputType.text,
      maxLines: isMultiline ? maxLines : 1,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        prefixIcon: leadingIcon != null
            ? GestureDetector(
                onTap: onLeadingIconTap,
                child: Icon(leadingIcon),
              )
            : null,
        suffixIcon: trailingIcon != null
            ? GestureDetector(
                onTap: onTrailingIconTap,
                child: Icon(trailingIcon),
              )
            : null,
      ),
    );
  }
}


class BottomBorderTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final TextInputType inputType;

  BottomBorderTextField({
    required this.controller,
    required this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(leadingIcon),
          suffixIcon: Icon(trailingIcon),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class AutocompleteTextField<T extends Object> extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final List<T> autocompleteList;
  final String? Function(T?) autocompleteLabelBuilder;
  final void Function(T?)? onAutocompleteSelected;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function()? onLeadingIconTap;
  final void Function()? onTrailingIconTap;

  AutocompleteTextField({
    required this.controller,
    required this.label,
    required this.autocompleteList,
    required this.autocompleteLabelBuilder,
    this.onAutocompleteSelected,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingIconTap,
    this.onTrailingIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAutocompleteTextField(),
      ],
    );
  }

  Widget _buildAutocompleteTextField() {
    return Autocomplete<T>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return autocompleteList
            .where((item) => autocompleteLabelBuilder(item)!
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            .toList();
      },
      onSelected: onAutocompleteSelected,
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return StyledTextField(
          controller: textEditingController,
          isMultiline: false,
          maxLines: 1,
          onChanged: (value) {},
          validator: (value) {
            return null;
          },
          leadingIcon: leadingIcon,
          trailingIcon: trailingIcon,
          onLeadingIconTap: onLeadingIconTap,
          onTrailingIconTap: onTrailingIconTap,
          label: label,
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<T> onSelected, Iterable<T> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView(
                children: options
                    .map((item) => ListTile(
                          title: Text(autocompleteLabelBuilder(item) ?? ''),
                          onTap: () {
                            onSelected(item);
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}


