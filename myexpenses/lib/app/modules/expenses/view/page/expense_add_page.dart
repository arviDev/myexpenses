import 'package:flutter/material.dart';
import 'package:myexpenses/app/modules/expenses/controller/category_controller.dart';
import 'package:myexpenses/app/modules/expenses/controller/expenses_controller.dart';
import 'package:myexpenses/app/modules/expenses/model/category_model.dart';
import 'package:myexpenses/app/modules/expenses/model/expense_model.dart';
import 'package:myexpenses/app/modules/expenses/view/components/drop_custom.dart';
import 'package:provider/provider.dart';

class ExpenseAddPage extends StatefulWidget {
  const ExpenseAddPage({Key? key}) : super(key: key);

  @override
  _ExpenseAddPageState createState() => _ExpenseAddPageState();
}

class _ExpenseAddPageState extends State<ExpenseAddPage> {
  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecValue = TextEditingController();

  DateTime selectDate = DateTime.now();
  Category? category;

  @override
  Widget build(BuildContext context) {
    ExpensesController expensesController =
        Provider.of<ExpensesController>(context);
    CategoryController categoryController =
        Provider.of<CategoryController>(context);

    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030),
      );
      if (picked != null && picked != selectDate) {
        setState(() {
          selectDate = picked;
        });
      }
    }

    _categoryDialog(BuildContext context, String text,
        [String editText = '']) async {
      return showDialog(
        context: context,
        builder: (context) {
          TextEditingController textEditingController = TextEditingController();
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text),
                TextFormField(
                  controller: textEditingController,
                  decoration: const InputDecoration(hintText: ''),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  categoryController.createCategory(
                      textEditingController.text, '2A9D8F');
                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
            ],
          );
        },
      );
    }

    onChangeDropValue(Category value) {
      setState(() {
        category = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Despesas'),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Image(
                    height: 150,
                    width: 150,
                    image: AssetImage('assets/images/expenseAdd.png'),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: tecTitle,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: const Icon(
                              Icons.calendar_today,
                            ),
                          ),
                          hintText: 'Título',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: tecValue,
                        decoration: const InputDecoration(
                          hintText: 'Valor',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: DropCustom(cbValue: onChangeDropValue),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                _categoryDialog(context, 'Adicionar Categoria',
                                    category!.title);
                              },
                              icon: const Center(
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                _categoryDialog(
                                  context,
                                  'Editar Categoria',
                                );
                              },
                              icon: const Center(
                                child: Icon(
                                  Icons.edit,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: CheckboxListTile(
                      title: const Text('Despesa Paga? '),
                      value: false,
                      onChanged: (value) => false,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Vencimento: $selectDate',
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.green[800],
                        ),
                      ),
                      onPressed: () {
                        //expensesController.createExpense(tecTitle.text, category, double.parse(tecValue.text), selectDate)
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
