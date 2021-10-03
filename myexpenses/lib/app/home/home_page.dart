import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/view/components/fab_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/page/expense_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my expenses'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const ExpensePage(),
      floatingActionButton: const FABCustom(),
    );
  }
}
