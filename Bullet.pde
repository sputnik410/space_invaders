class Bullet {
  float bulletX;
  float bulletY;

  //Global bullet options
  int bulletSizeX = 5;
  int bulletSizeY = 7;
  int bulletSpeed = 3;

  //Constructor
  Bullet(float x, float y) {
    bulletX = x;
    bulletY = y;
  }

  //Bullet Functions
  void drawBullet() {
    rect(bulletX, bulletY, bulletSizeX, bulletSizeY);
  }
  void updateBullet() {
    bulletY -= bulletSpeed;
  }
}
