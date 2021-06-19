import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  // String inputText;
  // String inputCost;
  final textController = TextEditingController();
  final costController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
      ),
      body: Column(
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
          Card(
            elevation: 5,
            child: Container(
                //margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: textController,
                      // onChanged: (value) {
                      //   inputText = value;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Cost'),
                      controller: costController,
                      // onChanged: (value) {
                      //   inputCost = value;
                      // },
                    ),
                    FlatButton(
                        child: Text(
                          "Add Transaction",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple,
                          ),
                        ),
                        onPressed: () {
                          //   print('Title: $inputText');
                          //   print('Cost: $inputCost');
                          print('Title: ${textController.text}');
                          print('Cost: ${costController.text}');
                        }),
                  ],
                )),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Text('₹${tx.amount.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        )),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          )),
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
