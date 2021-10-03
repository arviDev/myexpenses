import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final Function onChange;
  final String hint;
  const TextFormFieldCustom({
    Key? key,
    required this.onChange,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChange(value),
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
