class Bullet {
  float bulletX;
  float bulletY;
  int bulletSize = 5;

  Bullet(float x, float y) {
    bulletX = x;
    bulletY = y;
  }
  void drawBullet() {
    rect(bulletX, bulletY, bulletSize,bulletSize);
  }
  void updateBullet() {
    bulletY -= 2;
  }
}