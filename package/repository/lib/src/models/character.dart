// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// {@template model_character}
/// My new Flutter package
/// {@endtemplate}

class Character {
  Character({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.originPlanet,
    required this.role,
    required this.specie,
    required this.status,
    required this.transform,
    required this.universe,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'].toString(),
        imageUrl: json['imageUrl'].toString(),
        name: json['name'].toString(),
        originPlanet: json['originplanet'].toString(),
        role: json['role'].toString(),
        specie: json['specie'].toString(),
        status: json['status'].toString(),
        transform: json['transform'].toString(),
        universe: json['universe'].toString(),
      );

  factory Character.empty() => Character(
        id: '',
        imageUrl: '',
        name: '',
        originPlanet: '',
        role: '',
        specie: '',
        status: '',
        transform: '',
        universe: '',
      );

  String id;
  String imageUrl;
  String name;
  String originPlanet;
  String role;
  String specie;
  String status;
  String transform;
  String universe;
}
