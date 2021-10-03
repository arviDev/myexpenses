import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/formfild_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/components/formfild_data_custom.dart';
import 'package:myexpenses/app/modules/expenses/view/components/formfild_drop_custom.dart';
import 'package:provider/provider.dart';

class ExpenseAddPage extends StatefulWidget {
  const ExpenseAddPage({Key? key}) : super(key: key);

  @override
  _ExpenseAddPageState createState() => _ExpenseAddPageState();
}

class _ExpenseAddPageState extends State<ExpenseAddPage> {
  String? title;
  String? value;
  int? categoryId;
  DateTime? expired;

  _onChangeTitle(String value) {
    setState(() {
      title = value;
    });
  }

  _onChangeValue(String newvalue) {
    setState(() {
      value = newvalue;
    });
  }

  _onChangeCategoryId(int value) {
    setState(() {
      categoryId = value;
    });
  }

  _onChangeExpired(DateTime date) {
    setState(() {
      expired = date;
    });
  }

  Category? category;

  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);

    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Nova Despesa'),
      titleTextStyle: const TextStyle(
        fontSize: 30,
        color: Color(0xFF50514F),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      buttonPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      content: SizedBox(
        width: size.width * 0.8,
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormFieldCustom(onChange: _onChangeTitle, hint: 'Title'),
              TextFormFieldCustom(onChange: _onChangeValue, hint: 'Valor'),
              TextFormFieldDataCustom(
                onChange: _onChangeExpired,
                hint: 'Vencimento',
              ),
              TextFormFieldDropCustom(
                onChange: _onChangeCategoryId,
              ),
              Text(title ?? '1'),
              Text(value ?? '1'),
              Text(categoryId.toString()),
              Text(expired.toString()),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(size.width * 0.2, size.width * 0.1),
            ),
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFFF25F5C),
            ),
          ),
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(size.width * 0.2, size.width * 0.1),
            ),
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFF70C1B3),
            ),
          ),
          child: const Text(
            'Salvar',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            expensesController.createExpense(
                title!, categoryId!, double.parse(value!), expired!);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
