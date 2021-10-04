import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/fab_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/components/filter_expenses.dart';

class ExpenseFilterPage extends StatefulWidget {
  final String categoryTitle;
  final int categoryId;
  const ExpenseFilterPage(
      {Key? key, required this.categoryTitle, required this.categoryId})
      : super(key: key);

  @override
  _ExpenseFilterPageState createState() => _ExpenseFilterPageState();
}

class _ExpenseFilterPageState extends State<ExpenseFilterPage> {
  Future<List<Expense>>? expenses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle)),
      body: FilterExpenses(categoryId: widget.categoryId),
      floatingActionButton: const FABCustom(),
    );
  }
}
