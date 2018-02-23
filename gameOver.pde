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

void gameOver() { //game over function
  settingsB = false; //makes the settings menu false
  rectMode(CORNER);
  fill(255, 0, 0, 100);
  rect(0, 0, width, height-100);

  fill(0); //game over text
  textSize(90);
  text("Game Over!", width/2, height/2-80);

  if (score1>=5) {
    textSize(50);
    fill(tintTopR1, tintTopG1, tintTopB1); //fills with the tank colour
    text("Player One Wins!", width/2, height/2-20);
  } else {
    textSize(50);
    fill(tintTopR2, tintTopG2, tintTopB2);
    text("Player Two Wins!", width/2, height/2-20);
  }

  colorMode(HSB);
  textSize(30);
  fill(0, 0, clickColour);
  text("Press 'r' to Restart", width/2, height/2+30);

  if (key=='r' || key=='R') { //restarts the game when the r button is pressed
    gameOverB = false;
    score1 = 0;
    score2 = 0;
  }
}