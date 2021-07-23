import 'package:defi_summer/models/Asset.dart';
import 'package:flutter/material.dart';
import 'components/transaction-card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<List<Asset>> futureAssets;

  @override
  void initState(){
    super.initState();
    futureAssets = fetchAsset('GB4UNJKTNGKTXRVLFX73LMZFKCPADZNPNZDE25IX6H2U5RYGJC2J3DCP');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
      children: [
          Text("Current Assets"),
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 1,
            //heightFactor: infinity / 2,
            child: Container(
              height: 100,
              color: Colors.blue,
          ),
        ),

          FutureBuilder(
            future: futureAssets,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                /*
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  //items: snapshot.data!,
                );*/
                print(snapshot.data);
                return Text('loaded');
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
                  
            },
          ),
          Divider(),
          Text("Transactions"),
          Container(
            child: TransactionCard(),
          )
        ]
       ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        tooltip: 'Add contact',
      ),
      );
  }
}