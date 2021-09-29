import 'package:hive/hive.dart';

class DataController {
  void create() {}
  void open(String boxName) async {
    await Hive.openBox(boxName);
  }

  void update(dynamic key, Map<String, dynamic> map, String boxName) {
    Box<Map<String, dynamic>> box = Hive.box<Map<String, dynamic>>(boxName);
    box.put(key, map);
  }

  Map<String, dynamic> read(String boxName, dynamic key) {
    Box<Map<String, dynamic>> box = Hive.box<Map<String, dynamic>>(boxName);
    return box.get(key, defaultValue: {'defalt': 'No find values'})!;
  }

  List<Map<String, dynamic>> readAll(String boxName) {
    Box<Map<String, dynamic>> box = Hive.box<Map<String, dynamic>>(boxName);
    return box.values.toList();
  }

  void delete(String boxName, dynamic key) {
    Box<Map<String, dynamic>> box = Hive.box<Map<String, dynamic>>(boxName);
    box.delete(key);
  }

  void deleteBox(String boxName, dynamic key) {
    Box<Map<String, dynamic>> box = Hive.box<Map<String, dynamic>>(boxName);
    box.deleteFromDisk();
  }
}
