import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {

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
                const ListTile(
                  leading: Text("+50\nXLM", textAlign: TextAlign.center, style: TextStyle(color: Colors.green)),
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