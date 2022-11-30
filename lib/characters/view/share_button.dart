import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:repository/repository.dart';

Widget shareButton(BuildContext context, String link, String name) {
  return Positioned(
    top: 20,
    left: 20,
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 37, 93, 248),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Center(
        child: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.share),
          onPressed: () async{
            final repo= Repository();
            final image = repo.getImage(link,name);
            Share.shareXFiles([XFile(await image)]);
          },
        ),
      ),
    ),
  );
}
