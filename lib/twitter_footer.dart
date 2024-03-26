import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: TextFooter('Fil', active: true)),
          Expanded(
              child: TextFooter('Notifications')),
          Expanded(
              child: TextFooter('Messages')),
          Expanded(
              child: TextFooter('Moi'))
        ],
      ),
    );
  }
}

class TextFooter extends StatelessWidget {

  final String title;
  bool active = false;

  TextFooter(this.title, {super.key, this.active = false});

  Color getColor(){
    return (active) ? const Color(0xFF58B0F0) : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(color: getColor()),
        ));
  }
}