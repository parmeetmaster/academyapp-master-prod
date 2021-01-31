import 'dart:convert';

import 'package:academy_app/models/TransactionItem.dart';
import 'package:academy_app/models/user.dart';
import 'package:academy_app/models/walletItemModel.dart';
import 'package:academy_app/widgets/wallet_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';

class Wallet extends ChangeNotifier {
  String curruncyPrefix = "";
  String curruncyName = "HTGm";
  String balance = "20000";
  String earnings = "0.00";
  String referalsCount = "0";
   List<TransactionItem> list=[];
  List<Widget> ls=[];
  var referalId = "1234";

  var completeStatus = "UnCompleted";

  Future<void> getWalletInfo(BuildContext context) async {
    final user = Provider.of<Auth>(context).user;

    final url = 'https://baseacademie.com/api/v2/user/profile/3049';
    //  final url ='https://baseacademie.com/api/v2/user/profile/${user.id}';

    final response = await http.get(url);

    final responseData = await json.decode(response.body);

    if (user != null) {
      print("user name is ${user.userId}");
    }

    this.balance = "${responseData["wallet"]["balance"]}";

    this.earnings = responseData["earnings"]["earnings"];
    if (this.earnings == null) {
      this.earnings = "0.00";
    } else {
      this.earnings = "${responseData["earnings"]["earnings"]}";
    }
    this.curruncyName = "${responseData["wallet_settings"]["currency"]}";

    this.referalsCount="${responseData["earnings"]["total_referrals"]}";
    this.referalId="${responseData["wallet"]["ref_code"]}";
    List<dynamic> temp=responseData["history"];
 /*   for(int i=0;i<temp.length;i++){
      list.add(TransactionItem.fromList(temp[i]));
    }*/

    for (int i=0;i<temp.length;i++) {
      TransactionItem item=    TransactionItem.fromList(temp[i]);
      print(' amount is ${item.amount}');
      ls.add(WalletItem(walletItemModel(id:item.id, amount:item.amount,type: item.type, status:item.status,
          createdAt: item.created_at,currency: curruncyName,description: item.description
      )),);
    }



  }


}
