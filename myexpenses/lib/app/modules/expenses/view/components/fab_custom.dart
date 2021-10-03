import 'package:flutter/material.dart';

class FABCustom extends StatelessWidget {
  const FABCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(context, '/addExpense');
      },
    );
  }
}
