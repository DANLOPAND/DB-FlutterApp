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
                cardPlanet(Planet(name: 'Earth C-137', imageUrl: 'assets/img/earth-(c-137).jpg')),
                cardPlanet(Planet(name: 'Unknown', imageUrl: 'assets/img/unknown.jpg')),
                cardPlanet(Planet(name: 'Abadango', imageUrl: 'assets/img/abadango.jpg')),
                cardPlanet(Planet(name: 'earth (replacement dimension)', imageUrl: 'assets/img/earth-(replacement-dimension).jpg')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
