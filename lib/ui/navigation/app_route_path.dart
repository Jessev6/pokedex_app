class AppRoutePath {
  bool isMenu = true;
  bool isPokedex = false;
  bool isDetailScreen = false;
  int id = -1;

  AppRoutePath.menu();
  AppRoutePath.pokedex() : isPokedex = true;
  AppRoutePath.detail(int id): id = id; 
}