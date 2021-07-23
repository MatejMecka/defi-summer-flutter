import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';


class AddSigner extends StatefulWidget {
  @override
  _AddSignerState createState() => _AddSignerState();
}

class _AddSignerState extends State<AddSigner> {

  late TextEditingController _controller;
  final storage = new FlutterSecureStorage();
  String alertTitle = "";
  String alertContent = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
       child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.person_add_alt),
              const Text('Add Parent'),
              Center(
                child: Text("You're going to add another parent. Make sure you are writting their public key exactly as it is.", ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                onSubmitted: (String value) async {
                  // Authenticate
                  var localAuth = LocalAuthentication();
                  bool didAuthenticate = await localAuth.authenticate( localizedReason: 'Please authenticate to authorize the transaction');

                  // Get key
                  if(didAuthenticate){
                    String? private_key = await storage.read(key: 'secret_key');
                    KeyPair keyPair = KeyPair.fromSecretSeed(private_key);


                    // Create Multisign transaction
                    StellarSDK sdk = StellarSDK.TESTNET;
        
                    AccountResponse account = await sdk.accounts.account(keyPair.accountId);
                    int seqNum = account.sequenceNumber;

                    // Signer account B.
                    XdrSignerKey bKey = XdrSignerKey();
                    bKey.discriminant = XdrSignerKeyType.SIGNER_KEY_TYPE_ED25519;
                    bKey.ed25519 = XdrUint256();
                    bKey.ed25519.uint256 = StrKey.decodeStellarAccountId(value);

                    SetOptionsOperationBuilder setOp = SetOptionsOperationBuilder();
                    Transaction transaction = new TransactionBuilder(account)
                    .addOperation(setOp
                        .setSigner(bKey, 1)
                        .build())
                    .addMemo(Memo.text("Beep boop beep?"))
                    .build();

                    transaction.sign(keyPair, Network.TESTNET);

                    SubmitTransactionResponse response = await sdk.submitTransaction(transaction);
                    if (response.success) {
                      setState(() {
                        String alertTitle = "Transaction Succeded";
                        String alertContent = "Parent has been added Succeesfuly .";
                      });
                    } else {
                      setState(() {
                        String alertTitle = "Transaction Failed";
                        String alertContent = "Error: $response";
                      });
                    }

                  } else {
                    setState(() {
                        String alertTitle = "Authorization Failed";
                        String alertContent = "You rejected the operation.";
                    });
                  }

                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(alertTitle),
                        content: Text(alertContent),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );

                },
              ),  
            ]
          ),
        )
    );
  }
}