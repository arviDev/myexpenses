import 'package:flutter/material.dart';
import 'package:myexpenses/app/helpers/date_format.dart';

class TextFormFieldDataCustom extends StatefulWidget {
  final Function onChange;
  final String hint;
  final dynamic initialValue;
  const TextFormFieldDataCustom({
    Key? key,
    required this.onChange,
    required this.hint,
    this.initialValue,
  }) : super(key: key);

  @override
  State<TextFormFieldDataCustom> createState() =>
      _TextFormFieldDataCustomState();
}

class _TextFormFieldDataCustomState extends State<TextFormFieldDataCustom> {
  DateTime selectDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    var k = widget.initialValue != null ? dateFormat(widget.initialValue) : '';
    _textEditingController.text = k;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        //locale: const Locale('pt', 'BR'),
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030),
      );
      if (picked != null && picked != selectDate) {
        widget.onChange(picked);
        setState(() {
          selectDate = picked;
          _textEditingController.text = dateFormat(picked);
        });
      }
    }

    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatório';
        }
      },
      autofocus: false,
      keyboardType: TextInputType.none,
      onChanged: (value) =>
          _textEditingController.text = dateFormat(DateTime.parse(value)),
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
