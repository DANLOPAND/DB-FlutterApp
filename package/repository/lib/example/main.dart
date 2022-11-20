
import 'package:service/src/service.dart';

void main(List<String> args) {
  final servicio = Service();
  servicio.getCharacters().then(print);
}