// @dart=2.9
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class NewAccountPage extends StatefulWidget {
  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  
  KeyPair keyPair = KeyPair.random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          QrImage(
              data: keyPair.accountId,
              version: QrVersions.auto,
              size: 200.0,
          ),
            Text("Public Key: ${keyPair.accountId}"),
            SizedBox(height: 5.0),
            Text("Secret Key: ${keyPair.secretSeed}"),
            SizedBox(height: 5.0),
            Text("Take Note of this, if you lose them you will no longer have acccess to your funds..."),
            SizedBox(height: 5.0),
            ElevatedButton(
            onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
            child: Text('I backed up the given keys'),
          )
          ]
        )
      )
    );
  }
}

