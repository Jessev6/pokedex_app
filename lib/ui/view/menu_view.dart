import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Function>(
      builder: (context, openPokedex, child) {
        return Material(
          child: Container(
            child: Center(
              child: MaterialButton(
                child: Text("Go to pokedex"),
                onPressed: () => openPokedex(),
              )
            ),
          ),
        );
      }
    );
  }
}