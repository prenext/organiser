import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isMarkdownEnabled;
  final bool isMultiline;
  final int maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  StyledTextField({
    required this.controller,
    required this.label,
    this.isMarkdownEnabled = false,
    this.isMultiline = false,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
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
        isMarkdownEnabled
            ? _buildMarkdownTextField()
            : _buildRegularTextField(),
      ],
    );
  }

  Widget _buildMarkdownTextField() {
    return Container(
      child: TextFormField(
        
         decoration: InputDecoration(
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            
          ),
        ),
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: onChanged,
        validator: validator,
      ),
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
      ),
    );
  }
}
