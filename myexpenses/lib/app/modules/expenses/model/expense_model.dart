import 'dart:convert';

import 'package:myexpenses/app/modules/expenses/model/category_model.dart';

class Expense {
  int id;
  String title;
  double value;
  Category category;
  bool paidOut;
  DateTime expire;
  Expense({
    required this.id,
    required this.title,
    required this.value,
    required this.category,
    required this.paidOut,
    required this.expire,
  });

  Expense copyWith({
    int? id,
    String? title,
    double? value,
    Category? category,
    bool? paidOut,
    DateTime? expire,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      category: category ?? this.category,
      paidOut: paidOut ?? this.paidOut,
      expire: expire ?? this.expire,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'category': category.toMap(),
      'paidOut': paidOut,
      'expire': expire.millisecondsSinceEpoch,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      value: map['value'],
      category: Category.fromMap(map['category']),
      paidOut: map['paidOut'],
      expire: DateTime.fromMillisecondsSinceEpoch(map['expire']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, value: $value, category: $category, paidOut: $paidOut, expire: $expire)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.id == id &&
        other.title == title &&
        other.value == value &&
        other.category == category &&
        other.paidOut == paidOut &&
        other.expire == expire;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        value.hashCode ^
        category.hashCode ^
        paidOut.hashCode ^
        expire.hashCode;
  }
}
