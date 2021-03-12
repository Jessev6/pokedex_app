import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/navigation/app_route_information_parser.dart';
import 'package:pokedex_app/ui/navigation/app_router_delegate.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  final _informationParser = AppRouteInformationParser();
  final _routerDelegate = AppRouterDelegate();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Pokédex App",
      routeInformationParser: _informationParser, 
      routerDelegate: _routerDelegate,
    );
  }
}
