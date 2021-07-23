// @dart=2.9
import 'package:defi_summer/screens/home.dart';
import 'package:flutter/material.dart';
import 'parental_settings.dart';
import 'pick_account.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
          title: "Welcome to App NAME HERE",
          body: "APP NAME is aiming to help kids manage their savings and earn Money",
          image: Center(
            child: Image(image: AssetImage("assets/images/welcome.png"), height: 175.0),
          ),
        ),
        PageViewModel(
          title: "Account Settings",
          body: "In order to proceed, you can create a new account or import an existing one.",
          image: Center(
            child: Image(image: AssetImage("assets/images/login.png"), height: 175.0),
          ),
          footer: PickAccountPage()
        ),
        PageViewModel(
          title: "Parental settings",
          body: "By adding accounts you can setup this account so that before each transaction you have to authorize the transaction to succeed.",
          image: Center(
            child: Image(image: AssetImage("assets/images/parental.png"), height: 175.0),
          ),
          footer: SignersPage()
        ),
        PageViewModel(
          title: "Interest",
          body: "By Opting into yXLM you agree to ultraStellars Terms and Conditions which you can find on their site",
          image: Center(
            child: Image(image: AssetImage("assets/images/growth.png"), height: 175.0),
          ),
          footer: Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool value) {
                  setState(() {
                    isChecked = value;
                  });
                }
              ), 
              Text("I would like to opt in into yXLM")
             ]
          )
        ),
        PageViewModel(
          title: "Welcome to App NAME HERE",
          body: "Everything is ready to go! We're glad you joined us for this adventure",
          image: Center(
            child: Image(image: AssetImage("Landgeohash.png"), height: 175.0),
          ),
        ),
        ],
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          // When done button is press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward), //Material App
    )
    );
  }

  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.yellow;
    }

}
