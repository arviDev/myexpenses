import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:provider/provider.dart';

class DropCustom extends StatelessWidget {
  final Function onChange;
  const DropCustom({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Provider.of<CategoryController>(context);
    return FutureBuilder(
      initialData: [Category(title: 'Padrão', color: '', isActive: true)],
      future: categoryController.readAllCategory(),
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snap) {
        return DropdownButtonFormField<Category>(
          hint: const Text('Categoria...'),
          onChanged: (value) => onChange(value),
          items: List.generate(
            snap.data!.length,
            (idx) => DropdownMenuItem(
              value: snap.data![idx],
              child: Text(snap.data![idx].title),
            ),
          ),
        );
      },
    );
  }
}
