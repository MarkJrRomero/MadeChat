import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/page/home_page.dart';




class GetMessages extends StatefulWidget {
  @override
  _GetMessages createState() => _GetMessages();
}

class _GetMessages extends State<GetMessages> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages')
      .orderBy('timestamp', descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Algo salio mal');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Cargando...");
        }

        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Image.network(data["avatar"], width: 25),
              title: Text(data["name"]),
              subtitle: Text(data['text']),
            );
          }).toList(),
        );
      },
    );
  }
}