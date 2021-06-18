import 'package:flutter/material.dart';
import './transaction.dart';

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
  Transaction d;
  final List<Transaction> transactions = [
    Transaction(
        id: 'T1', title: 'Yeezeys', amount: 130000, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'Watchpiece', amount: 100, date: DateTime.now()),
    Transaction(
        id: 'T3', title: 'Toothbrush', amount: 50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    padding: EdgeInsets.all(10),
                    child: Text(tx.amount.toString()),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                    ),
                  ),
                  Column(
                    children: [
                      Text(tx.title),
                      Text(tx.date.toString()),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
