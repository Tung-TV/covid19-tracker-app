import 'dart:convert';
import 'package:covid19/pages/inforcountry.dart';
import 'package:covid19/pages/listfavorite.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  CollectionReference ref = FirebaseFirestore.instance.collection('favorite');
  bool _getdoc(int stt) {
    bool kt = false;
    return kt;
  }

  var countryData;
  fetchCountryWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  bool stt(int index) {
    if (index == 0 || index == 1 || index == 5 || index == 7 || index == 8||index==116) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    fetchCountryWideData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DANH SÁCH QUỐC GIA'),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 30)),
                  ]),
                  child: Row(children: <Widget>[
                    Container(
                        height: 130,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
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
                                          builder: (context) => InfoCountry(
                                              countryData: countryData,
                                              stt: index)));
                                },
                                child: Container(
                                    child: Column(children: <Widget>[
                                  Text(
                                    countryData[index]['country'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Image.network(
                                    countryData[index]['countryInfo']['flag'],
                                    height: 60,
                                    width: 150,
                                  ),
                                ])))
                          ],
                        )),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Số Ca Nhiễm: ' +
                                    countryData[index]['cases'].toString(),
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
                                    countryData[index]['active'].toString(),
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
                                    countryData[index]['recovered'].toString(),
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
                                    countryData[index]['deaths'].toString(),
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
                  ]),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
