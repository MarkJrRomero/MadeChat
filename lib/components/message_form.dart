import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  Future<DocumentReference> addMessage(String message) {

    return FirebaseFirestore.instance.collection('messages').add(<String, dynamic>{
      'text': message,
      "avatar": FirebaseAuth.instance.currentUser!.photoURL,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
            validator: (value) {
                if (value!.isEmpty) {
                return 'Ingrese algun mensaje';
                  }
                },
              decoration: InputDecoration(
                hintText: 'Escribe aqui tu mensaje',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
              minLines: 1,
              maxLines: 10,
              controller: myController,
            ),
          ),
          SizedBox(width: 5),
          MaterialButton(
            padding: EdgeInsets.all(5),
            minWidth: 70.0,
            height: 40.0,
            onPressed: () {
              if(_formKey.currentState!.validate()){
                addMessage(myController.text);
                myController.clear();
              }
            },
            color: Colors.cyan,
            child: Icon(Icons.send, color: Colors.white,),
          ),
        ],
      ),
    ),
    );
  }
}
