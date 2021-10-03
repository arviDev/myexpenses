import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/view/components/expense_add_dialog.dart';

class FABCustom extends StatelessWidget {
  const FABCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const ExpenseAddPage(),
        );
      },
    );
  }
}
