import 'dart:convert';
import 'package:covid19/pages/inforcountry.dart';
import 'package:covid19/panel/addFavorite.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoList extends StatefulWidget {
  
  @override
  _FavoListState createState() => _FavoListState();
}

class _FavoListState extends State<FavoList> {
  var countryData;

  final ref = FirebaseFirestore.instance.collection('favorite');
  fetchCountryWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryWideData();
    super.initState();
  }

  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('DANH SÁCH YÊU THÍCH'),
      ),
        body: countryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                
                  if (!snapshots.hasData) {
                    return Text('Loading Data...');
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 130,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(0, 30)),
                          ]),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height: 130,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(0, 10)),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InfoCountry(
                                                            countryData:
                                                                countryData,
                                                            stt: snapshots.data!
                                                                    .docs[index]
                                                                ['stt'])));
                                          },
                                          child: Container(
                                              child: Column(children: <Widget>[
                                            Text(
                                              countryData[
                                                  snapshots.data!.docs[index]
                                                      ['stt']]['country'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Image.network(
                                              countryData[snapshots
                                                      .data!.docs[index]['stt']]
                                                  ['countryInfo']['flag'],
                                              height: 60,
                                              width: 150,
                                            ),
                                          ])))
                                    ],
                                  )),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Số Ca Nhiễm: ' +
                                              countryData[snapshots
                                                          .data!.docs[index]
                                                      ['stt']]['cases']
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Số Người Dương Tính: ' +
                                              countryData[snapshots
                                                          .data!.docs[index]
                                                      ['stt']]['active']
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Số Người Phục Hồi: ' +
                                              countryData[snapshots
                                                          .data!.docs[index]
                                                      ['stt']]['recovered']
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Số Người Chết: ' +
                                              countryData[snapshots
                                                          .data!.docs[index]
                                                      ['stt']]['deaths']
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                              DeleteFavo(doctoDelete: snapshots.data!.docs[index])
                            ],
                          ),
                        );
                      },
                      itemCount: snapshots.data!.docs.length,
                    );
                  }
                }));
  }
}
