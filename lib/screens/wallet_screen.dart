import 'package:academy_app/models/user.dart';
import 'package:academy_app/models/walletItemModel.dart';
import 'package:academy_app/providers/auth.dart';
import 'package:academy_app/providers/wallet.dart';
import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:academy_app/widgets/wallet_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants.dart';



class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet';
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {


  @override
  Widget build(BuildContext context) {


    final walletProvider=Provider.of<Wallet>(context);
    return Scaffold(
      appBar: CustomAppBarTwo(),
      body: FutureBuilder(
        future: walletProvider.getWalletInfo(context),
        builder: (context, snapshot) {
          return Container(
            child: Consumer<Wallet>(
              builder: (context,walletvalue, child) {
                     if (snapshot.connectionState == ConnectionState.waiting)
                 return Center(child: CircularProgressIndicator(),);
                  else {
                       return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                                  child: Card(

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // if you need this

                                        ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Wrap(
                                          direction: Axis.vertical,
                                          crossAxisAlignment: WrapCrossAlignment.start,
                                          children: [
                                            GestureDetector(
                                             onTap: walletvalue.refresh,
                                              child: Text(
                                                'Balance',
                                              ),
                                            ),
                                            Text(
                                              '${walletvalue.curruncyPrefix+' '+walletvalue.curruncyName+' '+walletvalue.balance}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // if you need this

                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Wrap(
                                          direction: Axis.vertical,
                                          crossAxisAlignment: WrapCrossAlignment.start,
                                          children: [
                                            Text(
                                              'Earnings',
                                            ),
                                            Text(
                                              '${walletvalue.curruncyPrefix+' '+walletvalue.curruncyName+' '+walletvalue.earnings}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(

                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // if you need this

                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal:10 ),
                                              child: Wrap(
                                                direction: Axis.vertical,
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                  Text(
                                                    'Referals',
                                                  ),
                                                  Text(
                                                    '${walletvalue.referalsCount}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8,horizontal:10 ),
                                              child: Wrap(
                                                direction: Axis.vertical,
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: [
                                                  Text(
                                                    'Referral Code',
                                                  ),
                                                  Text(
                                                    '${walletvalue.referalId}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 15),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Icon(Icons.share_outlined,
                                                size: 30,
                                                  color: Color.fromRGBO(131,131,131, 1)),
                                                ),
                                              ),
                                            ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ) ),

                          ],
                        ),
                      ),
                      Container(width: double.infinity,
                          padding:EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                          child: Text("Transactions",style: TextStyle(fontSize:22,fontWeight: FontWeight.w600,color: kTextLightColor),)),
                      Expanded(
                        child: LayoutBuilder(
                          builder:
                              (BuildContext context, BoxConstraints viewportConstraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints:
                                BoxConstraints(minHeight: viewportConstraints.maxHeight),
                                child: Column(children:
                                  ((){
                                    List<Widget> ls=[];
                                    for (int i=0;i<100;i++) {
                                     ls.add(WalletItem(walletItemModel(id:"this.id", amount:"20000",type: "his.type", status:"Completed",
                                           createdAt: "$i"
                                       )),);
                                  }
                                    return ls;
                                  }())

                                ),
                              ),
                            );
                          },
                        ),
                      )


                    ],
                  ),
                );
                     }



              }
            ),
          );
        }
      ),
    );
  }
}
