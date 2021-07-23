import 'dart:convert';
import 'package:http/http.dart' as http;

class Asset {
  String assetCode;
  String issuer;
  String balance;
  String image;

  Asset({
    required this.assetCode, 
    required this.issuer, 
    required this.balance, 
    required this.image
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      assetCode: json['asset_code'],
      issuer: json['issuer'],
      balance: json['balance'],
      image: json['image'],
    );
  }

}

Future<List<Asset>> fetchAsset(account) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8083/balances/$account'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Asset> assets = [];
    print(response.body);
    json.decode(response.body).forEach((elem){
      assets.add(Asset.fromJson(elem));
    });
    return assets;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Assets');
  }
}