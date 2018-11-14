import 'package:flutter/material.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/common/PlanetSummary.dart';
import 'package:planets/style/text_style.dart';
import 'package:planets/common/separator.dart';


class DetailPage extends StatelessWidget {

  final Planet planet;

  DetailPage(this.planet);

  Widget _getBackground(){
    return Container(
      constraints: BoxConstraints.expand(height: 300.0),
      child: new Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 350.0,
      ),
    );
  }

  Widget _getGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x003e3862), Color(0xFF3e3862)],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          stops: [0.3,0.4]
        )
      ),
    );
  }

  Widget _getContent() {
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(planet, true),
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("OVERVIEW", style: Style.headerTextStyle,),
              new Separator(),
              new Text(planet.description, style: Style.commonTextStyle,)
            ],
          ),
        )
      ],
    );
  }

  Widget _getToolbar(BuildContext context){
    return new Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white,),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: BoxConstraints.expand(),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context)
          ],
        ),

      ),
    );
  }



}