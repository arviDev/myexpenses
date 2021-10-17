import 'package:myexpenses/app/data/category_controller.dart';
import 'package:myexpenses/app/data/orm_controller.dart';
import 'package:myexpenses/app/data/serializer.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';

class Expense {
  int id;
  String title;
  double value;
  Category? category;
  bool paidOut;
  DateTime expireDate;
  bool active;
  Expense({
    required this.id,
    required this.title,
    required this.value,
    this.category,
    required this.paidOut,
    required this.expireDate,
    required this.active,
  });
}

abstract class IExpense {
  void setTitle(String value);
  // void setValue(double value);
  // bool isActive();
}

abstract class DataObjectTransform<T> {
  // int toInt(bool value);
  // bool fromInt(int value);
  int toId(T object);
  T fromId(int id);
}

class ExpenseData extends Expense implements IExpense {
  ExpenseData({
    int? id,
    String? title,
    double? value,
    Category? category,
    bool? paidOut,
    DateTime? expireDate,
    bool? active,
  }) : super(
          id: id!,
          title: title!,
          value: value!,
          category: category!,
          paidOut: paidOut!,
          expireDate: expireDate!,
          active: active!,
        );

  @override
  void setTitle(String value) {
    title.isNotEmpty ? title = value : throw ErrorHint('Text can\'t empty');
  }
}

class ExpensesSerializer implements ISerializer<ExpenseData> {
  final CategoryController _categoryController =
      CategoryController(ormController: OrmController());

  @override
  Future<ExpenseData> fromMap(Map<String, dynamic> map) async {
    return ExpenseData(
      id: map['id'],
      title: map['title'],
      value: map['value'],
      category: await _categoryController.readCategory(map['id']),
      paidOut: map['isPaidOut'] == 1 ? true : false,
      expireDate: DateTime.fromMillisecondsSinceEpoch(map['expireDate']),
      active: map['isActive'] == 1 ? true : false,
    );
  }

  @override
  Map<String, dynamic> toMap(ExpenseData object) {
    return {
      'id': object.id,
      'title': object.title,
      'value': object.value,
      'categoryId': object.category,
      'isPaidOut': object.paidOut ? 1 : 0,
      'expireDate': object.expireDate.millisecondsSinceEpoch,
      'isActive': object.active ? 1 : 0,
    };
  }
}
