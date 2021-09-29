import 'dart:convert';

class Category {
  String title;
  String color;
  Category({
    required this.title,
    required this.color,
  });

  Category copyWith({
    String? title,
    String? color,
  }) {
    return Category(
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'color': color,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map['title'],
      color: map['color'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(title: $title, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.title == title && other.color == color;
  }

  @override
  int get hashCode => title.hashCode ^ color.hashCode;
}
