import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/navigation/app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    if (path.isPokedex) {
      return RouteInformation(location: "/pokedex");
    }

    return RouteInformation(location: "/");
  }

  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location == null ? "/" : routeInformation.location);

    // Handle "/"
    if (uri.pathSegments.length == 0) {
      return AppRoutePath.menu();
    }

    // Handle "/pokedex"
    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == "pokedex") {
      return AppRoutePath.pokedex();
    }

    return AppRoutePath.menu();
  }

}