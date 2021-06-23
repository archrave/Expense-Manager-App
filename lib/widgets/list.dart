import 'package:flutter/material.dart';
import '../classes/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,

      //Substitute of Column, ListView needs a specified height to work:-

      /* ListView.builder() gives better performance than normal ListView
      since it only renders the items in the list which are displayed
      on the screen. It also takes different arguments.*/

      child: ListView.builder(
        itemBuilder: (contx, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColorDark, width: 2),
                ),
                child: Text('₹${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: 'Quicksand',
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ],
              )
            ],
          ));
        },
        itemCount: transactions.length,
        //children: transactions.map((tx)   // Don't need a map function now.
      ),
    );
  }
}
