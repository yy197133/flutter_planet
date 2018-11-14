import 'package:flutter/material.dart';
import 'package:planets/style/text_style.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/common/separator.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool isVertical;

  PlanetSummary(this.planet, this.isVertical);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        alignment: isVertical
            ? FractionalOffset.topCenter
            : FractionalOffset.centerLeft,
        child: Hero(
            tag: "planet-thumb-${planet.id}",
            child: Image.asset(
              planet.image,
              width: 92.0,
              height: 92.0,
            )));

    Widget _planetValue({String image, String value}) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            image,
            height: isVertical ? 16.0 : 12.0,
          ),
          new Container(
            width: 8.0,
          ),
          new Text(
            value,
            style: isVertical ? Style.commonTextStyle : Style.smallTextStyle,
          ),
        ],
      );
    }

    final planetCardContent = new Container(
      margin: isVertical
          ? EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 16.0)
          : EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
//      constraints: new BoxConstraints.expand(
//        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
//      ),
      child: new Column(
        crossAxisAlignment:
            isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: <Widget>[
          new Text(planet.name, style: Style.headerTextStyle),
          new Container(height: 2.0),
          new Text(planet.location, style: Style.commonTextStyle),
          new Separator(),
          new Container(
            margin: EdgeInsets.only(top: isVertical ? 10.0 : 3.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: isVertical ? 1 : 1,
                  child: _planetValue(
                      image: "assets/img/ic_distance.png",
                      value: planet.distance),
                ),
                new Expanded(
                    flex: isVertical ? 0 : 1,
                    child: _planetValue(
                        image: "assets/img/ic_gravity.png",
                        value: planet.gravity))
              ],
            ),
          )
        ],
      ),
    );

    final planetCard = new Container(
      margin:
          isVertical ? EdgeInsets.only(top: 64.0) : EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
          color: new Color(0xff333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: [
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ]),
      child: planetCardContent,
    );

    return new Container(
      height: isVertical ? 256.0 : 120.0,
      margin: isVertical
          ? EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 30.0)
          : EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: new Stack(
        children: <Widget>[planetCard, planetThumbnail],
      ),
    );
  }
}
