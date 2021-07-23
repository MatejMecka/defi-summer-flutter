import 'package:defi_summer/screens/qr_scanner.dart';
import 'package:flutter/material.dart';
//import 'package:ai_barcode/ai_barcode.dart';

class PickAddressPage extends StatefulWidget {
  @override
  _PickAddressState createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
                  Container(
                    color: Colors.greenAccent,
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              Icon(
                                Icons.qr_code,
                              ),
                              Text("Scan Address")
                            ],
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QRViewExample()),
                            );            
                          }
                        )
                        
                        ] 
                      )
                    ),  // Also Including Tab-bar height.
                  ),
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: Divider()
                  ),
                  //TabBarView(children: [ImageList(),])
                  Container(
                    color: Colors.greenAccent,
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Recipient's Public Key",
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the Recipient's Public Key'";
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState!.validate()) {
                                  // Process data.
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      )
                    ),  // Also I  // Also Including Tab-bar height.
                  ),
                ]
              )
            )
    );
  }
}