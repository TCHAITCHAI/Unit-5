void gameover() {
  background(orange);

  // Font
  textFont(arcade);
  textAlign(CENTER, CENTER);

  // Title
  fill(255);
  textSize(60);
  text("Game Over", width / 2, height / 4);

  // Winner
  textSize(36);
  if (leftscore == 7) {
    fill(blue);
    text("Blue Wins!", width / 2, height / 2 - 30);
  } else if (rightscore == 7) {
    fill(red);
    text("Red Wins!", width / 2, height / 2 - 30);
  }

  // Buttons
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  // Play Again button
  fill(0);
  rect(width / 2, height / 2 + 50, 240, 60, 20);
  fill(255);
  textSize(20);
  text("Play Again", width / 2, height / 2 + 50);

  // Back to Menu button
  fill(0);
  rect(width / 2, height / 2 + 130, 240, 60, 20);
  fill(255);
  textSize(17);
  text("Back to Menu", width / 2, height / 2 + 130);
}


void gameoverClicks() {
  float x = width / 2;
  
  // Play Again button
  if (mouseX > x - 120 && mouseX < x + 120 &&
      mouseY > height / 2 + 20 && mouseY < height / 2 + 80) {
    leftscore = 0;
    rightscore = 0;
    resetBall();
    mode = GAME;
  }

  // Back to Menu button
  if (mouseX > x - 120 && mouseX < x + 120 &&
      mouseY > height / 2 + 100 && mouseY < height / 2 + 160) {
    leftscore = 0;
    rightscore = 0;
    introBallPlaced = false;
    mode = INTRO;
  }
}
