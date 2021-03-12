import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: MaterialButton(
            child: Text("Go to pokedex"),
            onPressed: () => debugPrint("Button pressed"),
          )
        ),
      ),
    );
  }
}