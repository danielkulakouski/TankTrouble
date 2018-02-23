////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Name:
//  _____              _      _   _  __     _       _                   _    _ 
// |  __ \            (_)    | | | |/ /    | |     | |                 | |  (_)
// | |  | | __ _ _ __  _  ___| | | ' /_   _| | __ _| | _____  _   _ ___| | ___ 
// | |  | |/ _` | '_ \| |/ _ \ | |  <| | | | |/ _` | |/ / _ \| | | / __| |/ / |
// | |__| | (_| | | | | |  __/ | | . \ |_| | | (_| |   < (_) | |_| \__ \   <| |
// |_____/ \__,_|_| |_|_|\___|_| |_|\_\__,_|_|\__,_|_|\_\___/ \__,_|___/_|\_\_|
//Due Date: June 20, 2016
//Description: Tank game where the objective is to shoot the other tank and gain points (inspiration from: https://www.tanktrouble.com/?game)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import ddf.minim.*; //sound effects

Minim minim;
AudioPlayer player;
AudioSample shot;
AudioSample exSound;
AudioSample missileSound;
AudioSample bulletBounce1;
AudioSample powerupSound;
AudioSample missileBeep;
AudioSample checkSound;

float tankX1; //tank Coordinates
float tankY1;
float tankX2;
float tankY2;

float clickColour = 0; //colours that flash
float clickVColour = 5;

PImage topTnakM; //customization tanks
PImage bottomTnakM;

PImage lastFrame; //last frame of the checkmark

PImage maze1; //images and mazes
PImage maze2;
PImage maze3;
PImage initialBack;
PImage redTnak;
PImage greenTnak;
PImage bottomBar;

PImage tankWMissile; //tank images with missile
PImage tankNoMissile;

PImage topTnakG1; //tanks in the game
PImage bottomTnakG1;

PImage topTnakG2;
PImage bottomTnakG2;

PImage topTnak1; //tank images
PImage bottomTnak1;
PImage topTnak2;
PImage bottomTnak2;

PImage paint; //customization images
//PImage paintIcon;

boolean custom; //customization

PImage offSwitch; //off switch

PImage settingsMenu; //settings

int numberOfBullets1 = 5; //number of initial bullets that get expanded later
int numberOfBullets2 = 5;

float [] bulletX1 = new float [numberOfBullets1]; //bullet variables
float [] bulletY1 = new float [numberOfBullets1];
float [] bulletX2 = new float [numberOfBullets2];
float [] bulletY2 = new float [numberOfBullets2];

float [] bulletAngle1 = new float [numberOfBullets1];
float [] bulletAngle2 = new float [numberOfBullets2];

boolean [] bulletVisible1 = new boolean [numberOfBullets1];
boolean [] bulletVisible2 = new boolean [numberOfBullets2];

//PImage explosion;
Boolean start = false; //start
boolean [] keys; //keys
String tnak = ""; //text
String by = "By: Daniel Kulakouski";
String click = "Press Spacebar To Continue";

int currentBullet1 = 0; //current bullet
int currentBullet2 = 0;

boolean triggerReleased1 = true; //shoot button release
boolean triggerReleased2 = true;

boolean maxBullet1 = false; //max bullet
boolean maxBullet2 = false;

int backgroundSelector = int(random(1, 4)); //background

int tankRotate1 = 0; //tank rotatation
float tankRSpeed1 = 4;
int tankRotate2 = 0;
float tankRSpeed2 = 4;

int numFrames = 6; //sprites
PImage [] explosion = new PImage[numFrames];
int currentFrame = 1;

int numFrames2 = 7;
PImage [] settings = new PImage[numFrames2];
int currentFrame2 = 1;

int numFrames3 = 4;
PImage [] bulletTimeout = new PImage[numFrames3];
int currentFrame3 = 1;

PImage stillSettings; //settings

boolean hit1 = false; //explosion
boolean hit2 = false;

int borderColour = #4D4D4D; //border colour

boolean up1 = true; //up variables
boolean down1 = true;
boolean left1 = true;
boolean right1 = true;
boolean up2 = true;
boolean down2 = true;
boolean left2 = true;
boolean right2 = true;

int score1 = 0; //score
int score2 = 0;

PFont myFont; //font

boolean tankVisible1 = true; //tank visibility
boolean tankVisible2 = true;

int loop1 = 0; //setting up stage
int loop2 = 0;

float [] bulletR1 = {}; //bullet rotation
float [] bulletR2 = {};

boolean force = false; //force

boolean settingsB = false; //settings

int dist; //distance
int dist2;

float topLeftX1; //collision detection
float topLeftY1;
float topRightX1;
float topRightY1;
float bottomRightX1;
float bottomRightY1;
float bottomLeftX1;
float bottomLeftY1;
float topX1;
float topY1;
float bottomX1;
float bottomY1;

float topLeftX2;
float topLeftY2;
float topRightX2;
float topRightY2;
float bottomRightX2;
float bottomRightY2;
float bottomLeftX2;
float bottomLeftY2;
float topX2;
float topY2;
float bottomX2;
float bottomY2;

void setup() {
  size(800, 600); //screen size
  initialBack = loadImage("initialBack.png"); //images
  redTnak = loadImage("redTnak.png");
  redTnak.resize(20, 32);
  greenTnak = loadImage("greenTnak.png");
  greenTnak.resize(20, 32);
  bottomBar = loadImage("bottomBar.png");

  //experimental custom tanks
  topTnakG1 = loadImage("topTnakGAME.png");
  topTnakG1.resize(20, 32);
  bottomTnakG1 = loadImage("bottomTnakGAME.png");
  bottomTnakG1.resize(20, 32);

  topTnakG2 = loadImage("topTnakGAME.png");
  topTnakG2.resize(20, 32);
  bottomTnakG2 = loadImage("bottomTnakGAME.png");
  bottomTnakG2.resize(20, 32);

  topTnak1 = loadImage("topTnak.png");
  topTnak2 = loadImage("topTnak.png");
  bottomTnak1 = loadImage("bottomTnak.png");
  bottomTnak2 = loadImage("bottomTnak.png");

  rocket = loadImage("rocketIcon.png");
  rocket.resize(powerD, powerD);

  topTnakM = loadImage("topTnakM.png");
  bottomTnakM = loadImage("bottomTnakM.png");

  paint = loadImage("colours.png");

  maze1 = loadImage("maze1.png");
  maze2 = loadImage("maze2.png");
  maze3 = loadImage("maze3.png");
  noWalls = loadImage("mazeTemplate.png");

  missile = loadImage("missile.png");
  missile.resize(16, 14);

  tankWMissile = loadImage("topTnakGAMEMi.png");
  tankWMissile.resize(20, 32);

  tankNoMissile = loadImage("topTnakGAMENoMi.png");
  tankNoMissile.resize(20, 32);

  stillSettings = loadImage("stillSettings.gif");
  stillSettings.resize(25, 25); 

  settingsMenu = loadImage("settingsMenu.png");

  myFont = loadFont("EurostileBold-48.vlw");

  offSwitch = loadImage("offSwitch.png");

  for (int i = 0; i<29; i++) { //missile trail
    thingX1[i] = 0;
    thingY1[i] = 0;
  }
  for (int i = 0; i<29; i++) {
    thingX2[i] = 0;
    thingY2[i] = 0;
  }

  minim = new Minim(this); //sound effects
  player = minim.loadFile("song.mp3");
  shot = minim.loadSample("shot.mp3");
  exSound = minim.loadSample("explosion.mp3");
  missileSound = minim.loadSample("missile.mp3");
  bulletBounce1 = minim.loadSample("bulletBounce1.mp3");
  powerupSound = minim.loadSample("powerupSound.mp3");
  missileBeep = minim.loadSample("missileBeep.mp3");
  checkSound = minim.loadSample("Ding Sound Effect.mp3");

  if (backgroundSelector==1) { //backgrounds
    maze1.resize(width, height-100);
    tankX1 = 100;
    tankY1 = 260;
    tankX2 = 700;
    tankY2 = 260;
    tankRotate2 = 180;
  }
  if (backgroundSelector==2) {
    maze2.resize(width, height-100);
    tankRotate1 = 90;
    tankRotate2 = 270;
    tankX1 = 70;
    tankY1 = 55;
    tankX2 = 720;
    tankY2 = 430;
  }
  if (backgroundSelector==3) {
    maze3.resize(width, height-100);
    tankRotate2 = 180;
    tankX1 = 30;
    tankY1 = 25;
    tankX2 = 770;
    tankY2 = 470;
  }

  for (int i = 1; i<explosion.length; i++) { //sprites
    String imageName = "frame" + nf(i, 4) + ".png";
    explosion[i] = loadImage(imageName);
    explosion[i].resize(90, 70);
  }

  for (int i = 1; i<settings.length; i++) {
    String imageName = "frames" + nf(i, 4) + ".gif";
    settings[i] = loadImage(imageName);
    settings[i].resize(25, 25);
  }

  for (int i = 1; i<checkMark.length; i++) {
    String imageName = "fram" + nf(i, 4) + ".gif";
    checkMark[i] = loadImage(imageName);
    checkMark[i].resize(200, 150);
  }

  for (int i = 1; i<checkMark2.length; i++) {
    String imageName = "fram" + nf(i, 4) + ".gif";
    checkMark2[i] = loadImage(imageName);
    checkMark2[i].resize(200, 150);
  }

  for (int i = 1; i<wifi.length; i++) {
    String imageName = "fam" + nf(i, 4) + ".png";
    wifi[i] = loadImage(imageName);
    wifi[i].resize(100, 50);
  }

  lastFrame = loadImage("fram0027.gif"); //checkmark
  lastFrame.resize(200, 150);

  generatePowerUps(); //sets up powerups and bullets
  generateBullets1();
  generateBullets2();

  keys=new boolean[11]; //keys array
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
  keys[5]=false;
  keys[6]=false;
  keys[7]=false;
  keys[8]=false;
  keys[9]=false;
  keys[10]=false;
}

void generateBullets1() { //generates bullets for the first tank
  for (int i = 0; i<bulletX1.length; i++) {
    bulletX1[i] = -50;
    bulletY1[i] = -50;
    bulletVisible1[i] = false;
    maxBullet1 = false;
  }
}

void generateBullets2() { //generates bullets for the second tank
  for (int i = 0; i<bulletX2.length; i++) {
    bulletX2[i] = -50;
    bulletY2[i] = -50;
    bulletVisible2[i] = false;
    maxBullet2 = false;
    currentBullet2 = 0;
  }
}

void moveBullets() { //moves the bullets
  if (!settingsB) {
    for (int i = 0; i<bulletVisible1.length; i++) {
      if (bulletVisible1[i] == true) {

        if (currentBullet1 >= bulletX1.length) { //if there aren't enough bullets, the array gets expanded
          numberOfBullets1+=5;

          bulletX1 = expand(bulletX1, numberOfBullets1);
          bulletY1 = expand(bulletY1, numberOfBullets1);
          bulletAngle1 = expand(bulletAngle1, numberOfBullets1);
          bulletVisible1 = expand(bulletVisible1, numberOfBullets1);
        }

        if (!force) {
          bulletY1[i] += 2.2*sin(radians(bulletR1[i]));
          bulletX1[i] += 2.2*cos(radians(bulletR1[i]));
        }
        if (force) {
          bulletY1[i] += 2*sin(radians(tankRotate1)); //I discovered force by accident and decided to keep it a feature because it was fun to use
          bulletX1[i] += 2*cos(radians(tankRotate1));
        }

        if (!unlimitedBullets) { //if the bullets are a multiple of 5, no more bullets can be fired if unlimited bullets are false
          if (currentBullet1%5==0) {
            maxBullet1 = true;
          }
        }
      }
    }
    for (int i = 0; i<bulletVisible2.length; i++) { //does the same for the second tank
      if (bulletVisible2[i] == true) {

        if (currentBullet2 >= bulletX2.length) {
          numberOfBullets2+=5;

          bulletX2 = expand(bulletX2, numberOfBullets2);
          bulletY2 = expand(bulletY2, numberOfBullets2);
          bulletAngle2 = expand(bulletAngle2, numberOfBullets2);
          bulletVisible2 = expand(bulletVisible2, numberOfBullets2);
        }

        if (!force) {
          bulletY2[i] += 2.2*sin(radians(bulletR2[i]));
          bulletX2[i] += 2.2*cos(radians(bulletR2[i]));
        }
        if (force) {
          bulletY2[i] += 2*sin(radians(tankRotate2));
          bulletX2[i] += 2*cos(radians(tankRotate2));
        }

        if (!unlimitedBullets) {
          if (currentBullet2%5==0) {
            maxBullet2 = true;
          }
        }
      }
    }
  }
}

void draw() {
  //music
  if (music) {
    if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
  } else {
    player.pause();
  }

  if (!start && !custom) { //first background
    background(initialBack);
  }

  colorMode(HSB);
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text(tnak, width/2, height/2);
  textSize(20);
  text(by, width/2, height/2+30);
  textSize(20);
  fill(0, 0, clickColour);
  text(click, width/2, height/2+65);

  clickColour+=clickVColour; //changes the colour to flash

  if (clickColour >= 255) {
    clickVColour = -5;
  }

  if (clickColour <= 50) {
    clickVColour = 5;
  }
  colorMode(RGB);

  if (key==' ') { //takes you to customization
    custom = true;
  }

  if (custom) {
    customization();
  }

  if (start == true) { //takes out the text
    tnak = "";
    by = "";

    background(255);
    redrawGameField(); //calls the function
  }
}

void keyPressed() {
  if (keyCode==UP) keys[0]=true;
  if (keyCode==DOWN) keys[1]=true;
  if (keyCode==LEFT) keys[2]=true;
  if (keyCode==RIGHT) keys[3]=true;

  if (key=='e') keys[4]=true;
  if (key=='d') keys[5]=true;
  if (key=='s') keys[6]=true;
  if (key=='f') keys[7]=true;

  if (key=='m') keys[8]=true;
  if (key=='q') keys[9]=true;

  if (key==' ' && !gameOverB) {
    if (!settingsB) {
      settingsB = true;
    } else {
      settingsB = false;
    }
  }
}

void keyReleased() {
  if (keyCode==UP) keys[0]=false;
  if (keyCode==DOWN) keys[1]=false;
  if (keyCode==LEFT) keys[2]=false;
  if (keyCode==RIGHT) keys[3]=false;

  if (key=='e') keys[4]=false;
  if (key=='d') keys[5]=false;
  if (key=='s') keys[6]=false;
  if (key=='f') keys[7]=false;

  if (key=='m') keys[8]=false;
  if (key=='q') keys[9]=false;
}