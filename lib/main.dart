import 'package:flutter/material.dart';
import './classes/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/list.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext text) {
    return MaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.blueGrey,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [];

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      /*   .add function is used since that list object can be changed, 
        but the value inside _userTransactions (pointer) cannnot be changed 
        since final is used   */
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses Manager'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddTransaction(context),
            ),
          ],
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
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddTransaction(context),
        ));
  }
}
