import 'package:first/Providers/login_provider.dart';
import 'package:first/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first/Providers/posts_provider.dart';
import 'package:provider/provider.dart';

import 'class/Tweet.dart';

class LoginBody extends StatefulWidget {

  LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {


  final AuthService _authService = AuthService();
  final loginForm = GlobalKey<FormState>();
  bool switchValue = false;

  void _switch(){
    setState(() {
      switchValue = !switchValue;
    });
  }

  void _refreshTweets(BuildContext context){
    context.read<PostsProvider>().loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text('Connexion à Twitter',
            style: TextStyle(
                fontSize: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: loginForm,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@example.com',
                  ),
                  validator: validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',

                  ),
                  obscureText : true,
                  validator: (String? value) {
                    if (value!.isEmpty){
                      return "Field must not be empty";
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Switch(value: switchValue,
                        onChanged: onChanged,

                    ),
                    const Text('Mémoriser la connexion'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top : 50.0),
                  child: FilledButton(
                      onPressed: connexion,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                    ),
                    child: const Text('Connexion'),
                    ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  onPressed(BuildContext context) async {
    if (loginForm.currentState?.validate() == true) {

      //FIREBASE ANONYMOUS
      dynamic result = await _authService.signInAnonymously();
      context.read<LoginProvider>().logUser();

      print("Success !");
      if (switchValue){

        print('Keep user logged in');
      }
      Navigator.pop(context);
      Navigator.pushNamed(context, '/tweets');
      _refreshTweets(context);
    } else {
      Navigator.pop(context);
    }

  }

  void onChanged(bool value) {
    _switch();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return !regex.hasMatch(value!)
        ? 'Enter a valid email address'
        : null;
  }

  connexion(){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text('Login'),
              content: const Text('Are you sure ?'),
              actions: <Widget>[
                  TextButton(
                      onPressed: () => {
                        Navigator.pop(context, 'Cancel'),
                      },
                      child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => onPressed(context),
                    child: const Text('Yes'),
                ),
                ],
            )
    );
  }

}



