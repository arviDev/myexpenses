import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/drop_custom.dart';
import 'package:provider/provider.dart';

class TextFormFieldDropCustom extends StatefulWidget {
  final Function onChange;
  const TextFormFieldDropCustom({Key? key, required this.onChange})
      : super(key: key);

  @override
  State<TextFormFieldDropCustom> createState() =>
      _TextFormFieldDropCustomState();
}

class _TextFormFieldDropCustomState extends State<TextFormFieldDropCustom> {
  Category? category;

  _onChangeCategory(Category value) {
    category = value;
    widget.onChange(value.id);
  }

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Provider.of<CategoryController>(context);

    _categoryDialog(BuildContext context, String text,
        [String editText = '']) async {
      return showDialog(
        context: context,
        builder: (context) {
          TextEditingController textEditingController = TextEditingController();
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text),
                TextFormField(
                  controller: textEditingController,
                  decoration: const InputDecoration(hintText: ''),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  categoryController.createCategory(
                      textEditingController.text, '2A9D8F');
                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
            ],
          );
        },
      );
    }

    return Row(
      children: [
        Expanded(
          flex: 70,
          child: DropCustom(onChange: _onChangeCategory),
        ),
        Expanded(
          flex: 15,
          child: IconButton(
            onPressed: () {
              _categoryDialog(context, 'Adicionar Categoria', category!.title);
            },
            icon: const Center(
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: IconButton(
            onPressed: () {
              _categoryDialog(
                context,
                'Editar Categoria',
              );
            },
            icon: const Center(
              child: Icon(
                Icons.edit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
