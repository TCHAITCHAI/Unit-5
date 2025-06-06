

void pause() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(48);
  text("Game Paused", width / 2, height / 2 - 60);
  textSize(28);
  text("Press ENTER to keep playing", width / 2, height / 2);
  text("Click below to quit to menu", width / 2, height / 2 + 50);
  

  stroke(255);
  strokeWeight(5);
  fill(200);
  rect(400, 430, 220, 50, 10); // rounded corners
  textSize(16);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Quit to Menu",400,430);
}

void pauseClicks(){
   if (mode == PAUSE) {
    if (mouseX > 295 && mouseX < 505 &&
        mouseY > 408 && mouseY < 453) {
      mode = INTRO;
      leftscore = 0;
      rightscore = 0;
        }
      }
}
