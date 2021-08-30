import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2.5),
          children: <Widget>[
            StatusPanel(
                panelColor: Colors.red,
                textColor: Colors.black,
                title: 'NHIỄM BỆNH',
                count: worldData['cases'].toString(),
                total: 'Tổng',
                update: 'Hôm Nay',
                countupdate: worldData['todayCases'].toString()),
            StatusPanel(
                panelColor: Colors.blue,
                textColor: Colors.black,
                title: ' DƯƠNG TÍNH',
                count: worldData['active'].toString(),
                update: 'Hôm Nay',
                total: 'Tổng',
                countupdate: worldData['todayCases'].toString()),
            StatusPanel(
                total: 'Tổng',
                panelColor: Colors.green,
                textColor: Colors.black,
                title: 'KHỎI BỆNH',
                count: worldData['recovered'].toString(),
                update: 'Hôm Nay',
                countupdate: worldData['todayRecovered'].toString()),
            StatusPanel(
                total: 'Tổng',
                panelColor: Colors.purple,
                textColor: Colors.black,
                title: 'TỬ VONG',
                count: worldData['deaths'].toString(),
                update: 'Hôm Nay',
                countupdate: worldData['todayDeaths'].toString()),
          ]),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String total;
  final String count;
  final String update;
  final String countupdate;
  const StatusPanel(
      {Key? key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count,
      required this.update,
      required this.countupdate, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  
   return Card(
      elevation: 1,
      child: Container(
        height: 100,
        color: panelColor,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      total,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                       count,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Text(
                      update,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                     countupdate,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),

                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
