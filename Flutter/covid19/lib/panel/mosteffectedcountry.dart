import 'package:covid19/pages/inforcountry.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key? key, required this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                GestureDetector(  
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoCountry(countryData: countryData, stt: index)));
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 40,
                  width:  50,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Số Người Chết: ' + countryData[index]['deaths'].toString(),
                      style:
                          TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ])) )],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}