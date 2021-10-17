import 'package:flutter/cupertino.dart';
import 'package:myexpenses/app/data/orm_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';

class CategoryController extends ChangeNotifier {
  OrmController ormController;
  String tableName = 'categorys';
  CategoryController({
    required this.ormController,
  });

  void createCategory(String title, String color) async {
    Category newCategory = Category(
      title: title,
      color: color,
      isActive: true,
    );
    insertCategory(newCategory);
  }

  void insertCategory(Category category) {
    Map<String, dynamic> categoryMap = category.toMap();
    ormController.insert(categoryMap, tableName);
    notifyListeners();
  }

  void updateCategory(Category category) {
    Map<String, dynamic> categoryMap = category.toMap();
    ormController.update(categoryMap, tableName);
    notifyListeners();
  }

  void excludeCategory(Category category) {
    Category changedCategory = category.copyWith();
    changedCategory.isActive = false;
    updateCategory(changedCategory);
  }

  Future<Category> readCategory(int id) async {
    List<Category> categorys = await readAllCategory();
    Category category = categorys.where((e) => e.id == id).single;
    return category;
  }

  Future<List<Category>> readAllCategory() async {
    List<Map<String, dynamic>> result = await ormController.read(tableName);
    List<Category> categorys = result.map((e) => Category.fromMap(e)).toList();
    return categorys;
  }

  void changeTitle(String newTitle, Category category) {
    Category changedCategory = category.copyWith();
    changedCategory.title = newTitle;
    updateCategory(changedCategory);
  }

  void changeColor(String newColor, Category category) {
    Category changedCategory = category.copyWith();
    changedCategory.color = newColor;
    updateCategory(changedCategory);
  }
}
