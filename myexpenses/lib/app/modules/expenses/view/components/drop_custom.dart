import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:provider/provider.dart';

class DropCustom extends StatelessWidget {
  final Function cbValue;
  const DropCustom({Key? key, required this.cbValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Provider.of<CategoryController>(context);
    return FutureBuilder(
      future: categoryController.readAllCategory(),
      builder: (_, AsyncSnapshot<List<Category>> snap) {
        if (snap.hasData) {
          return DropdownButtonFormField<Category>(
            value: snap.data!.first,
            onChanged: (value) {
              cbValue(value);
            },
            items: List.generate(
              snap.data!.length,
              (idx) => DropdownMenuItem(
                value: snap.data![idx],
                child: Text(snap.data![idx].title),
              ),
            ),
          );
        } else {
          return DropdownButtonFormField(
            items: const [
              DropdownMenuItem(
                child: Text('Sem data'),
              ),
            ],
          );
        }
      },
    );
  }
}
