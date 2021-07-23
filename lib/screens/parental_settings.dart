// @dart=2.9
import 'package:defi_summer/screens/components/add_signer.dart';
import 'package:flutter/material.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class SignersPage extends StatefulWidget {
  @override
  _SignersPageState createState() => _SignersPageState();
}

class _SignersPageState extends State<SignersPage> {
  final StellarSDK sdk = StellarSDK.TESTNET;

  Future<List<String> > getSigners() async {
    String accountId = "GASYKQXV47TPTB6HKXWZNB6IRVPMTQ6M6B27IM5L2LYMNYBX2O53YJAL";
    AccountResponse account = await sdk.accounts.account(accountId);

    List<String>signers = [];

    for (Signer signer in account.signers) {
      signers.add(signer.accountId);
    }

    return signers;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String> >(
        future: getSigners(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List< String>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
             ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  String foobar = snapshot.data[index];
                  String newAccount = foobar.characters.reduce((acc, val) => (acc.length) + 1 % 6 == 0 ? '$acc$val ' : '$acc$val');
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.account_circle) 
                    ),
                    title: Text("Signer"),
                    subtitle: Text(newAccount)
                  );
                },
            ),
            
              ElevatedButton(
                child: Text('Add Parent'),
                onPressed: (){
                  showModalBottomSheet<void>(
                  context: context,
                  builder:(BuildContext context) {
                    return AddSigner();
                  }
                  );
                }
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
            ));
        },
      );
  }
}