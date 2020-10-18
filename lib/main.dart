import 'package:flutter/material.dart';
import './widgets/tansaction_list.dart';
import './widgets/new_transaction.dart';

import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mBudget',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Macbook Pro 16-inch',
      amount: 2999.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Macbook Pro 13-inch',
      amount: 1499.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap:
                () {}, //Nothing happens if you click the popup itself, but disappears if you click the background
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,

            ///avoids that tap on space might tap to background
          ); //widget you want to show in the modal sheet
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text('Can I Afford This?'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.teal[300],
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}
