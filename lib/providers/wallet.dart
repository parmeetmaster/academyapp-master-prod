import 'dart:convert';

import 'package:academy_app/models/TransactionItem.dart';
import 'package:academy_app/models/user.dart';
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
   List<dynamic> list;
  var referalId = "DemoID12345678";

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
      this.curruncyName = "${responseData["earnings"]["earnings"]}";
    }

    this.referalsCount="${responseData["earnings"]["total_referrals"]}";
    this.list=responseData["history"];
  TransactionItem item=  TransactionItem.fromList(list[0]);
    print("resp data ${item.description}");
    /*
    curruncyName= responseData["wallet_settings"]["currency"];
     earnings = responseData["earnings"]["earnings"];
        if(earnings=null) earnings="0";
             else {earnings=earnings.toString();}
    String referalsCount =  responseData["earnings"]["total_referrals"];

*/

    print("resp data ${responseData["wallet"]["balance"]}");
  }

  refresh() {
    balance = "111";
    notifyListeners();
  }
}
