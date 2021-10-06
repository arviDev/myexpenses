import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/appbar_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/components/fab_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/components/list_expenses.dart';
import 'package:provider/provider.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  bool _isSearch = false;
  String _filter = '';

  _onPress() {
    setState(() {
      if (_isSearch) {
        _filter = '';
      }
      _isSearch = !_isSearch;
    });
  }

  _onChange(String value) {
    setState(() {
      _filter = value;
    });
  }

  Future<List<Expense>>? expenses;
  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);
    expensesController.queryAll();
    expenses = !_isSearch
        ? expensesController.activeExpense()
        : expensesController.filterExpense(_filter);

    return Scaffold(
      appBar: AppBarCustom(
          isSearch: _isSearch, onChange: _onChange, onPress: _onPress),
      body: ExpensesList(list: expenses!),
      floatingActionButton: const FABCustom(),
    );
  }
}
