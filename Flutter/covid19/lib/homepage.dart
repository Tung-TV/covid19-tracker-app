import 'dart:convert';
import 'package:covid19/data.dart';
import 'package:covid19/pages/search.dart';
import 'package:covid19/panel/infoPanel.dart';
import 'package:covid19/panel/mosteffectedcountry.dart';
import 'package:covid19/panel/wordwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var worldData = new Map();
  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));

    setState(() {
      worldData = json.decode(response.body);
    });
  }

  var countryData;
  fetchCountryWideData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryWideData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search(countryData));
              },
            )
          ],
          centerTitle: false,
          title: Text('Covid-19 Tracking App'),
        ),
        body: RefreshIndicator(
          onRefresh: fetchData,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height:50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  color: Colors.orange[100],
                  child: Text(
                    DataSource.note,
                    style: TextStyle(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            margin:  EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Th??ng B??o Ngay!!!\n",
                    style:  TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    
                  ),
                  TextSpan(
                    text: "\nN???u s???t, ho khan, m???t m???i",
                    style: TextStyle(
                      color: Colors.white24, fontSize: 18
                        ),  
                        ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SvgPicture.asset("assets/icons/nurse.svg"),
                  ),
                  Positioned(
                  top: 30,
                  right: 10,
                  child: SvgPicture.asset("assets/icons/virus.svg"),
                  ),
                  ],
                ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child :Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Row(
                        children: [
                          Text(''),
                        ],
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                      PreventitonCard(
                       svgSrc: "assets/icons/hand_wash.svg",
                       title: "R???a Tay",
                       ),
                       PreventitonCard(
                      svgSrc: "assets/icons/use_mask.svg",
                      title: "??eo Kh???u Trang",
                      ),
                      PreventitonCard(
                      svgSrc: "assets/icons/Clean_Disinfect.svg",
                      title: "Kh??? Tr??ng",
                      ),
                      ],
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'To??n Th??? Gi???i',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                     
                    ],
                  ),
                ),
                  countryData == null
                    ? Container():Container(
                  height: 200,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: PieChart(dataMap: {
                    'D????ng T??nh':worldData['active'],
                    'Ph???c H???i':worldData['recovered'],
                    'S??? Ng?????i Ch???t':worldData['deaths'],
                  },
                 
                  ),
                ),
                 WorldwidePanel(worldData: worldData),
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Top 5 ???nh H?????ng Nhi???u Nh???t',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                countryData == null
                    ? Container()
                    : MostAffectedPanel(
                        countryData: countryData,
                      ),
                InfoPanel()
              ],
            ),
          ),
        ));
  }
}


class PreventitonCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitonCard({
     Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green),
        )
      ],
    );
  }
}

