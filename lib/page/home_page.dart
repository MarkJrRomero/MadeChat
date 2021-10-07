import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/components/message_form.dart';
import 'package:login_flutter/firebase/Auth.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_flutter/firebase/GetMessages.dart';

CollectionReference messages = FirebaseFirestore.instance.collection('messages');


class HomePage extends StatelessWidget {


  final AuthBase authBase;
  const HomePage({Key? key, required this.authBase}) : super(key: key);


  Future<User?> GoogleLogOut() async{

    try{

      authBase.LogOut();

    }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("MadeChat"),
        centerTitle: true,
        actions: [
            InkWell(
              onTap: GoogleLogOut,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.logout),
              ),
            ),
        ],
      ),
      backgroundColor: Color(0xffdee2d6),
      body:
      SingleChildScrollView(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
        Container(
            height: 600,
            child: GetMessages(),
            ),

          MessageForm(),


          ],
        ),
    ),
    );
  }
}




