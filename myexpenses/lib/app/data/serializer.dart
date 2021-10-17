abstract class ISerializer<T> {
  Map<String, dynamic> toMap(T object);
  Future<T> fromMap(Map<String, dynamic> map);
}
