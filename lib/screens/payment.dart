import 'package:flutter/material.dart';

class ReviewPaymentPage extends StatefulWidget {
  @override
  _ReviewPaymentPageState createState() => _ReviewPaymentPageState();
}



class _ReviewPaymentPageState extends State<ReviewPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text("Review Payment", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
          Text("Destination: ", style: TextStyle(fontSize: 20)),
          Text("Asset: ", style: TextStyle(fontSize: 20)),
          Text("Amount: ",style: TextStyle(fontSize: 20)),
          Row(
            children: [
              Center(
                child: Align(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 100, height: 100),
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Text("Pay"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                      ),
                    )
                  )
                )
              ),
              Center(
                child: Align(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 150, height: 100),
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Text("Cancel"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))
                      ),
                    )
                  )
                )
              )
              ]
            )
          ],)
    );
  }
}