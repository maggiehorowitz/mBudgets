import 'package:flutter/material.dart';
import './tansaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
