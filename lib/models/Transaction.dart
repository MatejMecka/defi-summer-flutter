import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class Transaction {
  String assetCode;
  String issuer;
  String balance;
  String receiver;
  String sender;
  bool isSender;
  String hash;
  String created;

  Transaction({
    required this.assetCode, 
    required this.issuer, 
    required this.balance, 
    required this.receiver,
    required this.sender,
    required this.isSender,
    required this.hash,
    required this.created
  });

}

Future<List<Transaction>> fetchTransactions(account) async {
  //final response = await http.get(Uri.parse('http://127.0.0.1:8083/balances/$account'));
  final StellarSDK sdk = StellarSDK.TESTNET;

  Page<OperationResponse> payments = await sdk.payments.forAccount(account).order(RequestBuilderOrder.DESC).execute();
  List<Transaction> transactions = [];
    
  for (OperationResponse response in payments.records) {
    
    if (response is PaymentOperationResponse) {
      PaymentOperationResponse por = response as PaymentOperationResponse;
      if (por.transactionSuccessful) {
        print("Transaction hash: ${por.createdAt}");
        String from = String.fromCharCodes(por.from.publicKey);
        print(from == account);
        
        transactions.add(
          Transaction(
            assetCode: por.assetCode, 
            issuer: por.assetIssuer, 
            balance: por.amount, 
            receiver: String.fromCharCodes(por.to.publicKey), 
            sender: from, 
            isSender: from == account,
            hash: por.transactionHash,
            created: por.createdAt
          )
        );
      }
    }

  }
  return transactions;
}