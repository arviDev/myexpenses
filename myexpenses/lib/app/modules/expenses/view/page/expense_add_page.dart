import 'package:flutter/material.dart';

class ExpenseAddPage extends StatefulWidget {
  const ExpenseAddPage({Key? key}) : super(key: key);

  @override
  _ExpenseAddPageState createState() => _ExpenseAddPageState();
}

class _ExpenseAddPageState extends State<ExpenseAddPage> {
  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Despesas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage('assets/images/expense.png'),
              ),
            ),
            TextFormField(
              controller: tecTitle,
            ),
            TextFormField(
              controller: tecValue,
            ),
            const Text('23/05/2021'),
            Row(
              children: [
                const Text('Despesa Paga?'),
                Checkbox(value: false, onChanged: (value) => false),
              ],
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
