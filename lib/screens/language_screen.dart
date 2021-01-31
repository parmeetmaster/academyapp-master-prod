import 'package:academy_app/utils/language/languageDeligate.dart';
import 'package:academy_app/widgets/app_bar_three.dart';
import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../constants.dart';

class LanguageScreen extends StatefulWidget {
  static const routeName = '/language';
GlobalKey key;

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: CustomAppBarThree(),
      body: WillPopScope(
        onWillPop: (){
          print("pop done");
          Navigator.pop(context);
          args.currentState.setState(() {

          });
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select Language",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w600) ,),
                  SizedBox(height: 20,),
                  Container(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      disabledColor: kBlueColor,
                      color: kBlueColor,
                      disabledTextColor: Colors.white,
                        child: Text("English",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                        onPressed: (){
                          setPrimaryLanguage(languageEnum.english);
                        },
                      shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: kBlueColor)
                     ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      color: kBlueColor,
                      disabledColor: kBlueColor,
                      disabledTextColor: Colors.white,
                      child: Text("French",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                      onPressed: (){
                        setPrimaryLanguage(languageEnum.french);

                      },
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: kBlueColor)
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
