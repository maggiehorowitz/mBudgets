import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return //widget built for each item, so the Card code was moved up here
              Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat().format(transactions[index].date),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }, //takes in a context and index
        itemCount: transactions.length, //required for ListView.builder
        // children: transactions.map((tx) {}).toList(), ///This was used when the "Return Card() code was after and not in a ListBuilder, it was in a ListView"
      ),
    );
  }
}
