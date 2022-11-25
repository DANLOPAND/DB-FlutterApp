import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../character_main/cubit/character_main_cubit.dart';
import 'cubit/characters_cubit.dart';
import 'view/Pageview_Character.dart';
import '../characters/planets.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: const AssetImage('img/Tierra.jpg'),fit: BoxFit.cover,
                      ),
                      Text("Tierra", style: GoogleFonts.anton(textStyle: const TextStyle(fontSize: 25,color: Colors.white)),),
                    ],
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: const AssetImage('img/Yardat.jpg'),fit: BoxFit.cover,
                      ),
                      Text("Yardat", style: GoogleFonts.anton(textStyle: const TextStyle(fontSize: 25,color: Colors.white)),),
                    ],
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: const AssetImage('img/Nucleo.jpg'),fit: BoxFit.cover,
                      ),
                      Text("Nucleo del mundo", style: GoogleFonts.anton(textStyle: const TextStyle(fontSize: 18,color: Colors.white, )),),
                                          
                    ],
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: const AssetImage('img/Pvegeta.jpg'),fit: BoxFit.cover,
                      ),
                      Text("Planeta Vegeta", style: GoogleFonts.anton(textStyle: const TextStyle(fontSize: 20,color: Colors.white)),),
                    ],
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: const AssetImage('img/Sadala.jpg'),fit: BoxFit.cover,
                      ),
                      Text("Sadala", style: GoogleFonts.anton(textStyle: const TextStyle(fontSize: 25,color: Colors.white)),),
                    ],
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Ink.image(
                        image: const AssetImage('img/Tsufrui.jpg'),fit: BoxFit.cover,
                      ),
                      Text("Tsufrui", style: GoogleFonts.anton(textStyle: const TextStyle(fontSize: 25,color: Colors.white)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
