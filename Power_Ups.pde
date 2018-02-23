////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Name:
//  _____              _      _   _  __     _       _                   _    _ 
// |  __ \            (_)    | | | |/ /    | |     | |                 | |  (_)
// | |  | | __ _ _ __  _  ___| | | ' /_   _| | __ _| | _____  _   _ ___| | ___ 
// | |  | |/ _` | '_ \| |/ _ \ | |  <| | | | |/ _` | |/ / _ \| | | / __| |/ / |
// | |__| | (_| | | | | |  __/ | | . \ |_| | | (_| |   < (_) | |_| \__ \   <| |
// |_____/ \__,_|_| |_|_|\___|_| |_|\_\__,_|_|\__,_|_|\_\___/ \__,_|___/_|\_\_|
//Due Date: June 20, 2016
//Description: Tank game where the objective is to shoot the other tank and gain points (inspiration from https://www.tanktrouble.com/?game)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

PImage rocket; //missile

int numberOfPowerUps = 2; //missile powerup variables
float [] powerX = new float [numberOfPowerUps];
float [] powerY = new float [numberOfPowerUps];
boolean [] powerVisible = new boolean [numberOfPowerUps];

float [] powerRotate = new float [numberOfPowerUps];

boolean rocketB1 = false; //missile
boolean rocketB2 = false;

PImage missile; //missile image

int powerD = 25; //diameter of the missile

boolean RCMissile1 = false; //shoot missile variable
boolean RCMissile2 = false;

float missileX1; //missile x and y
float missileY1;
float missileX2;
float missileY2;

int m1 = 1; //allows for only one loop
int m2 = 1;

int numFrames7 = 4; //wifi looking sprite when the missile is fired
PImage [] wifi = new PImage[numFrames7];
int currentFrame7 = 1;

float wifiX1; //x and y of the missile
float wifiY1;
float wifiX2;
float wifiY2;

boolean missileVisible1 = false; //missile visibility
boolean missileVisible2 = false;

boolean missileTrail1 = false; //trail of the missile

void generatePowerUps() {
  if (powerUps) { //generates powerups with random rotation and coordinates
    for (int i = 0; i<numberOfPowerUps; i++) {
      powerVisible[i] = true;
      powerX[i] = int(random(20+powerD, width-powerD));
      powerY[i] = int(random(500-powerD));
      powerRotate[i] = random(5, 70);
    }
  }
}

void powerUps() {
  if (powerUps) { //
    for (int i = 0; i<numberOfPowerUps; i++) {
      if (powerVisible[i]) { //shows the image
        pushMatrix();
        translate(powerX[i], powerY[i]);
        rotate(radians(powerRotate[i]));
        image(rocket, 0, 0);
        popMatrix();
      }
    }
  }
  //if both powerups aren't visible, new ones are generates
  if (!powerVisible[0] && !powerVisible[1]) {
    for (int i = 0; i<powerX.length; i++) {
      powerX[i] = int(random(20+powerD, width-powerD));
      powerY[i] = int(random(500-powerD));
      powerVisible[i] = true;
    }
  }
}