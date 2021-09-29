import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveInit {
  static void hiveInit() async {
    Directory pathLocation = await getApplicationDocumentsDirectory();
    Hive.init(pathLocation.path);
  }
}
