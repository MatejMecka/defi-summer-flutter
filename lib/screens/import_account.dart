import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'components/key_validator.dart';


/// This is the stateful widget that the main application instantiates.
class ImportAccountPage extends StatefulWidget {

  @override
  State<ImportAccountPage> createState() => _ImportAccountPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ImportAccountPageState extends State<ImportAccountPage> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!)!.save();
              },
              child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(200, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'What is the Stellar private key associated with this account?',
                          labelText: 'SXXXXXX.....',
                        ),
                        onSaved: (String? value) async {
                          if(validateKey(value, false)){
                            await storage.write(key: "secret_key", value: value);
                            print('Value for field saved as "$value"');
                          } else {

                          }
                          
                        },
                    ),
                    )
                  )
                )
              )
          );
  }
}
