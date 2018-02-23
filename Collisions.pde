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

void checkCollisions() {
  if (walls) { //if walls are true, then collisions are true
    if (backgroundSelector==1) { //gets the walls of only the maze on the six points that follow the tank
      if ((maze1.get((int)topX1, (int)topY1) != borderColour)) {
        up1 = true;
      } 
      if ((maze1.get((int)topX1, (int)topY1) == borderColour) || (maze1.get((int)topLeftX1, (int)topLeftY1)==borderColour) || (maze1.get((int)topRightX1, (int)topRightY1)==borderColour) || RCMissile1) {
        up1 = false;
      }

      if ((maze1.get((int)bottomX1, (int)bottomY1) != borderColour)) {
        down1 = true;
      } 
      if ((maze1.get((int)bottomX1, (int)bottomY1) == borderColour) || (maze1.get((int)bottomLeftX1, (int)bottomLeftY1)==borderColour) || (maze1.get((int)bottomRightX1, (int)bottomRightY1)==borderColour) || RCMissile1) {
        down1 = false;
      }
    }
    if (backgroundSelector==2) {
      if ((maze2.get((int)topX1, (int)topY1) != borderColour)) {
        up1 = true;
      } 
      if ((maze2.get((int)topX1, (int)topY1) == borderColour) || (maze2.get((int)topLeftX1, (int)topLeftY1)==borderColour) || (maze2.get((int)topRightX1, (int)topRightY1)==borderColour) || RCMissile1) {
        up1 = false;
      }

      if ((maze2.get((int)bottomX1, (int)bottomY1) != borderColour)) {
        down1 = true;
      } 
      if ((maze2.get((int)bottomX1, (int)bottomY1) == borderColour) || (maze2.get((int)bottomLeftX1, (int)bottomLeftY1)==borderColour) || (maze2.get((int)bottomRightX1, (int)bottomRightY1)==borderColour) || RCMissile1) {
        down1 = false;
      }
    }
    if (backgroundSelector==3) {
      if ((maze3.get((int)topX1, (int)topY1) != borderColour)) {
        up1 = true;
      } 
      if ((maze3.get((int)topX1, (int)topY1) == borderColour) || (maze3.get((int)topLeftX1, (int)topLeftY1)==borderColour) || (maze3.get((int)topRightX1, (int)topRightY1)==borderColour)|| RCMissile1) {
        up1 = false;
      }

      if ((maze3.get((int)bottomX1, (int)bottomY1) != borderColour)) {
        down1 = true;
      } 
      if ((maze3.get((int)bottomX1, (int)bottomY1) == borderColour) || (maze3.get((int)bottomLeftX1, (int)bottomLeftY1)==borderColour) || (maze3.get((int)bottomRightX1, (int)bottomRightY1)==borderColour) || RCMissile1) {
        down1 = false;
      }
    }


    //does the same for the other tank
    if (backgroundSelector==1) {
      if ((maze1.get((int)topX2, (int)topY2) != borderColour)) {
        up2 = true;
      } 
      if ((maze1.get((int)topX2, (int)topY2) == borderColour) || (maze1.get((int)topLeftX2, (int)topLeftY2)==borderColour) || (maze1.get((int)topRightX2, (int)topRightY2)==borderColour) || RCMissile2) {
        up2 = false;
      }

      if ((maze1.get((int)bottomX2, (int)bottomY2) != borderColour)) {
        down2 = true;
      } 
      if ((maze1.get((int)bottomX2, (int)bottomY2) == borderColour) || (maze1.get((int)bottomLeftX2, (int)bottomLeftY2)==borderColour) || (maze1.get((int)bottomRightX2, (int)bottomRightY2)==borderColour) || RCMissile2) {
        down2 = false;
      }
    }
    if (backgroundSelector==2) {
      if ((maze2.get((int)topX2, (int)topY2) != borderColour)) {
        up2 = true;
      } 
      if ((maze2.get((int)topX2, (int)topY2) == borderColour) || (maze2.get((int)topLeftX2, (int)topLeftY2)==borderColour) || (maze2.get((int)topRightX2, (int)topRightY2)==borderColour) || RCMissile2) {
        up2 = false;
      }

      if ((maze2.get((int)bottomX2, (int)bottomY2) != borderColour)) {
        down2 = true;
      } 
      if ((maze2.get((int)bottomX2, (int)bottomY2) == borderColour) || (maze2.get((int)bottomLeftX2, (int)bottomLeftY2)==borderColour) || (maze2.get((int)bottomRightX2, (int)bottomRightY2)==borderColour) || RCMissile2) {
        down2 = false;
      }
    }
    if (backgroundSelector==3) {
      if ((maze3.get((int)topX2, (int)topY2) != borderColour)) {
        up2 = true;
      } 
      if ((maze3.get((int)topX2, (int)topY2) == borderColour) || (maze3.get((int)topLeftX2, (int)topLeftY2)==borderColour) || (maze3.get((int)topRightX2, (int)topRightY2)==borderColour)|| RCMissile2) {
        up2 = false;
      }

      if ((maze3.get((int)bottomX2, (int)bottomY2) != borderColour)) {
        down2 = true;
      } 
      if ((maze3.get((int)bottomX2, (int)bottomY2) == borderColour) || (maze3.get((int)bottomLeftX2, (int)bottomLeftY2)==borderColour) || (maze3.get((int)bottomRightX2, (int)bottomRightY2)==borderColour) || RCMissile2) {
        down2 = false;
      }
    }
  } else { //if walls are false, then it gets the corresponding background
    if ((noWalls.get((int)topX1, (int)topY1) != borderColour)) {
      up1 = true;
    } 
    if ((noWalls.get((int)topX1, (int)topY1) == borderColour) || (noWalls.get((int)topLeftX1, (int)topLeftY1)==borderColour) || (noWalls.get((int)topRightX1, (int)topRightY1)==borderColour) || RCMissile1) {
      up1 = false;
    }

    if ((noWalls.get((int)bottomX1, (int)bottomY1) != borderColour)) {
      down1 = true;
    }
    if ((noWalls.get((int)bottomX1, (int)bottomY1) == borderColour) || (noWalls.get((int)bottomLeftX1, (int)bottomLeftY1)==borderColour) || (noWalls.get((int)bottomRightX1, (int)bottomRightY1)==borderColour) || RCMissile1) {
      down1 = false;
    }


    if ((noWalls.get((int)topX2, (int)topY2) != borderColour)) {
      up2 = true;
    } 
    if ((noWalls.get((int)topX2, (int)topY2) == borderColour) || (noWalls.get((int)topLeftX2, (int)topLeftY2)==borderColour) || (noWalls.get((int)topRightX2, (int)topRightY2)==borderColour) || RCMissile2) {
      up2 = false;
    }

    if ((noWalls.get((int)bottomX2, (int)bottomY2) != borderColour)) {
      down2 = true;
    }
    if ((noWalls.get((int)bottomX2, (int)bottomY2) == borderColour) || (noWalls.get((int)bottomLeftX2, (int)bottomLeftY2)==borderColour) || (noWalls.get((int)bottomRightX2, (int)bottomRightY2)==borderColour) || RCMissile2) {
      down2 = false;
    }
  }


  for (int i = 0; i<bulletX1.length; i++) {
    if (bulletVisible1[i] && tankVisible1 && loop2!=1) { //determines if the tank has been hit
      if ((bulletY1[i]-2<=tankY2+16 && bulletY1[i]+2>=tankY2-16) && (bulletX1[i]+2>=tankX2-10 && bulletX1[i]-2<=tankX2+10)) {
        bulletVisible1[i] = false;
        if (!soundEffects) {
          exSound.trigger();
        }
        hit2 = true;
      }
    }
  }
  for (int i = 0; i<bulletX2.length; i++) {
    if (bulletVisible2[i] && tankVisible2 && loop1!=1) { //does the same for the other tank
      if ((bulletY2[i]-2<=tankY1+10 && bulletY2[i]+2>=tankY1-10) && (bulletX2[i]+2>=tankX1-10 && bulletX2[i]-2<=tankX1+10)) {
        bulletVisible2[i] = false;
        if (!soundEffects) {
          exSound.trigger();
        }
        hit1 = true;
      }
    }
  }

  for (int i = 0; i<bulletX1.length; i++) {
    if (bulletVisible1[i]) { //makes the bullets bounce off of the walls
      if (get((int)bulletX1[i]+5, (int)bulletY1[i])==borderColour) {
        bulletR1[i] = 180-bulletR1[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
      if (get((int)bulletX1[i]-5, (int)bulletY1[i])==borderColour) {
        bulletR1[i] = 180-bulletR1[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
      if (get((int)bulletX1[i], (int)bulletY1[i]-5)==borderColour) {
        bulletR1[i] = 360-bulletR1[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
      if (get((int)bulletX1[i], (int)bulletY1[i]+5)==borderColour) {
        bulletR1[i] = 360-bulletR1[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
    }
  }


  for (int i = 0; i<bulletX2.length; i++) {
    if (bulletVisible2[i]) { //does the same for the other tank's bullets
      if (get((int)bulletX2[i]+5, (int)bulletY2[i])==borderColour) {
        bulletR2[i] = 180-bulletR2[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
      if (get((int)bulletX2[i]-5, (int)bulletY2[i])==borderColour) {
        bulletR2[i] = 180-bulletR2[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
      if (get((int)bulletX2[i], (int)bulletY2[i]-5)==borderColour) {
        bulletR2[i] = 360-bulletR2[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
      if (get((int)bulletX2[i], (int)bulletY2[i]+5)==borderColour) {
        bulletR2[i] = 360-bulletR2[i];
        if (!soundEffects) {
          bulletBounce1.trigger();
        }
      }
    }
  }

  if (powerUps) {
    for (int i = 0; i<numberOfPowerUps; i++) {
      if (powerVisible[i]) { //determines if the tank has picked up a powerup
        dist = distance((int)tankX1, (int)tankY1, (int)powerX[i], (int)powerY[i]);
        if (dist <= powerD && !rocketB1) {
          if (!soundEffects) {
            powerupSound.trigger();
          }
          rocketB1 = true;
          m1 = 1;
          powerVisible[i] = false;
          missileVisible1 = true;
          timerThing1 = 10;
        }
      }
    }
  }

  if (powerUps) {
    for (int i = 0; i<numberOfPowerUps; i++) {
      if (powerVisible[i]) { //determines if the other tank has picked up a powerup
        dist2 = distance((int)tankX2, (int)tankY2, (int)powerX[i], (int)powerY[i]);
        if (dist2 <= powerD && !rocketB2) {
          if (!soundEffects) {
            powerupSound.trigger();
          }
          rocketB2 = true;
          m2 = 1;
          powerVisible[i] = false;
          missileVisible2 = true;
          timerThing2 = 10;
        }
      }
    }
  }

  if (missileVisible1 && tankVisible2 && loop2!=1) { //determines if the missile hit the tank
    if ((missileY1-7<=tankY2+16 && missileY1+7>=tankY2-16) && (missileX1+8>=tankX2-10 && missileX1-8<=tankX2+10)) {
      missileX1 = -50;
      missileY1 = -50;
      missileVisible1 = false;
      RCMissile1 = false;
      rocketB1 = false;
      //score1++;
      if (!soundEffects) {
        exSound.trigger();
      }
      hit2 = true;
    }
  }

  if (missileVisible2 && tankVisible1 && loop1!=1) { ///determines if the missile hit the other tank
    if ((missileY2-7<=tankY1+16 && missileY2+7>=tankY1-16) && (missileX2+8>=tankX1-10 && missileX2-8<=tankX1+10)) {
      missileX2 = -50;
      missileY2 = -50;
      missileVisible2 = false;
      RCMissile2 = false;
      rocketB2 = false;
      //score2++;
      if (!soundEffects) {
        exSound.trigger();
      }
      hit1 = true;
    }
  }
}

int distance (int x1, int y1, int x2, int y2) {
  return round(sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2)));
}