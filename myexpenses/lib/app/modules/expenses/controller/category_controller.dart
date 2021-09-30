import 'package:myexpenses/app/data/data_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';

class CategoryController {
  DataController dataController;
  String tableName = 'category';
  CategoryController({
    required this.dataController,
  });

  void createCategory(String title, String color) {
    Category newCategory = Category(
      id: 0,
      title: title,
      color: color,
    );
    editingCategory(newCategory);
  }

  int idController() {
    List<Category> allCategorys = readAllCategory();
    if (allCategorys.isNotEmpty) {
      return allCategorys.last.id++;
    } else {
      return 0;
    }
  }

  void editingCategory(Category category) {
    Category newCategory = category.copyWith();
    newCategory.id = idController();
    Map<String, dynamic> categoryMap = newCategory.toMap();
    dataController.update(newCategory.id, categoryMap, tableName);
  }

  void excludeCategory(Category category) {
    dataController.delete(tableName, category.id);
  }

  Category readCategory(int id) {
    Category foundCategory = readAllCategory().where((e) => e.id == id).single;
    return foundCategory;
  }

  List<Category> readAllCategory() {
    List<Category> categorys = dataController
        .readAll(tableName)
        .map((e) => Category.fromMap(e))
        .toList();
    return categorys;
  }

  void changeTitle(String newTitle, Category category) {
    Category changeCategory = category.copyWith();
    changeCategory.title = newTitle;
    Map<String, dynamic> categoryMap = changeCategory.toMap();
    dataController.update(category.id, categoryMap, tableName);
  }

  void changeColor(String newColor, Category category) {
    Category changeCategory = category.copyWith();
    changeCategory.color = newColor;
    Map<String, dynamic> categoryMap = changeCategory.toMap();
    dataController.update(category.id, categoryMap, tableName);
  }
}
