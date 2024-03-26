import 'package:first/twitter_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {

  static const List<Widget> twitterPostsList = [
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
  ];

  Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final loginForm = GlobalKey<FormState>();
  bool switchValue = false;

  void _switch(){
    setState(() {
      switchValue = !switchValue;
    });
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
                    const Text('Mémoriser mot de passe'),
                  ],
                ),
                FilledButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Alert dialog test'),
                            content: const Text('Do you really want to log in ?'),
                            actions: <Widget>[
                              TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                              ),
                            TextButton(
                            onPressed: () => onPressed(context),
                            child: const Text('OK'),
                            ),
                            ],
                            ),
                    ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  ),
                  child: const Text('Connexion'),
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: Body.twitterPostsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Body.twitterPostsList[index];
              }
          ),
        ),
      ],
    );
  }

  onPressed(BuildContext context) {
    Navigator.pop(context, 'OK');
    if (loginForm.currentState?.validate() == true) {
      print("Success !");
      if (switchValue){
        print("You need to save the password");
      }
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



}



