class AppRoutePath {
  bool isMenu = true;
  bool isPokedex = false;

  AppRoutePath.menu();
  AppRoutePath.pokedex() : isPokedex = true;
}