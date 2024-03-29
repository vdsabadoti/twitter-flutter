import 'dart:js';

import 'package:first/Providers/posts_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'Providers/login_provider.dart';
import 'Services/auth_service.dart';

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
                child: IconNavBar('SignOut')),
          ],
        ),
      ),
    );
  }

}

class IconNavBar extends StatelessWidget {

  final AuthService _authService = AuthService();

  void _refresh(BuildContext context) {
    Navigator.pushNamed(context, '/tweets');
  }

  void _newPost(BuildContext context) {
    Navigator.pushNamed(context, '/newpost');
  }

  void _signOut(BuildContext context) async {
    context.read<LoginProvider>().deleteUser();
    await _authService.signOut();
  }

  final String title;

  IconNavBar(this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          getAction(context);
          },
        icon: getIcon(),
        color: Colors.white,
    );
  }

  getAction(BuildContext context){
    switch(title) {
      case 'Nouveau':
        return _newPost(context);
      case 'Accueil':
        return _refresh(context);
      case 'SignOut':
        return _signOut(context);
      default:
        return () => {};
    }
  }

  Icon getIcon() {
    switch (title) {
      case 'Nouveau':
        return Icon(Icons.edit);
      case 'Accueil':
        return Icon(Icons.home);
      case 'SignOut':
        return Icon(Icons.signpost_outlined);
      default:
        return Icon(Icons.volcano);
    }
  }
}
