import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/fab_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/page/expense_filter_page.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future<List<Expense>>? expenses;
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController =
        Provider.of<CategoryController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: FutureBuilder(
        initialData: [Category(title: 'Padrão', color: '', isActive: true)],
        future: categoryController.readAllCategory(),
        builder: (BuildContext ctx, AsyncSnapshot<List<Category>> snap) {
          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: snap.data!.length,
            itemBuilder: (_, idx) {
              return Card(
                child: ListTile(
                  title: Text(snap.data![idx].title),
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ExpenseFilterPage(
                          categoryId: snap.data![idx].id!,
                          categoryTitle: snap.data![idx].title,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: const FABCustom(),
    );
  }
}
