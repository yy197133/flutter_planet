import 'package:flutter/material.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/style/text_style.dart';
import 'package:planets/ui/detail/DetailPage.dart';
import 'package:planets/common/PlanetSummary.dart';


class HomePageBody extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return new Expanded(child: new Container(
      color: new Color(0xFF3e3862),
      child: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            sliver: new SliverFixedExtentList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new GestureDetector(
                      onTap: () => Navigator.push(context, new PageRouteBuilder(
                          pageBuilder: (_,__,___) => new DetailPage(planets[index])
                      )),
                      child: new PlanetSummary(planets[index],false),
                    ),
                    childCount: planets.length
                ),
                itemExtent: 152.0,

            ),
          )
        ],
      ),
    ));
  }

}


