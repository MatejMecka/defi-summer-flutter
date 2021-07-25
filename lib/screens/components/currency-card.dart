import 'package:defi_summer/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  TransactionCard({Key? key, required this.transaction}): super(key: key);

  Transaction transaction;

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Text("${widget.transaction.balance} \n ${widget.transaction.assetCode}", textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
                  title: Text('Transaction Recived!', textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
                  subtitle: Text('You have received 50 XLM on 05.07.2021', textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('View'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ]
            )
        ),
    );
  }
}