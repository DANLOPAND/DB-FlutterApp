import 'package:flutter/material.dart';
import 'package:poke_api/planets/card_planet.dart';
import 'package:repository/src/models/planet.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planets'),
        backgroundColor: Colors.black,
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                cardPlanet(Planet(name: 'Tierra', imageUrl: 'assets/img/planeta-tierra.jpg')),
                cardPlanet(Planet(name: 'Sadala', imageUrl: 'assets/img/planeta-sadala.jpg')),
                cardPlanet(Planet(name: 'Vegeta', imageUrl: 'assets/img/planeta-vegeta.jpg')),
                cardPlanet(Planet(name: 'Tsufrui', imageUrl: 'assets/img/planeta-tsufrui.jpg')),
                cardPlanet(Planet(name: 'Nucleo del mundo', imageUrl: 'assets/img/planeta-del-nucleo-del-mundo.jpg')),
                cardPlanet(Planet(name: 'Yardat', imageUrl: 'assets/img/planeta-yardat.jpg')),
                cardPlanet(Planet(name: 'desconocido', imageUrl: 'assets/img/desconocido.jpg')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
