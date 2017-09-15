import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class space_invaders extends PApplet {

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
float alienSpeed = 0.5f;

int alienRows = 3;
int aliensPerRow = 5;

float gridX = 50;
float gridY = 50;

/********************************************

                  SETUP

********************************************/

public void setup() {
  

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
public void draw() {
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

public void keyPressed(){
  if(keyCode == LEFT)
    keys[0] = true;
  if (keyCode == RIGHT)
    keys[1] = true;
  if (keyCode == UP)
    keys[2] = true;
}

public void keyReleased(){
  if(keyCode == LEFT)
    keys[0] = false;
  if (keyCode == RIGHT)
    keys[1] = false;
  if (keyCode == UP)
    keys[2] = false;

}
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
  public void drawBullet() {
    rect(bulletX, bulletY, bulletSizeX, bulletSizeY);
  }
  public void updateBullet() {
    bulletY -= bulletSpeed;
  }
}
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
  public void drawAlien(){
    ellipse(alienX, alienY, 20, 20);
  }

  public void updateAlien(){
    alienY += alienSpeed;
  }

  public void destroyAlien(){
    
  }
}
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

  public void drawShip(float x, float y) {
    rect(x, y, shipWidth, shipHeight);
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "space_invaders" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
