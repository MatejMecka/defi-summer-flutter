import 'package:defi_summer/models/Asset.dart';
import 'package:defi_summer/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction-card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<List<Asset>> futureAssets;
  late Future<List<Transaction>> futureTransaction;

  @override
  void initState(){
    super.initState();
    futureAssets = fetchAsset('GB4UNJKTNGKTXRVLFX73LMZFKCPADZNPNZDE25IX6H2U5RYGJC2J3DCP');
    futureTransaction = fetchTransactions('GB4UNJKTNGKTXRVLFX73LMZFKCPADZNPNZDE25IX6H2U5RYGJC2J3DCP');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
      children: [
          Text("Current Assets"),
          FutureBuilder(
            future: futureAssets,
            builder: (BuildContext context, AsyncSnapshot<List<Asset>> snapshot) {
              if (snapshot.hasData) {              
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListTile(
                    leading: Image.network(
                      snapshot.data![index].image
                    ),
                    title: Text(snapshot.data![index].assetCode, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(snapshot.data![index].balance)
                  )
                );
                },
            );
                //print(snapshot.data!.length);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
                  
            },
          ),
          Divider(),
          Text("Transactions"),
          FutureBuilder(
            future: futureTransaction,
            builder: (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
            if (snapshot.hasData) {              
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TransactionCard(transaction: snapshot.data![index],)
                  );
                },
              );
                //print(snapshot.data!.length);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
                  
            },
          ),
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