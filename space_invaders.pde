// Simple Space Invaders Clone
// By Ethan Johnson
//
// Started Sep 12, 2017
//
/********************************************

                    VARS

********************************************/

Ship ship;
ArrayList<Bullet> bullets;
ArrayList<Alien> aliens;
boolean[] keys;

//For timing bullets
int currMillis = 0;
int lastMillis = 0;

//Would like to reference this as a class variable, but not working right now
int bulletDelay = 500; //millis

//Alien options
float alienSpeed = 0.5;

int alienRows = 3;
int aliensPerRow = 5;

float gridX = 50;
float gridY = 50;

/********************************************

                  SETUP

********************************************/

void setup() {
  size(500, 500);

  ship = new Ship();
  bullets = new ArrayList<Bullet>();
  aliens = new ArrayList<Alien>();

  //Adding new aliens
  for (int i = 0; i < aliensPerRow; i++){
    for (int j = 0; j < alienRows; j++){
      Alien a = new Alien(gridX*i, gridY*j, alienSpeed);
      aliens.add(a);
    }
  }
  //Old code to add aliens
  // for (int i = 0; i < numAliens; i++){
  //   Alien a = new Alien(i+alienSpacing, i+alienSpacing, alienSpeed);
  //   aliens.add(a);
  // }

  //Array to handle mulitple keypresses
  keys = new boolean[3];
  keys[0] = false; //LEFT Key
  keys[1] = false; //RIGHT Key
  keys[2] = false; //UP Key
}

/********************************************

                    DRAW

********************************************/
void draw() {
  background(0);
  ship.drawShip(ship.shipX, ship.shipY);

  //Drawing aliens
  for (int i = 0; i < aliens.size(); i++){
    Alien a = aliens.get(i);
    a.updateAlien();
    a.drawAlien();
  }
  currMillis = millis();

  //Check for LEFT and RIGHT keypresses to move ship
  if(keys[0] == true){
    if(ship.shipX > 0){
      ship.shipX -= 5;
    }
  }
  if (keys[1] == true){
    if(ship.shipX < width-ship.shipWidth){
      ship.shipX += 5;
    }
  }

  //Check if UP button is pressed, add bullet if it is
  if (keys[2] == true){
    if ((currMillis - lastMillis) > bulletDelay){
      bullets.add(new Bullet(ship.shipX, ship.shipY));
      lastMillis = currMillis;
    }
  }

  //Iterator to update/draw bullet class
  for (int i = 0; i < bullets.size(); i++){
    Bullet b = bullets.get(i);
    b.updateBullet();
    b.drawBullet();
  }

  //Hit detection

}


/********************************************

              OTHER FUNCTIONS

********************************************/

void keyPressed(){
  if(keyCode == LEFT)
    keys[0] = true;
  if (keyCode == RIGHT)
    keys[1] = true;
  if (keyCode == UP)
    keys[2] = true;
}

void keyReleased(){
  if(keyCode == LEFT)
    keys[0] = false;
  if (keyCode == RIGHT)
    keys[1] = false;
  if (keyCode == UP)
    keys[2] = false;

}
