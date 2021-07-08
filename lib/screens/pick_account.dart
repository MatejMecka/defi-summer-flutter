import 'package:flutter/material.dart';
import 'new_account.dart';

class PickAccountPage extends StatefulWidget {
  @override
  _PickAccountPageState createState() => _PickAccountPageState();
}

class _PickAccountPageState extends State<PickAccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("Select what kind of account you want."),
           SizedBox(height: 5.0),
           ElevatedButton(
            onPressed: () {
                // Respond to button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewAccountPage()),
                );
            },
            child: Text('Create new Account'),
          ),
          SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: () {
                // Respond to button press
            },
            child: Text('Import existing account'),
          )
         ],
       ),
     )
    );
  }
}