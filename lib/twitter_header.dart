import 'dart:js';

import 'package:first/Providers/posts_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class Header extends StatelessWidget {

  Header({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: IconNavBar('Nouveau')),
            Expanded(
                child: IconNavBar('Accueil')),
            Expanded(
                child: IconNavBar('Rechercher')),
          ],
        ),
      ),
    );
  }

}

class IconNavBar extends StatelessWidget {

  void _refresh(BuildContext context) {
    context.read<PostsProvider>().loadPosts();
  }

  final String title;

  IconNavBar(this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if (getAction()){
            _refresh(context);
          }
          },
        icon: getIcon(),
        color: Colors.white,
    );
  }

  bool getAction(){
    switch(title) {
      case 'Nouveau':
        return false;
      case 'Accueil':
        return true;
      case 'Rechercher':
        return false;
      default:
        return false;
    }
  }

  Icon getIcon() {
    switch (title) {
      case 'Nouveau':
        return Icon(Icons.edit);
      case 'Accueil':
        return Icon(Icons.home);
      case 'Rechercher':
        return Icon(Icons.search);
      default:
        return Icon(Icons.volcano);
    }
  }
}
