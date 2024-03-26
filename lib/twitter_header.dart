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
                child: TextNavBar('Nouveau')),
            Expanded(
                child: TextNavBar('Accueil')),
            Expanded(
                child: TextNavBar('Rechercher')),
          ],
        ),
      ),
    );
  }
}


class TextNavBar extends StatelessWidget {

  final String title;

  const TextNavBar(this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
