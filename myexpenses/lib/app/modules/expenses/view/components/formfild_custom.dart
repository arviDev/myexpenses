import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {
  final Function onChange;
  final String hint;
  final dynamic initalValue;
  const TextFormFieldCustom({
    Key? key,
    required this.onChange,
    required this.hint,
    this.initalValue,
  }) : super(key: key);

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    textEditingController.text = widget.initalValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo Obrigatório';
        }
      },
      controller: textEditingController,
      keyboardType:
          widget.hint == 'Valor' ? TextInputType.number : TextInputType.text,
      autofocus: false,
      onChanged: (value) => widget.onChange(value),
      decoration: InputDecoration(
        hintText: widget.hint,
      ),
    );
  }
}
