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

int numFrames4 = 27; //checkmark sprites
PImage [] checkMark = new PImage[numFrames4];
int currentFrame4 = 1;

int numFrames5 = 27;
PImage [] checkMark2 = new PImage[numFrames4];
int currentFrame5 = 1;

boolean check1 = false; //check mark variables
boolean check2 = false;

boolean checkAnimation1 = false;
boolean checkAnimation2 = false;

boolean checkIdle1 = false;
boolean checkIdle2 = false;

int tintTopR1 = 255; //colours of the tanks
int tintTopG1 = 0;
int tintTopB1 = 0;

int tintTopR2 = 0;
int tintTopG2 = 255;
int tintTopB2 = 0;

int tintBottomR1 = 255;
int tintBottomG1 = 0;
int tintBottomB1 = 0;

int tintBottomR2 = 0;
int tintBottomG2 = 255;
int tintBottomB2 = 0;

boolean checkSound1 = true; //sound effects
boolean checkSound2 = true;

void customization() { //customization
  imageMode(CENTER);
  image(paint, width/2, 210);
  image(paint, width/2, height/2+90);

  rectMode(CENTER);
  fill(255);
  rect(width/2, 210, 120, 110);
  rect(width/2, 390, 120, 110);

  colorMode(RGB);
  tint(tintTopR1, tintTopG1, tintTopB1);
  image(topTnak1, width/2, 184);
  noTint();

  tint(tintBottomR1, tintBottomG1, tintBottomB1);
  image(bottomTnak1, width/2, 235);
  noTint();

  tint(tintTopR2, tintTopG2, tintTopB2);
  image(topTnak2, width/2, 364);
  noTint();

  tint(tintBottomR2, tintBottomG2, tintBottomB2);
  image(bottomTnak2, width/2, 415);
  noTint();

  colorMode(HSB);
  textSize(20);
  text("Player 1:", 220, 140);
  text("Player 2:", 220, 300);

  if (!checkIdle1 && !checkAnimation1) { //allows you to customize the tank if the ready button hasn't been clicked
    noFill();
    //topOne
    if (mouseX>=(318-8) && mouseX<=(318+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 0;
      tintTopG1 = 255;
      tintTopB1 = 0;
    }
    if (mouseX>=(302-8) && mouseX<=(302+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 165;
      tintTopG1 = 255;
      tintTopB1 = 0;
    }
    if (mouseX>=(286-8) && mouseX<=(286+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 255;
      tintTopG1 = 255;
      tintTopB1 = 0;
    }
    if (mouseX>=(270-8) && mouseX<=(270+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 255;
      tintTopG1 = 125;
      tintTopB1 = 0;
    }
    if (mouseX>=(254-8) && mouseX<=(254+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 125;
      tintTopG1 = 65;
      tintTopB1 = 0;
    }
    if (mouseX>=(238-8) && mouseX<=(238+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 255;
      tintTopG1 = 0;
      tintTopB1 = 0;
    }
    if (mouseX>=(222-8) && mouseX<=(222+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 255;
      tintTopG1 = 85;
      tintTopB1 = 235;
    }
    if (mouseX>=(206-8) && mouseX<=(206+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 125;
      tintTopG1 = 85;
      tintTopB1 = 255;
    }
    if (mouseX>=(190-8) && mouseX<=(190+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintTopR1 = 0;
      tintTopG1 = 125;
      tintTopB1 = 255;
    }
    //does the same thing for the bottom
    //bottomOne
    if (mouseX>=(481-8) && mouseX<=(481+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 0;
      tintBottomG1 = 255;
      tintBottomB1 = 0;
    }
    if (mouseX>=(497-8) && mouseX<=(497+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 165;
      tintBottomG1 = 255;
      tintBottomB1 = 0;
    }
    if (mouseX>=(513-8) && mouseX<=(513+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 255;
      tintBottomG1 = 255;
      tintBottomB1 = 0;
    }
    if (mouseX>=(529-8) && mouseX<=(529+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 255;
      tintBottomG1 = 125;
      tintBottomB1 = 0;
    }
    if (mouseX>=(545-8) && mouseX<=(545+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 125;
      tintBottomG1 = 65;
      tintBottomB1 = 0;
    }
    if (mouseX>=(561-8) && mouseX<=(561+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 255;
      tintBottomG1 = 0;
      tintBottomB1 = 0;
    }
    if (mouseX>=(577-8) && mouseX<=(577+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 255;
      tintBottomG1 = 85;
      tintBottomB1 = 235;
    }
    if (mouseX>=(593-8) && mouseX<=(593+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 125;
      tintBottomG1 = 85;
      tintBottomB1 = 255;
    }
    if (mouseX>=(609-8) && mouseX<=(609+8) && mouseY>=(212-17) && mouseY<=(212+17) && mousePressed) {
      tintBottomR1 = 0;
      tintBottomG1 = 125;
      tintBottomB1 = 255;
    }
  }

  if (!checkIdle2 && !checkAnimation2) { //does the same thing for the other tank
    //topTwo
    if (mouseX>=(318-8) && mouseX<=(318+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 0;
      tintTopG2 = 255;
      tintTopB2 = 0;
    }
    if (mouseX>=(302-8) && mouseX<=(302+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 165;
      tintTopG2 = 255;
      tintTopB2 = 0;
    }
    if (mouseX>=(286-8) && mouseX<=(286+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 255;
      tintTopG2 = 255;
      tintTopB2 = 0;
    }
    if (mouseX>=(270-8) && mouseX<=(270+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 255;
      tintTopG2 = 125;
      tintTopB2 = 0;
    }
    if (mouseX>=(254-8) && mouseX<=(254+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 125;
      tintTopG2 = 65;
      tintTopB2 = 0;
    }
    if (mouseX>=(238-8) && mouseX<=(238+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 255;
      tintTopG2 = 0;
      tintTopB2 = 0;
    }
    if (mouseX>=(222-8) && mouseX<=(222+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 255;
      tintTopG2 = 85;
      tintTopB2 = 235;
    }
    if (mouseX>=(206-8) && mouseX<=(206+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 125;
      tintTopG2 = 85;
      tintTopB2 = 255;
    }
    if (mouseX>=(190-8) && mouseX<=(190+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintTopR2 = 0;
      tintTopG2 = 125;
      tintTopB2 = 255;
    }

    //bottomTwo
    if (mouseX>=(481-8) && mouseX<=(481+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 0;
      tintBottomG2 = 255;
      tintBottomB2 = 0;
    }
    if (mouseX>=(497-8) && mouseX<=(497+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 165;
      tintBottomG2 = 255;
      tintBottomB2 = 0;
    }
    if (mouseX>=(513-8) && mouseX<=(513+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 255;
      tintBottomG2 = 255;
      tintBottomB2 = 0;
    }
    if (mouseX>=(529-8) && mouseX<=(529+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 255;
      tintBottomG2 = 125;
      tintBottomB2 = 0;
    }
    if (mouseX>=(545-8) && mouseX<=(545+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 125;
      tintBottomG2 = 65;
      tintBottomB2 = 0;
    }
    if (mouseX>=(561-8) && mouseX<=(561+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 255;
      tintBottomG2 = 0;
      tintBottomB2 = 0;
    }
    if (mouseX>=(577-8) && mouseX<=(577+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 255;
      tintBottomG2 = 85;
      tintBottomB2 = 235;
    }
    if (mouseX>=(593-8) && mouseX<=(593+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 125;
      tintBottomG2 = 85;
      tintBottomB2 = 255;
    }
    if (mouseX>=(609-8) && mouseX<=(609+8) && mouseY>=(393-17) && mouseY<=(393+17) && mousePressed) {
      tintBottomR2 = 0;
      tintBottomG2 = 125;
      tintBottomB2 = 255;
    }
  }

  if (checkAnimation1) { //checkmark animation
    imageMode(CENTER);
    image(checkMark[currentFrame4], width/2, 220);
    if (checkSound1) {
      if (!soundEffects) {
        checkSound.trigger();
      }
      checkSound1 = false;
    }
    if (frameCount%2==0) {
      currentFrame4++;
    }
    if (currentFrame4 >= checkMark.length) {
      checkIdle1 = true;
      checkAnimation1 = false;
    }
  }

  if (checkIdle1) { //makes the checkmark stay there
    image(lastFrame, width/2, 220);
  }

  if (checkAnimation2) { //other checkmark animation
    imageMode(CENTER);
    image(checkMark2[currentFrame5], width/2, 400);
    if (checkSound2) {
      if (!soundEffects) {
        checkSound.trigger();
      }
      checkSound2 = false;
    }
    if (frameCount%2==0) {
      currentFrame5++;
    }
    if (currentFrame5 >= checkMark2.length) {
      checkIdle2 = true;
      checkAnimation2 = false;
    }
  }

  if (checkIdle2) { //other checkmark
    image(lastFrame, width/2, 400);
  }

  if (check1 && check2) { //if both checkmarks show up and a slight delay has happened, the game starts
    if (!checkAnimation1 && !checkAnimation2 && frameCount%50==0) {
      start = true;
    }
  }
}