import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/firebase/Auth.dart';


class LoginPage extends StatelessWidget {
  final AuthBase authBase;

  const LoginPage({Key? key, required this.authBase}) : super(key: key);

  Future<User?> GoogleLogin() async{

    try{

      authBase.Google_Sign_IN();

    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90), bottomRight: Radius.circular(90)
                  ),
                  color: new Color(0xffF5591F),
                  gradient: LinearGradient(colors: [(new Color(0xff1393aa)),(new Color(0xff1fceee))],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset("img/login.png"),
                        height: 90,
                        width: 90,
                      )
                    ],
                  ),
                )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(onPressed: GoogleLogin, child: Text("Inicia con google")),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}











