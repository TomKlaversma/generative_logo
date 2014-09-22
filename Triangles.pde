class Triangle {

  // GLOBAL VARIABLES
  int size, dir, colour, posX, posY;

  // CONTSTRUCTOR
  Triangle(int _colour, int _size, int _dir, int _posX, int _posY) {
    colour = _colour;
    size = _size;
    dir = _dir;
    posX = _posX;
    posY = _posY;
  }

  // FUNCTIONS
  void build() {
    // doe alles
    display();
  }

  void display() {
    noStroke();
    fill(colour, 230);
    if (dir == 1) {
      triangle(posX, posY, posX + size/2, posY + size/2, posX, posY +size);
    } else {
      triangle(posX, posY, posX + size/2, posY - size/2, posX + size, posY);
    }
  }
}

