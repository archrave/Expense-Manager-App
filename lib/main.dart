import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext text) {
    return MaterialApp(
      title: 'Expense Manager',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text("CHART"),
                elevation: 5,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
