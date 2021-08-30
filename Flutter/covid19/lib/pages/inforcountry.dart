import 'package:covid19/panel/wordwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class InfoCountry extends StatelessWidget {
  final List countryData;
  final int stt;
  const InfoCountry({Key? key, required this.countryData, required this.stt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHI TIẾT'),
      ),
    
    body: Container(
       child: SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
             child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(children: <Widget>[
                    Text(
                    countryData[stt]['country'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, ),textAlign: TextAlign.center
                    ),
                    SizedBox(
                    width: 150,
                    ),
                  ],),
                ),
                Container(
                margin: EdgeInsets.all(5),  
                child: Column(children: <Widget>[
                 Image.network(
                  countryData[stt]['countryInfo']['flag'],
                  height: 150,
                ),
                SizedBox(
                  width: 160,
                ),
                ],),),
                Row(children: [ Text('Thông Tin Chi Tiết',style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),],),
               
                 Container(
                   margin: EdgeInsets.fromLTRB(10, 30, 10,10),
                  height: 200,
             
                  child: PieChart(dataMap: {
                    'Dương Tính':countryData[stt]['active'],
                    'Phục Hồi':countryData[stt]['recovered'],
                    'Số Người Chết':countryData[stt]['deaths'],
                  },
                 
                  ),
                  
                ),
                Container(child: GridView(
               shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.5),
                children: <Widget>[
            StatusPanel(
                panelColor: Colors.red,
                textColor: Colors.black,
                title: 'SỐ CA BỆNH',
                count: countryData[stt]['cases'].toString(),
                total: 'Tổng',
                update: 'Hôm Nay',
                countupdate: countryData[stt]['todayCases'].toString()),
            StatusPanel(
                panelColor: Colors.blue,
                textColor: Colors.black,
                title: 'SỐ NGƯỜI DƯƠNG TÍNH',
                count: countryData[stt]['active'].toString(),
                update: 'Hôm Nay',
                total: 'Tổng',
                countupdate: countryData[stt]['todayCases'].toString()),
            StatusPanel(
                total: 'Tổng',
                panelColor: Colors.green,
                textColor: Colors.black,
                title: 'SỐ NGƯỜI KHỎI',
                count: countryData[stt]['recovered'].toString(),
                update: 'Hôm Nay',
                countupdate: countryData[stt]['todayRecovered'].toString()),
            StatusPanel(
                total: 'Tổng',
                panelColor: Colors.purple,
                textColor: Colors.black,
                title: 'SỐ NGƯỜI CHẾT',
                count: countryData[stt]['deaths'].toString(),
                update: 'Hôm Nay',
                countupdate: countryData[stt]['todayDeaths'].toString()),
          ]),),
                
              ],
            ),
          ));
        },
           itemCount: 1,
      ),
      
    )
    ));
  }
}
