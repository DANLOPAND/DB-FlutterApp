import 'package:flutter/material.dart';

import '../../Page/planets_page.dart';


Widget planetButton(BuildContext context) {
  return Positioned(
    top: 20,
    right: 20,
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 37, 93, 248),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Center(
        child: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.public),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SecondRoute()));
          },
        ),
      ),
    ),
  );
}
