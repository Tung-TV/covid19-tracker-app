import 'package:covid19/data.dart';
import 'package:flutter/material.dart';

class FAQS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THẮC MẮC'),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, index) {
        return ExpansionTile(
            title: Text(
          DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight
          .bold)
        ),
        
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DataSource.questionAnswers[index]['answer']),
          )
        ],);
      }),
    );
  }
}
