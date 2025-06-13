void modeSelect() {
  background(orange);
  textFont(arcade);
  textAlign(CENTER, CENTER);

  // title
  fill(255);
  textSize(48);
  text("Choose Mode", width / 2, height / 4);

  // Single Player button (top one)
  fill(0);
  rectMode(CENTER);
  rect(width / 2, height / 2, 260, 70, 20);
  fill(255);
  textSize(18);
  text("Single Player", width / 2, height / 2);

  // Multiplayer button (bottom one)
  fill(0);
  rect(width / 2, height / 2 + 100, 260, 70, 20);
  fill(255);
  textSize(20);
  text("Multiplayer", width / 2, height / 2 + 100);
}


void modeSelectClicks() {
  float x = width / 2;
  
  // Multiplayer 
  if (mouseX > x - 130 && mouseX < x + 130 &&
      mouseY > height / 2 + 65 && mouseY < height / 2 + 135) {
    isSinglePlayer = false;
    mode = GAME;
  }

  // Single Player 
  else if (mouseX > x - 130 && mouseX < x + 130 &&
      mouseY > height / 2 - 35 && mouseY < height / 2 + 35) {
    isSinglePlayer = true;
    mode = GAME;
  }
}
  
  
