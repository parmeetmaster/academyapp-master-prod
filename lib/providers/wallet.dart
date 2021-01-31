

import 'dart:convert';

import 'package:academy_app/models/user.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

class Wallet extends ChangeNotifier {

  String curruncyPrefix = "\$";
  String curruncyName = "HTG";
  String balance = "20000";
  String earnings = "0.00";
  String referalsCount = "0";

  var referalId = "DemoID12345678";

  var completeStatus = "UnCompleted";

  Future<bool> getWalletInfo([User user]) async {
//  final url = BASE_URL + '/api/update_userdata'; // replace this
    final url = 'https://baseacademie.com/api/v2/user/profile/3049';

    final response = await http.get(url);

    final responseData = json.decode(response.body);
  //  print("user name is ${user.userId}");
    print("data is ${response.body}");
    return true;
  }
}