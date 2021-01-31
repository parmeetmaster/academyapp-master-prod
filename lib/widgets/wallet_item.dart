
import 'package:academy_app/models/walletItemModel.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class WalletItem extends StatelessWidget {
  walletItemModel _model;
  WalletItem(@required this._model);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    // if you need this

                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8,horizontal:10 ),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    Text(
                                      'CREDIT',style:TextStyle(fontWeight: FontWeight.w600,color: kTextLightColor) ,
                                    ),
                                    SizedBox(height: 10,),
                                    Text.rich(
                                        TextSpan(
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: 'Status',
                                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: '${_model.status}',
                                                style: TextStyle(fontSize: 12,color:kTextLightColor ),
                                              )
                                            ]
                                        )
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
                                  runAlignment: WrapAlignment.end,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    Text(
                                      '${_model.currency + ' '+_model.amount}',style:TextStyle(fontWeight: FontWeight.w600,color: kTextLightColor) ,
                                    ),
                                    SizedBox(height: 10,),
                                    Text.rich(
                                        TextSpan(
                                            children: <InlineSpan>[

                                              TextSpan(
                                                text: '${_model.createdAt}',
                                                style: TextStyle(fontSize: 12,color:kTextLightColor,fontWeight: FontWeight.w600 ),
                                              )
                                            ]
                                        )
                                    ),

                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                     Divider(thickness: 1,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${_model.description}',style: TextStyle(color: Color.fromRGBO(34,57,126 ,1)),)),
                     SizedBox(height: 5,)
                      ],
                    ),
                  ),
                ),
              ) ),

        ],
      ),
    );
  }
}
