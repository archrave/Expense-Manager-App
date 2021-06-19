import 'package:flutter/material.dart';
import '../classes/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
