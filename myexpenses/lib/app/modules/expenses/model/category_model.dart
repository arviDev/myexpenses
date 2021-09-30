import 'dart:convert';

class Category {
  int id;
  String title;
  String color;
  Category({
    required this.id,
    required this.title,
    required this.color,
  });

  Category copyWith({
    int? id,
    String? title,
    String? color,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, title: $title, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.title == title &&
        other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ color.hashCode;
}
