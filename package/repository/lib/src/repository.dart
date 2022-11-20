// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:repository/src/models/character.dart';
import 'package:service/src/service.dart';

class Repository {
  final Service _service =  Service();

  Future<List<Character>> getCharacter() async {
    final characters = await _service.getCharacters();
    return characters;
  }
}
