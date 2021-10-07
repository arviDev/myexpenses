abstract class ISerializer<T> {
  Map<String, dynamic> toMap(T object);
  T fromMap(Map<String, dynamic> map);
}
