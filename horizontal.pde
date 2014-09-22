void calculate_horizontal(int size, int dir) {

  int hoogte_driehoek = ceil((size/2) / grid)*grid;
  int over = logo_grootte - hoogte_driehoek; 

  // reset de x
  x = startX;

  if (dir == 0) {
    x = startX;
  } else {
    x += round(random(0, ((logo_grootte - over)/grid))) *grid;
  }
}
