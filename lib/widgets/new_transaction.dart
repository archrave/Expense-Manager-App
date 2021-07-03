import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './adaptivebutton.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //const NewTransaction({Key? key}) : super(key: key);

  final Function newTransactionRef;

  //This TextEditigController is from flutter to run the controller: function every frame
  NewTransaction(this.newTransactionRef);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _textController = TextEditingController();
  final _costController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    final enteredTitle = _textController.text;
    final enteredCost = double.parse(_costController.text);
    if (enteredTitle.isEmpty || enteredCost <= 0) {
      return;
    }

    widget.newTransactionRef(
      enteredTitle,
      enteredCost,
      _selectedDate,
    );
    //This method closes the top most sheet when called, in our case the modal sheet
    Navigator.of(context).pop();
  }

  void _pickDate() {
    // This showDatePicker function returns an object of the 'Future' class in dart
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
    return SingleChildScrollView(
      //Now the bottomModalSheet is scrollable
      child: Card(
        elevation: 5,
        child: Container(
            //margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              //viewInsets tells us about anything lapping our view, in this case, the keyboard
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
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
                        child: Text(DateFormat.yMd().format(_selectedDate) ==
                                DateFormat.yMd().format(DateTime.now())
                            ? "Date: ${DateFormat.yMd().format(_selectedDate)} (Today)"
                            : "Date: ${DateFormat.yMd().format(_selectedDate)}"),
                      ),
                      AdaptiveFlatButton("Choose Date", _pickDate),
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
      ),
    );
  }
}
