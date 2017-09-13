class Ship {
  final int shipHeight = 20;
  final int shipWidth = 10;

  float shipStartX = width/2;
  float shipStartY = height - shipHeight - 10;
  
  float shipX;
  float shipY;

  Ship() {
    shipX = shipStartX;
    shipY = shipStartY;
  }

  void drawShip(float x, float y) {
    rect(x, y, shipWidth, shipHeight);
  }
}