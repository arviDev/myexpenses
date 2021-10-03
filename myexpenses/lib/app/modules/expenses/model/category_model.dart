class Category {
  int? id;
  String title;
  String color;
  bool isActive;
  Category({
    this.id,
    required this.title,
    required this.color,
    required this.isActive,
  });

  Category copyWith({
    int? id,
    String? title,
    String? color,
    bool? isActive,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color,
      'isActive': isActive ? 1 : 0,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      color: map['color'],
      isActive: map['isActive'] == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, title: $title, color: $color, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.title == title &&
        other.color == color &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ color.hashCode ^ isActive.hashCode;
  }
}
