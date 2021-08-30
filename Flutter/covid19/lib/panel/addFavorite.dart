import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/pages/listfavorite.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteFavo extends StatefulWidget {
  DocumentSnapshot doctoDelete;
  DeleteFavo({required this.doctoDelete});
  @override
  _DeleteFavoState createState() => _DeleteFavoState();
}

class _DeleteFavoState extends State<DeleteFavo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {
            widget.doctoDelete.reference
                .delete()
                .whenComplete(() => FavoList());
       
          },
        ),
      ]),
    );
  }
}
