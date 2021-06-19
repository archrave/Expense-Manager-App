import 'dart:ffi';

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final Function newTransactionRef;
  // String inputText;
  // String inputCost;

  //This TextEditigController is from flutter to run the controller: function every frame
  final textController = TextEditingController();
  final costController = TextEditingController();

  NewTransaction(this.newTransactionRef);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          //margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: textController, //Value gets saved every frame
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
                    newTransactionRef(
                        textController.text, double.parse(costController.text));
                    print('Title: ${textController.text}');
                    print('Cost: ${costController.text}');
                  }),
            ],
          )),
    );
  }
}
