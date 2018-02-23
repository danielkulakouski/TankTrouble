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

void mousePressed() { //mouse variables
  if ((mouseX>10 && mouseX<30) && (mouseY>520-10 && mouseY<520+10) && !settingsB && !gameOverB) {
    settingsB = true; //shows the settings menu
  } else if ((mouseX>10 && mouseX<30) && (mouseY>520-10 && mouseY<520+10) && settingsB) {
    settingsB = false; //hides it
  }


  //settings Options
  if (settingsB) { //activates force
    if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=324-(12/2) && mouseY<=324+(12/2)) && mousePressed && !force) {
      force = true;
      walls = false;
    } else if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=324-(12/2) && mouseY<=324+(12/2)) && mousePressed && force) {
      force = false;
      walls = true;
    }
    //counts the score
    if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=303-(12/2) && mouseY<=303+(12/2)) && mousePressed && !countScore) {
      countScore = true;
    } else if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=303-(12/2) && mouseY<=303+(12/2)) && mousePressed && countScore) {
      countScore = false;
    }
    //first to five
    if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=283-(12/2) && mouseY<=283+(12/2)) && mousePressed && !firstToFive) {
      firstToFive = true;
    } else if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=283-(12/2) && mouseY<=283+(12/2)) && mousePressed && firstToFive) {
      firstToFive = false;
    }
    //unlimited bullets
    if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=263-(12/2) && mouseY<=263+(12/2)) && mousePressed && unlimitedBullets) {
      unlimitedBullets = false;
    } else if ((mouseX>=424-(42/2) && mouseX<=424+(42/2)) && (mouseY>=263-(12/2) && mouseY<=263+(12/2)) && mousePressed && !unlimitedBullets) {
      unlimitedBullets = true;
    }
    //missile powerup
    if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=323-(12/2) && mouseY<=323+(12/2)) && mousePressed && powerUps) {
      powerUps = false;
    } else if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=323-(12/2) && mouseY<=323+(12/2)) && mousePressed && !powerUps) {
      powerUps = true;
    }
    //walls
    if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=303-(12/2) && mouseY<=303+(12/2)) && mousePressed && walls) {
      walls = false;
    } else if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=303-(12/2) && mouseY<=303+(12/2)) && mousePressed && !walls) {
      walls = true;
    }
    //sound effects
    if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=283-(12/2) && mouseY<=283+(12/2)) && mousePressed && soundEffects) {
      soundEffects = false;
    } else if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=283-(12/2) && mouseY<=283+(12/2)) && mousePressed && !soundEffects) {
      soundEffects = true;
    }
    //background music
    if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=263-(12/2) && mouseY<=263+(12/2)) && mousePressed && music) {
      music = false;
    } else if ((mouseX>=293-(42/2) && mouseX<=293+(42/2)) && (mouseY>=263-(12/2) && mouseY<=263+(12/2)) && mousePressed && !music) {
      music = true;
    }
  }



  if (custom) { //checkmark when the ready button is pressed for each tank
    if ((mousePressed && mouseX >= width/2-(110/2) && mouseX <= width/2+(110/2)) && (mouseY >= (283-15) && mouseY <= (283+15)) && !check1) {
      check1 = true;
      currentFrame4 = 1;
      checkAnimation1 = true;
    } else if ((mousePressed && mouseX >= width/2-(110/2) && mouseX <= width/2+(110/2)) && (mouseY >= (283-15) && mouseY <= (283+15)) && check1) {
      check1 = false;
      checkIdle1 = false;
      checkAnimation1 = false;
    }

    if ((mousePressed && mouseX >= width/2-(110/2) && mouseX <= width/2+(110/2)) && (mouseY >= (463-15) && mouseY <= (463+15)) && !check2) {
      check2 = true;
      currentFrame5 = 1;
      checkAnimation2 = true;
    } else if ((mousePressed && mouseX >= width/2-(110/2) && mouseX <= width/2+(110/2)) && (mouseY >= (463-15) && mouseY <= (463+15)) && check2) {
      check2 = false;
      checkIdle2 = false;
      checkAnimation2 = false;
    }
  }
}