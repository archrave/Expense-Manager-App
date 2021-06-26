import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _textController = TextEditingController();
  final _costController = TextEditingController();
  DateTime _selectedDate;
  void submitData() {
    final enteredTitle = _textController.text;
    final enteredCost = double.parse(_costController.text);
    if (enteredTitle.isEmpty || enteredCost <= 0 || _selectedDate == n) {
      return;
    }

    widget.newTransactionRef(
      enteredTitle,
      enteredCost,
    );
    //This method closes the top most sheet when called, in our case the modal sheet
    Navigator.of(context).pop();
  }

  void _pickDate() {
    //This showDatePicker function returns an object of the 'Future' class in dart
    // This Future object has a then() method
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedValue) {
      if (pickedValue == null) return;
      setState(() {
        _selectedDate = pickedValue;
      });
    });
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
                controller: _textController, //Value gets saved every frame
                onSubmitted: (_) => submitData(), // _ is a useless variable
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Cost'),
                controller: _costController,
                keyboardType: TextInputType.number, //For Android
                onSubmitted: (_) => submitData(), // _ is a useless variable

                //keyboardType: TextInputType.numberWithOptions(decimal: true),     //For iOS
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? "No Date Chosen"
                          : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}"),
                    ),
                    FlatButton(
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _pickDate,
                    )
                  ],
                ),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () => submitData(),
              ),
            ],
          )),
    );
  }
}
