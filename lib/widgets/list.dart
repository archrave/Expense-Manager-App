import 'package:flutter/material.dart';
import '../classes/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> straightTransactions;

  TransactionList(this.straightTransactions);

  List<Transaction> get transactions {
    return straightTransactions.reversed
        .toList(); //Just reversed the list so that the latest transaction appears at the top
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text("No transactions added yet.",
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 150,
                  child: Image.asset('images/waiting.png'),
                )
              ],
            )

          //Substitute of Column, ListView needs a specified height to work:-

          /* ListView.builder() gives better performance than normal ListView
      since it only renders the items in the list which are displayed
      on the screen. It also takes different arguments.*/

          : ListView.builder(
              itemBuilder: (contx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '₹${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
              //children: transactions.map((tx)   // Don't need a map function now.
            ),
    );
  }
}
