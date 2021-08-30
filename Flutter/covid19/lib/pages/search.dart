import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19/pages/inforcountry.dart';
import 'package:covid19/pages/listfavorite.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;
CollectionReference ref = FirebaseFirestore.instance.collection('favorite');
  Search(this.countryList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
  bool stt(int index) {
    if (index == 0 || index == 1 || index == 5 || index == 7 || index == 8) {
      return false;
    }
    return true;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query),)
            .toList();
    return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (context, index){
        return Container(
            height: 180,
            decoration: BoxDecoration(color: Colors.white,boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 10,offset:Offset(0,30)),
            ]),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(color: Colors.white,boxShadow:[
                    BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(0,10)),
                  ] ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        GestureDetector(
                        onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoCountry(countryData: suggest, stt: index)));
                              },
                      child: Column(
                        children: <Widget>[
                      Text(suggest[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(suggest[index]['countryInfo']['flag'], height: 60, width: 150,),
                    ]))],
                  )
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                    Row(
                      children: [
                        Text('Tổng Ca Nhiễm: ' + suggest[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Số Người Dương Tính: ' + suggest[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Số Người Phục Hồi: ' + suggest[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Số Người Chết: ' + suggest[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple)),
                      ],
                    ),
                  ],),
                )),
                   IconButton(
                        icon: Icon(
                            stt(index)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red),
                        onPressed: () {stt(index)? null :
                          ref.add({
                            'stt': index,
                          }).whenComplete(() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoList())));
                        })
              ],
            ),
            )]));
        },
    );}
  }

