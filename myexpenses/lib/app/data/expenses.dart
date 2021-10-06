import 'package:flutter/cupertino.dart';
import 'package:myexpenses/app/data/category.dart';
import 'package:myexpenses/app/data/serializer.dart';

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
    title.isNotEmpty
        ? title = value
        : throw ErrorDescription('Text can\'t empty');
  }
}

class ExpensesSerializer implements Serializer<ExpenseData> {
  @override
  ExpenseData fromMap(Map<String, dynamic> map) {
    return ExpenseData(
      id: map['id'],
      title: map['title'],
      value: map['value'],
      category: map['category'],
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
      'isPaidOut': object.paidOut,
      'expireDate': object.expireDate.millisecondsSinceEpoch,
      'isActive': object.active,
    };
  }
}
