class Expense {
  int? id;
  String title;
  double value;
  int categoryId;
  bool isPaidOut;
  DateTime expireDate;
  bool isActive;
  Expense({
    this.id,
    required this.title,
    required this.value,
    required this.categoryId,
    required this.isPaidOut,
    required this.expireDate,
    required this.isActive,
  });

  Expense copyWith({
    int? id,
    String? title,
    double? value,
    int? categoryId,
    bool? isPaidOut,
    DateTime? expireDate,
    bool? isActive,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      categoryId: categoryId ?? this.categoryId,
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
      'categoryId': categoryId,
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
      categoryId: map['categoryId'],
      isPaidOut: map['isPaidOut'] == 1 ? true : false,
      expireDate: DateTime.fromMillisecondsSinceEpoch(map['expireDate']),
      isActive: map['isActive'] == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, value: $value, category: $categoryId, isPaidOut: $isPaidOut, expireDate: $expireDate, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.id == id &&
        other.title == title &&
        other.value == value &&
        other.categoryId == categoryId &&
        other.isPaidOut == isPaidOut &&
        other.expireDate == expireDate &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        value.hashCode ^
        categoryId.hashCode ^
        isPaidOut.hashCode ^
        expireDate.hashCode ^
        isActive.hashCode;
  }
}
