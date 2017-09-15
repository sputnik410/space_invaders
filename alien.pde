class Alien{
  float alienX;
  float alienY;

  int alienSize = 20;
  float alienSpeed;

  //Constructor
  Alien(float x, float y, float speed){
    alienX = x;
    alienY = y;
    alienSpeed = speed;
  }

  //Alien Functions
  void drawAlien(){
    ellipse(alienX, alienY, 20, 20);
  }

  void updateAlien(){
    alienY += alienSpeed;
  }

  void destroyAlien(){
    
  }
}
