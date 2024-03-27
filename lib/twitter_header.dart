import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class Header extends StatelessWidget {

  final Function() refresh;

  Header(this.refresh, {
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
                child: IconNavBar('Nouveau', refresh)),
            Expanded(
                child: IconNavBar('Accueil', refresh)),
            Expanded(
                child: IconNavBar('Rechercher', refresh)),
          ],
        ),
      ),
    );
  }

}

class IconNavBar extends StatelessWidget {

  final String title;
  final Function() refresh;

  IconNavBar(this.title, this.refresh, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          if (getAction()){
            await refresh();
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
