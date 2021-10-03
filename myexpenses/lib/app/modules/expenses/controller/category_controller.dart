import 'package:myexpenses/app/data/data_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';

class CategoryController {
  DataController dataController;
  String tableName = 'categorys';
  CategoryController({
    required this.dataController,
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
    dataController.insert(categoryMap, tableName);
  }

  void editingCategory(Category category) {
    Map<String, dynamic> categoryMap = category.toMap();
    dataController.update(categoryMap, tableName);
  }

  void excludeCategory(Category category) {
    Map<String, dynamic> categoryMap = category.toMap();
    dataController.delete(categoryMap, tableName);
  }

  Future<Category> readCategory(int id) async {
    List<Category> categorys = await readAllCategory();
    Category category = categorys.where((e) => e.id == id).single;
    return category;
  }

  Future<List<Category>> readAllCategory() async {
    List<Map<String, dynamic>> result = await dataController.read(tableName);
    List<Category> categorys = result.map((e) => Category.fromMap(e)).toList();
    return categorys;
  }

  void changeTitle(String newTitle, Category category) {
    Category changeCategory = category.copyWith();
    changeCategory.title = newTitle;
    Map<String, dynamic> categoryMap = changeCategory.toMap();
    dataController.update(categoryMap, tableName);
  }

  void changeColor(String newColor, Category category) {
    Category changeCategory = category.copyWith();
    changeCategory.color = newColor;
    Map<String, dynamic> categoryMap = changeCategory.toMap();
    dataController.update(categoryMap, tableName);
  }
}
