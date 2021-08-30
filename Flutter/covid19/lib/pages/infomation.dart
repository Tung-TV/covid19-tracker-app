import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class Infomation extends StatefulWidget {

  @override
  _InfomationState createState() => _InfomationState();
}

class _InfomationState extends State<Infomation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TIN TỨC'),),
      body:  Iframe()
      
    );
  }
}
class Iframe extends StatelessWidget {
  Iframe() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://tuoitre.vn/dich-covid-19-e576.htm';
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
         child: HtmlElementView(viewType: 'iframe'));
  }
}
