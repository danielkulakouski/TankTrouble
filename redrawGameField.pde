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

float [] thingX1 = new float [30]; //missile trail variables
float [] thingY1 = new float [30];
float [] thingX2 = new float [30];
float [] thingY2 = new float [30];

int timerThing1 = 10; //timer for the missiles
int timerThing2 = 10;

float bulletSpawnX1; //points where the bullets spawn out of the tanks
float bulletSpawnY1;
float bulletSpawnX2;
float bulletSpawnY2;

float missileSpawnX1; //points where the missiles spawn out of the tanks
float missileSpawnY1;
float missileSpawnX2;
float missileSpawnY2;

boolean music = true; //settings menu booleans
boolean soundEffects = false;
boolean walls = true;
boolean powerUps = true;
boolean unlimitedBullets = true;
boolean countScore = true;
boolean firstToFive = true;

PImage noWalls; //maze with no walls

boolean gameOverB = false; //game over boolean

void redrawGameField() {
  imageMode(CORNER);
  if (walls) { //loads the first maze if walls are true
    if (backgroundSelector==1) {
      image(maze1, 0, 0);
    }
    if (backgroundSelector==2) {
      image(maze2, 0, 0);
    }
    if (backgroundSelector==3) {
      image(maze3, 0, 0);
    }
  } else { //if wals aren't true then load the other maze with no walls
    image(noWalls, 0, 0);
  }

  image(bottomBar, 0, 500); //bottom bar with the score

  imageMode(CENTER);
  colorMode(RGB); //tints the top and bottom tank images on the bottom bar
  tint(tintTopR1, tintTopG1, tintTopB1);
  image(topTnak1, 203, 530);
  noTint();
  tint(tintBottomR1, tintBottomG1, tintBottomB1);
  image(bottomTnak1, 203, 580);
  noTint();

  tint(tintTopR2, tintTopG2, tintTopB2);
  image(topTnakM, 590, 530); //does the same thing for the other tank
  noTint();
  tint(tintBottomR2, tintBottomG2, tintBottomB2);
  image(bottomTnakM, 590, 580);
  noTint();

  if (!settingsB) { //settings icon
    imageMode(CENTER);
    image(stillSettings, 20, 520);

    powerUps();

    if (!gameOverB) { //you can only move the tanks if its not gameover
      //red tnak
      if (keys[0] && up1) {
        tankX1+=2*cos(radians(tankRotate1));
        tankY1+=2*sin(radians(tankRotate1));
      }
      if (keys[1] && down1) {
        tankX1-=1.2*cos(radians(tankRotate1)); 
        tankY1-=1.2*sin(radians(tankRotate1));
      }
      if (keys[2] && left1) { //rotates the tank
        tankRotate1-=tankRSpeed1;
      } 
      if (keys[3] && right1) {
        tankRotate1+=tankRSpeed1;
      }

      //green tnak
      if (keys[4] && up2) { //does the same for the other tank
        tankX2+=2*cos(radians(tankRotate2));
        tankY2+=2*sin(radians(tankRotate2));
      }
      if (keys[5] && down2) {
        tankX2-=1.2*cos(radians(tankRotate2)); 
        tankY2-=1.2*sin(radians(tankRotate2));
      }
      if (keys[6] && left2) {
        tankRotate2-=tankRSpeed2;
      }
      if (keys[7] && right2) {
        tankRotate2+=tankRSpeed2;
      }

      bulletSpawnX1 = tankX1+cos(radians(tankRotate1+180))*-20.0; //spawn points for the bullets
      bulletSpawnY1 = tankY1+sin(radians(tankRotate1+180))*-20.0;

      if (keys[8] && triggerReleased1 && !rocketB1 && !maxBullet1) { //shoots bullets when m is pressed for the first tank
        triggerReleased1 = false;
        if (!soundEffects) { //only plays the sound effects if the sound effects are on
          shot.trigger();
        }
        bulletX1[currentBullet1] = bulletSpawnX1;
        bulletY1[currentBullet1] = bulletSpawnY1;           
        bulletVisible1[currentBullet1] = true;

        bulletR1 = append(bulletR1, tankRotate1); //appends the rotation of the tank so that the force doesn't happen
        currentBullet1++;
      } else if (keys[8]==false) {
        triggerReleased1 = true; //makes the trigger released variable false
      }
      if (keys[8] && rocketB1) {
        RCMissile1 = true; //if the player picked up the rocket powerup, then you can shoot a missile instead of a bullet
      }

      bulletSpawnX2 = tankX2+cos(radians(tankRotate2+180))*-20.0;
      bulletSpawnY2 = tankY2+sin(radians(tankRotate2+180))*-20.0;

      if (keys[9] && triggerReleased2 && !rocketB2 && !maxBullet2) { //does the same thing for the other tank
        triggerReleased2 = false;
        if (!soundEffects) {
          shot.trigger();
        }
        bulletX2[currentBullet2] = bulletSpawnX2;
        bulletY2[currentBullet2] = bulletSpawnY2;
        bulletVisible2[currentBullet2] = true;

        bulletR2 = append(bulletR2, tankRotate2);
        currentBullet2++;
      } else if (keys[9]==false) {
        triggerReleased2 = true;
      }
      if (keys[9] && rocketB2) {
        RCMissile2 = true;
      }
    }

    for (int i = 0; i<bulletVisible1.length; i++) { //makes the bullets
      if (bulletVisible1[i] == true) {
        strokeWeight(1);
        stroke(0);
        fill(0);
        ellipse(bulletX1[i], bulletY1[i], 5, 5);
      }
    }

    for (int i = 0; i<bulletVisible2.length; i++) {
      if (bulletVisible2[i] == true) {
        strokeWeight(1);
        stroke(0);
        fill(0);
        ellipse(bulletX2[i], bulletY2[i], 5, 5);
      }
    }

    //noFill();
    smooth();
    topLeftX1 = tankX1+cos(radians(tankRotate1+90+55))*-15.0; //collision detection points for each of the tanks that follow the tank and rotates with it
    topLeftY1 = tankY1+sin(radians(tankRotate1+90+55))*-15.0;
    //ellipse(topLeftX1, topLeftY1, 20, 20);

    bottomRightX1 = tankX1+cos(radians(tankRotate1+90+55))*15.0;
    bottomRightY1 = tankY1+sin(radians(tankRotate1+90+55))*15.0;
    //ellipse(bottomRightX1, bottomRightY1, 20, 20);

    topRightX1 = tankX1+cos(radians(-tankRotate1+90+55))*15.0;
    topRightY1 = tankY1+sin(radians(-tankRotate1+90+55))*-15.0;
    //ellipse(topRightX1, topRightY1, 20, 20);

    bottomLeftX1 = tankX1+cos(radians(-tankRotate1+90+55))*-15.0;
    bottomLeftY1 = tankY1+sin(radians(-tankRotate1+90+55))*15.0;
    //ellipse(bottomLeftX1, bottomLeftY1, 20, 20);

    topX1 = tankX1-cos(radians(tankRotate1))*-15.0;
    topY1 = tankY1-sin(radians(tankRotate1))*-15.0;
    //ellipse(topX1, topY1, 20, 20);

    bottomX1 = tankX1+cos(radians(tankRotate1))*-15.0;
    bottomY1 = tankY1+sin(radians(tankRotate1))*-15.0;
    //ellipse(bottomX1, bottomY1, 20, 20);



    topLeftX2 = tankX2+cos(radians(tankRotate2+90+55))*-15.0; //does the same for the other tank
    topLeftY2 = tankY2+sin(radians(tankRotate2+90+55))*-15.0;
    //ellipse(topLeftX1, topLeftY1, 20, 20);

    bottomRightX2 = tankX2+cos(radians(tankRotate2+90+55))*15.0;
    bottomRightY2 = tankY2+sin(radians(tankRotate2+90+55))*15.0;
    //ellipse(bottomRightX1, bottomRightY1, 20, 20);

    topRightX2 = tankX2+cos(radians(-tankRotate2+90+55))*15.0;
    topRightY2 = tankY2+sin(radians(-tankRotate2+90+55))*-15.0;
    //ellipse(topRightX1, topRightY1, 20, 20);

    bottomLeftX2 = tankX2+cos(radians(-tankRotate2+90+55))*-15.0;
    bottomLeftY2 = tankY2+sin(radians(-tankRotate2+90+55))*15.0;
    //ellipse(bottomLeftX1, bottomLeftY1, 20, 20);

    topX2 = tankX2-cos(radians(tankRotate2))*-15.0;
    topY2 = tankY2-sin(radians(tankRotate2))*-15.0;
    //ellipse(topX1, topY1, 20, 20);

    bottomX2 = tankX2+cos(radians(tankRotate2))*-15.0;
    bottomY2 = tankY2+sin(radians(tankRotate2))*-15.0;
    //ellipse(bottomX1, bottomY1, 20, 20);

    imageMode(CENTER);

    colorMode(RGB);
    if (tankVisible1) { //shows only if the tank is visible
      pushMatrix();
      translate(tankX1, tankY1);
      rotate(radians(tankRotate1+90));
      //image(redTnak, 0, 0);
      tint(tintBottomR1, tintBottomG1, tintBottomB1); // tints the tank
      image(bottomTnakG1, 0, 0);
      noTint();
      tint(tintTopR1, tintTopG1, tintTopB1);
      if (!rocketB1) {
        image(topTnakG1, 0, 0); //only draws the top part if the missile top part is false
      }
      noTint();
      popMatrix();

      missileSpawnX1 = tankX1+cos(radians(tankRotate1+180))*-22.0;
      missileSpawnY1 = tankY1+sin(radians(tankRotate1+180))*-22.0;

      if (rocketB1) { //missile
        if (RCMissile1) { //missile shoot
          if (m1==1) { //loops only once
            missileX1 = missileSpawnX1;
            missileY1 = missileSpawnY1;
            if (!soundEffects) {
              missileSound.trigger();
            }
            m1++;
          }

          if (missileVisible1) { //decreases the timer every second
            if (frameCount%60==0) {
              timerThing1--;
            }

            if (timerThing1>=0) { //only shows the missile if the timer is greater than zero
              pushMatrix(); //wifi animation
              translate(wifiX1, wifiY1);
              rotate(radians(tankRotate1+90));
              tint(tintBottomR1, tintBottomG1, tintBottomB1);
              imageMode(CENTER);
              image(wifi[currentFrame7], 0, 0);
              if (frameCount%15==0) {
                currentFrame7++;
              }
              if (currentFrame7 >= wifi.length) {
                currentFrame7 = 1;
              }
              noTint();
              popMatrix();

              for (int i=0; i<29; i++) { //missile trail
                thingX1[i] = thingX1[i+1];
                thingY1[i] = thingY1[i+1];

                //noStroke();
                strokeWeight(i/30);
                stroke(tintTopR1, tintTopG1, tintTopB1); //colours the stroke with the bottom tint
                fill(tintBottomR1, tintBottomG1, tintBottomB1); //colours the fill with the top tint
                ellipse (thingX1[i], thingY1[i], i/4, i/4);
              }
              thingX1[29] = missileX1; //makes the trail spawn at the missile coordinates
              thingY1[29] = missileY1;

              imageMode(CENTER); //missile image
              pushMatrix();
              translate(missileX1, missileY1);
              rotate(radians(tankRotate1+90));
              tint(tintTopR1, tintTopG1, tintTopB1);
              image(missile, 0, 0);
              noTint();
              popMatrix();

              if (frameCount%120==0) { //plays a beeping sound every two seconds
                if (!soundEffects) {
                  missileBeep.trigger();
                }
              }

              up1 = false; //doesn't allow you to move
              down1 = false;
            } else {
              RCMissile1 = false;
              rocketB1 = false;
            }
          }
        }

        pushMatrix(); //tank without the missile
        translate(tankX1, tankY1);
        rotate(radians(tankRotate1+90));
        tint(tintTopR1, tintTopG1, tintTopB1);
        image(tankNoMissile, 0, 0);
        noTint();
        popMatrix();

        missileX1 += 2.2*sin(radians(-tankRotate1+90)); //missile coordinates
        missileY1 += 2.2*cos(radians(-tankRotate1+90));

        wifiX1 = tankX1-cos(radians(tankRotate1))*-30.0; //wifi coordinates
        wifiY1 = tankY1-sin(radians(tankRotate1))*-30.0;

        if (!RCMissile1) { //if the missile isn't fired, then it shows the tank with the missile attached
          pushMatrix();
          translate(tankX1, tankY1);
          rotate(radians(tankRotate1+90));
          tint(tintTopR1, tintTopG1, tintTopB1);
          image(tankWMissile, 0, 0);
          noTint();
          popMatrix();
        }
      }
    }

    if (tankVisible2) { //does the same for the second tank
      pushMatrix();
      translate(tankX2, tankY2);
      rotate(radians(tankRotate2+90));
      //image(greenTnak, 0, 0);
      tint(tintBottomR2, tintBottomG2, tintBottomB2);
      image(bottomTnakG2, 0, 0);
      noTint();
      tint(tintTopR2, tintTopG2, tintTopB2);
      if (!rocketB2) {
        image(topTnakG2, 0, 0);
      }
      noTint();
      popMatrix();

      missileSpawnX2 = tankX2+cos(radians(tankRotate2+180))*-22.0;
      missileSpawnY2 = tankY2+sin(radians(tankRotate2+180))*-22.0;

      if (rocketB2) {
        if (RCMissile2) {
          if (m2==1) {
            missileX2 = missileSpawnX2;
            missileY2 = missileSpawnY2;
            if (!soundEffects) {
              missileSound.trigger();
            }
            m2++;
          }

          if (missileVisible2) {
            if (frameCount%60==0) {
              timerThing2--;
            }

            if (timerThing2>=0) {
              pushMatrix();
              translate(wifiX2, wifiY2);
              rotate(radians(tankRotate2+90));
              tint(tintBottomR2, tintBottomG2, tintBottomB2);
              imageMode(CENTER);
              image(wifi[currentFrame7], 0, 0);
              if (frameCount%15==0) {
                currentFrame7++;
              }
              if (currentFrame7 >= wifi.length) {
                currentFrame7 = 1;
              }
              noTint();
              popMatrix();

              for (int i=0; i<29; i++) {
                thingX2[i] = thingX2[i+1];
                thingY2[i] = thingY2[i+1];

                //noStroke();
                strokeWeight(i/30);
                stroke(tintTopR2, tintTopG2, tintTopB2);
                fill(tintBottomR2, tintBottomG2, tintBottomB2);
                ellipse (thingX2[i], thingY2[i], i/4, i/4);
              }
              thingX2[29] = missileX2;
              thingY2[29] = missileY2;

              imageMode(CENTER);
              pushMatrix();
              translate(missileX2, missileY2);
              rotate(radians(tankRotate2+90));
              tint(tintTopR2, tintTopG2, tintTopB2);
              image(missile, 0, 0);
              noTint();
              popMatrix();

              if (frameCount%120==0) {
                if (!soundEffects) {
                  missileBeep.trigger();
                }
              }

              up2 = false;
              down2 = false;
            } else {
              RCMissile2 = false;
              rocketB2 = false;
            }
          }
        }

        pushMatrix();
        translate(tankX2, tankY2);
        rotate(radians(tankRotate2+90));
        tint(tintTopR2, tintTopG2, tintTopB2);
        image(tankNoMissile, 0, 0);
        noTint();
        popMatrix();

        missileX2 += 2.2*sin(radians(-tankRotate2+90));
        missileY2 += 2.2*cos(radians(-tankRotate2+90));

        wifiX2 = tankX2-cos(radians(tankRotate2))*-30.0;
        wifiY2 = tankY2-sin(radians(tankRotate2))*-30.0;

        if (!RCMissile2) {
          pushMatrix();
          translate(tankX2, tankY2);
          rotate(radians(tankRotate2+90));
          tint(tintTopR2, tintTopG2, tintTopB2);
          image(tankWMissile, 0, 0);
          noTint();
          popMatrix();
        }
      }
    }

    if (hit1) { //plays the explosion when the first tank is hit
      imageMode(CENTER);
      image(explosion[currentFrame], tankX1, tankY1);
      tankVisible1 = false;
      if (frameCount%7==0) {
        currentFrame++;
      }
      if (currentFrame >= explosion.length) {
        currentFrame = 1;
        hit1 = false;
        loop1 = 1; //loops only once
      }
    }
    if (hit2) { //plays the explosion when the other tank is hit
      imageMode(CENTER);
      image(explosion[currentFrame], tankX2, tankY2);
      tankVisible2 = false;
      if (frameCount%7==0) {
        currentFrame++;
      }
      if (currentFrame >= explosion.length) {
        currentFrame = 1;
        hit2 = false;
        loop2 = 1; //loops only once
      }
    }
  }

  if (settingsB) { //settings icon animation
    imageMode(CENTER);
    image(settings[currentFrame2], 20, 520);
    if (frameCount%2==0) {
      currentFrame2++;
      if (currentFrame2 >= settings.length) {
        currentFrame2 = 1;
      }
    }

    fill(255);
    rectMode(CORNER);
    rect(0, 0, width, 500);
    image(settingsMenu, width/2, height/2); //settings menu
    rectMode(CENTER);

    if ((mouseX>=275 && mouseX<=275+107) && (mouseY>=343 && mouseY<=343+30) && mousePressed) {
      settingsB = false; //hides the settings menu when you click play in the settings menu
    }

    if ((mouseX>=416 && mouseX<=416+107) && (mouseY>=343 && mouseY<=343+30) && mousePressed) { //changes everything to the original booleans when the default button is pressed
      music = true;
      soundEffects = false;
      walls = true;
      powerUps = true;
      unlimitedBullets = true;
      countScore = true;
      firstToFive = true;
      force = false;
    }

    if (!force) { //off switch images
      image(offSwitch, 424, 324);
    }
    if (!music) {
      image(offSwitch, 294, 263);
    }
    if (soundEffects) {
      image(offSwitch, 294, 283);
    }
    if (!walls) {
      image(offSwitch, 294, 303);
    }
    if (!powerUps) {
      image(offSwitch, 294, 323);
    }
    if (!unlimitedBullets) {
      image(offSwitch, 424, 263);
    }
    if (!countScore) {
      image(offSwitch, 424, 303);
    }
    if (!firstToFive) {
      image(offSwitch, 424, 283);
    }
  }

  checkCollisions();
  moveBullets();

  textFont(myFont);
  textSize(25);
  fill(0);
  if (countScore) { //shows the scores
    text(score1, 270, 570);
    text(score2, 520, 570);
  }

  if (loop1==1) { //resets the maze and changes which maze it is, but only loops once
    score2++;
    backgroundSelector = int(random(1, 4));

    for (int i = 0; i<bulletX1.length; i++) { //makes all the bullets invisible
      bulletVisible1[i] = false;
    }
    for (int i = 0; i<bulletX2.length; i++) {
      bulletVisible2[i] = false;
    }

    generatePowerUps();

    rocketB1 = false; //makes everything false
    rocketB2 = false;
    missileVisible1 = false;
    RCMissile1 = false;
    maxBullet1 = false;
    maxBullet2 = false;

    up1 = true;
    down1 = true;
    left1 = true;
    right1 = true;

    if (backgroundSelector==1) { //maze variables
      tankX1 = 100;
      tankY1 = 260;
      tankX2 = 700;
      tankY2 = 260;
      tankRotate2 = 180;
    }
    if (backgroundSelector==2) {
      tankRotate1 = 90;
      tankRotate2 = 270;
      tankX1 = 70;
      tankY1 = 55;
      tankX2 = 720;
      tankY2 = 430;
    }
    if (backgroundSelector==3) {
      tankRotate2 = 180;
      tankX1 = 30;
      tankY1 = 25;
      tankX2 = 770;
      tankY2 = 470;
    }
    loop1++;
    tankVisible1 = true;
  }

  if (loop2==1) { //does the same thing for the other tank
    score1++;
    backgroundSelector = int(random(1, 4));

    for (int i = 0; i<bulletX1.length; i++) {
      bulletVisible1[i] = false;
    }
    for (int i = 0; i<bulletX2.length; i++) {
      bulletVisible2[i] = false;
    }

    generatePowerUps();
    rocketB1 = false;
    rocketB2 = false;
    missileVisible1 = false;
    RCMissile1 = false;
    maxBullet1 = false;
    maxBullet2 = false;

    up2 = true;
    down2 = true;
    left2 = true;
    right2 = true;

    if (backgroundSelector==1) {
      tankX1 = 100;
      tankY1 = 260;
      tankX2 = 700;
      tankY2 = 260;
      tankRotate2 = 180;
    }
    if (backgroundSelector==2) {
      tankRotate1 = 90;
      tankRotate2 = 270;
      tankX1 = 70;
      tankY1 = 55;
      tankX2 = 720;
      tankY2 = 430;
    }
    if (backgroundSelector==3) {
      tankRotate2 = 180;
      tankX1 = 30;
      tankY1 = 25;
      tankX2 = 770;
      tankY2 = 470;
    }
    loop2++;
    tankVisible2 = true;
  }

  if ((score1>=5||score2>=5) && firstToFive) { //if the first to five feature is turned on, then the game over screen plays
    gameOverB = true;
  } else {
    gameOverB = false;
  }

  if (gameOverB) {
    gameOver();
  }
}