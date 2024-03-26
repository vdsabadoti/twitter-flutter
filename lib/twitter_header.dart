import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NavBar();
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: const Padding(
        padding: EdgeInsets.all(10.0),
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

  final String title;

  const IconNavBar(this.title, {
    super.key,
  });

  Icon getIcon(){
    switch(title) {
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

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: getIcon(),
      color: Colors.white,
    );
  }
}
