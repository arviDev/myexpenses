import 'package:flutter/material.dart';

class TextFormFieldDataCustom extends StatefulWidget {
  final Function onChange;
  final String hint;
  const TextFormFieldDataCustom({
    Key? key,
    required this.onChange,
    required this.hint,
  }) : super(key: key);

  @override
  State<TextFormFieldDataCustom> createState() =>
      _TextFormFieldDataCustomState();
}

class _TextFormFieldDataCustomState extends State<TextFormFieldDataCustom> {
  DateTime selectDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030),
      );
      if (picked != null && picked != selectDate) {
        widget.onChange(picked);
        setState(() {
          selectDate = picked;
          _textEditingController.text = picked.toString();
        });
      }
    }

    return TextFormField(
      onChanged: (value) => _textEditingController.text = value,
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: IconButton(
          icon: const Icon(Icons.date_range),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
    );
  }
}
