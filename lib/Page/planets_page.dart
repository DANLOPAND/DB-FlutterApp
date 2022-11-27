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
                cardPlanet(Planet(name: 'Tierra', imageUrl: 'img/planeta-tierra.jpg')),
                cardPlanet(Planet(name: 'Sadala', imageUrl: 'img/planeta-sadala.jpg')),
                cardPlanet(Planet(name: 'Vegeta', imageUrl: 'img/planeta-vegeta.jpg')),
                cardPlanet(Planet(name: 'Tsufrui', imageUrl: 'img/planeta-tsufrui.jpg')),
                cardPlanet(Planet(name: 'Nucleo del mundo', imageUrl: 'img/planeta-del-nucleo-del-mundo.jpg')),
                cardPlanet(Planet(name: 'Yardat', imageUrl: 'img/planeta-yardat.jpg')),
                cardPlanet(Planet(name: 'desconocido', imageUrl: 'img/desconocido.jpg')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
