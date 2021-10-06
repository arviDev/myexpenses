abstract class Data {
  Future<void> insert(Map<String, dynamic> map, String docName);
  Future<void> delete(Map<String, dynamic> map, String docName);
  Future<void> update(Map<String, dynamic> map, String docName);
  Future<List<Map<String, dynamic>>> read(String docName);
}
