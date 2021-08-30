import 'package:covid19/pages/faqs.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQS()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical:5,horizontal: 10,),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Thắc Mắc',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
