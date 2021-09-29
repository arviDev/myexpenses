import 'package:flutter/material.dart';
import 'package:myexpenses/app/app.dart';
import 'package:myexpenses/app/data/hive_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveInit.hiveInit();
  runApp(
    const MyExpenses(),
  );
}
