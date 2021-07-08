import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'pick_address.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
    String text = '';
    String dropdownValue = 'One';

    _onKeyboardTap(String value) {
      setState(() {
        text = text + value;
      }
    );
    }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(text),
          DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
          }).toList(),
        ),
          NumericKeyboard(
            onKeyboardTap: _onKeyboardTap,
            textColor: Colors.red,
            rightButtonFn: () {
              setState(() {
                text = text.substring(0, text.length - 1);
              });
            },
            rightIcon: Icon(
              Icons.backspace,
              color: Colors.red,
            ),
            leftButtonFn: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PickAddressPage()),
              );
              print('left button clicked');
            },
            leftIcon: Icon(
              Icons.check,
              color: Colors.red,
            ),
          ),
        ],
        )
      )
    );
  }
}