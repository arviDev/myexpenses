import 'package:myexpenses/app/modules/expenses/model/category_model.dart';

class Expense {
  int id;
  String title;
  double value;
  Category category;
  bool isPaidOut;
  DateTime expireDate;
  bool isActive;
  Expense({
    required this.id,
    required this.title,
    required this.value,
    required this.category,
    required this.isPaidOut,
    required this.expireDate,
    required this.isActive,
  });

  Expense copyWith({
    int? id,
    String? title,
    double? value,
    Category? category,
    bool? isPaidOut,
    DateTime? expireDate,
    bool? isActive,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      category: category ?? this.category,
      isPaidOut: isPaidOut ?? this.isPaidOut,
      expireDate: expireDate ?? this.expireDate,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'category': category.toMap(),
      'isPaidOut': isPaidOut ? 1 : 0,
      'expireDate': expireDate.millisecondsSinceEpoch,
      'isActive': isActive ? 1 : 0,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      value: map['value'],
      category: Category.fromMap(map['category']),
      isPaidOut: map['isPaidOut'],
      expireDate: DateTime.fromMillisecondsSinceEpoch(map['expireDate']),
      isActive: map['isActive'],
    );
  }

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, value: $value, category: $category, isPaidOut: $isPaidOut, expireDate: $expireDate, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.id == id &&
        other.title == title &&
        other.value == value &&
        other.category == category &&
        other.isPaidOut == isPaidOut &&
        other.expireDate == expireDate &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        value.hashCode ^
        category.hashCode ^
        isPaidOut.hashCode ^
        expireDate.hashCode ^
        isActive.hashCode;
  }
}
