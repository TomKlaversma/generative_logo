void calculate_vertical(int size, int dir) {
  y  = startY;
  int hoogte_driehoek = ceil((size/2) / grid)*grid;
  int over = logo_grootte - hoogte_driehoek;
  if (dir == 0) {
    // doe ^
    // kijk hoeveel hoogte er overblijft 

    y += hoogte_driehoek;

    y += ceil(random(0, (over / grid))) * grid;
  } else {
    y += round(random(0, ((logo_grootte - size)/grid)))*grid;
  }
}

