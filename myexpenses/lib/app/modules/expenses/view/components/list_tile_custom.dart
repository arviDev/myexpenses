import 'package:flutter/material.dart';
import 'package:myexpenses/app/helpers/currency_format.dart';
import 'package:myexpenses/app/helpers/date_format.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:provider/provider.dart';

class ListTileCustom extends StatefulWidget {
  final Expense expense;
  const ListTileCustom({Key? key, required this.expense}) : super(key: key);

  @override
  _ListTileCustomState createState() => _ListTileCustomState();
}

class _ListTileCustomState extends State<ListTileCustom> {
  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);

    return Dismissible(
      background: const Card(
        child: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
        ),
        color: Color(0xFF70C1B3),
      ),
      secondaryBackground: const Card(
        child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        color: Color(0xFFF25F5C),
      ),
      key: UniqueKey(),
      child: Card(
        child: ListTile(
          title: Text(widget.expense.title),
          subtitle:
              Text('Vencimento: ${dateFormat(widget.expense.expireDate)}'),
          trailing: Text(currencyFormat(widget.expense.value)),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          expensesController.changeisPaidOut(true, widget.expense);
        } else {
          expensesController.excludeExpense(widget.expense);
        }
      },
    );
  }
}
