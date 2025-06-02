float ballX, ballY;          // ball position
float ballSpeedX = 3;        // ball horizontal speed
float ballSpeedY = 2;        // ball vertical speed
float ballSize = 20;      
color ballColor = color(255, 200); // transparent

boolean introBallPlaced = false; //ball only spawns once

void intro() {
  background(orange);

  if (!introBallPlaced) {
    float buttonX = width / 2;
    float buttonY = height / 2 + 40;
    float buttonW = 200;
    float buttonH = 80;
    boolean insideButton;

    do {
      ballX = random(ballSize / 2, width - ballSize / 2);
      ballY = random(ballSize / 2, height - ballSize / 2);
      insideButton = ballX > buttonX - buttonW / 2 &&
                     ballX < buttonX + buttonW / 2 &&
                     ballY > buttonY - buttonH / 2 &&
                     ballY < buttonY + buttonH / 2;
    } while (insideButton);

    introBallPlaced = true;
  }

  // Update and draw bouncing ball
  updateBall();
  fill(ballColor);
  noStroke();
  ellipse(ballX, ballY, ballSize, ballSize);

  // Font
  arcade = createFont("PressStart2P-Regular.ttf", 20);
  textFont(arcade);

  // title
  fill(255); 
  textAlign(CENTER, CENTER);
  textSize(72);
  text("PONG", width / 2, height / 4);

  //Start Button
  fill(0); 
  rectMode(CENTER); 
  rect(width / 2, height / 2 + 40, 200, 80, 20); 

  // Button Text
  fill(255); 
  textSize(32);
  text("Start", width / 2, height / 2 + 40);
}

void updateBall() {
  // Move ball
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  // Wall collisions
  if (ballX < ballSize / 2 || ballX > width - ballSize / 2) {
    ballSpeedX *= -1;
  }
  if (ballY < ballSize / 2 || ballY > height - ballSize / 2) {
    ballSpeedY *= -1;
  }

  // Button collisions
  float buttonX = width / 2;
  float buttonY = height / 2 + 40;
  float buttonW = 200;
  float buttonH = 80;

  float closestX = constrain(ballX, buttonX - buttonW / 2, buttonX + buttonW / 2);
  float closestY = constrain(ballY, buttonY - buttonH / 2, buttonY + buttonH / 2);

  float distance = dist(ballX, ballY, closestX, closestY);

  if (distance < ballSize / 2) {
    if (abs(closestX - ballX) > abs(closestY - ballY)) {
      ballSpeedX *= -1;
    } else {
      ballSpeedY *= -1;
    }

    ballX += ballSpeedX;
    ballY += ballSpeedY;
  }
}

void introClicks() {
  if (mode == INTRO) {
    float buttonX = width / 2;
    float buttonY = height / 2 + 40;
    float buttonW = 200;
    float buttonH = 80;

    if (mouseX > buttonX - buttonW / 2 &&
        mouseX < buttonX + buttonW / 2 &&
        mouseY > buttonY - buttonH / 2 &&
        mouseY < buttonY + buttonH / 2) {
      mode = GAME;
    }
  }
}
