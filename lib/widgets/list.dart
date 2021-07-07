import 'package:flutter/material.dart';
import '../classes/transaction.dart';
import './listitem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> straightTransactions;
  final Function dltTransaction;
  TransactionList(this.straightTransactions, this.dltTransaction);

  List<Transaction> get transactions {
    return straightTransactions.reversed
        .toList(); //Just reversed the list so that the latest transaction appears at the top
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text("No transactions added yet.",
                      style: Theme.of(context).textTheme.title),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('images/waiting.png'),
                  )
                ],
              );
            })

          //Substitute of Column, ListView needs a specified height to work:-

          /* ListView.builder() gives better performance than normal ListView
      since it only renders the items in the list which are displayed
      on the screen. It also takes different arguments.*/

          : ListView.builder(
              itemBuilder: (contx, index) {
                return ListItem(
                    transaction: transactions[index],
                    dltTransaction: dltTransaction);
              },
              itemCount: transactions.length,
              //children: transactions.map((tx)   // Don't need a map function now.
            ),
    );
  }
}
