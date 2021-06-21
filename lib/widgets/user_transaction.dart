import 'package:flutter/material.dart';
import './list.dart';
import './new_transaction.dart';
import '../classes/transaction.dart';

/*  This file/Stateful Widget is just there to
 manage our new transaction and the list of transaction widgets
 since this is a stateful widget and 'HomePage' in our main is
 a stateless one.   */

class UserTransactions extends StatefulWidget {
  // const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'T1', title: 'Pizza', amount: 130, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'Watchpiece', amount: 1000, date: DateTime.now()),
    Transaction(
        id: 'T3', title: 'Toothbrush', amount: 50, date: DateTime.now()),
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      /*   .add function used since that list object can be changed, 
        but the value inside _userTransactions (pointer) cannnot be changed 
        since final is used   */
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
