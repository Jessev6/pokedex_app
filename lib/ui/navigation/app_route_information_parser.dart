import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/navigation/app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    if (path.isDetailScreen) {
      return RouteInformation(location: "/pokedex/${path.id}");
    }

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

    // Handle "/pokedex/:id"
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == "pokedex" && isNumeric(uri.pathSegments[1])) {
      return AppRoutePath.detail(uri.pathSegments[1] as int);
    }

    return AppRoutePath.menu();
  }

}

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}