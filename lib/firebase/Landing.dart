import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/firebase/Auth.dart';
import 'package:login_flutter/page/home_page.dart';
import 'package:login_flutter/page/login_page.dart';


class Landing extends StatelessWidget {

  final AuthBase authBase;

  const Landing({Key? key,required this.authBase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authBase.AuthStatschange(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active){

          User? userdata=snapshot.data as User?;
          if(userdata==null){
            return LoginPage(authBase: authBase);
            }
          return HomePage(authBase: Auth(),);
          }
         return Scaffold(
          body: Center(child: CircularProgressIndicator(),),


         );
        }
    );
  }
 
  
}