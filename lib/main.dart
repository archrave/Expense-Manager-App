import 'package:flutter/material.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
      ),
      body: Column(
        children: [
          Card(
            child: Text("CHART"),
          ),
          Card(
            child: Text("List of Expenses:"),
          ),
        ],
      ),
    ));
  }
}
