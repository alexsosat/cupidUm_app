import 'package:flutter/material.dart';

class Buttonswidget extends StatelessWidget {
  const Buttonswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.close_rounded,
            color: Colors.red,
            size: 40,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.white,
            onPrimary: Colors.red,
            shape: CircleBorder(),
            padding: EdgeInsets.all(25),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.favorite,
            size: 50,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shadowColor: Theme.of(context).colorScheme.primary,
            shape: CircleBorder(),
            padding: EdgeInsets.all(30),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.assignment_ind,
            color: Colors.purple,
            size: 40,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: Colors.white,
            onPrimary: Colors.purple,
            shape: CircleBorder(),
            padding: EdgeInsets.all(25),
          ),
        ),
      ],
    ));
  }
}
