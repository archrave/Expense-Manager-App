import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final Function newTransactionRef;
  // String inputText;
  // String inputCost;

  //This TextEditigController is from flutter to run the controller: function every frame
  NewTransaction(this.newTransactionRef);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textController = TextEditingController();

  final costController = TextEditingController();

  void submitData() {
    final enteredTitle = textController.text;
    final enteredCost = double.parse(costController.text);
    if (enteredTitle.isEmpty || enteredCost <= 0) {
      return;
    }

    widget.newTransactionRef(
      enteredTitle,
      enteredCost,
    );
    //This method closes the top most sheet when called, in our case the modal sheet

    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => submitData(), // _ is a useless variable
                // onChanged: (value) {
                //   inputText = value;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Cost'),
                controller: costController,
                keyboardType: TextInputType.number, //For Android
                onSubmitted: (_) => submitData(), // _ is a useless variable

                //keyboardType: TextInputType.numberWithOptions(decimal: true),     //For iOS
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
                onPressed: () => submitData(),
              ),
            ],
          )),
    );
  }
}
