Ship ship;
ArrayList<Bullet> bullets;

void setup() {
  size(500, 500);
  ship = new Ship();
  bullets = new ArrayList<Bullet>();
}

void draw() {
  background(0);
  ship.drawShip(ship.shipX, ship.shipY);
  for (int i = 0; i < bullets.size(); i++){
    Bullet b = bullets.get(i);
    b.updateBullet();
    b.drawBullet();
  }
  
  //Handle Keypresses Here
  if (keyPressed) {
    if (keyCode == LEFT) {
      if (ship.shipX > 0) {
        ship.shipX -= 5;
      }
    } else if (keyCode == RIGHT) {
      if (ship.shipX < width-ship.shipWidth) {
        ship.shipX += 5;
      }
    } else if (keyCode == UP){
      bullets.add(new Bullet(ship.shipX, ship.shipY-ship.shipHeight));
    }
  }
}