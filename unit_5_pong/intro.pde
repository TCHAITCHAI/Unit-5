float ballX, ballY;          // Ball position
float ballSpeedX = 3;        // Ball horizontal speed
float ballSpeedY = 2;        // Ball vertical speed
float ballSize = 20;         // Ball diameter
color ballColor = color(255, 200); // White with transparency


void intro() {
  background(orange);
  
  // Update and draw bouncing ball
  updateBall();
  fill(ballColor);
  noStroke();
  ellipse(ballX, ballY, ballSize, ballSize);
  
  //font
  arcade = createFont("PressStart2P-Regular.ttf", 20);
  textFont(arcade);
  
  // Draw title
  fill(255); // white 
  textAlign(CENTER, CENTER);
  textSize(72);
  text("PONG", width/2, height/4);

  // Draw Start Button
  fill(0); // black button
  rectMode(CENTER); // Easier collision detection
  rect(width/2, height/2 + 40, 200, 80, 20); // Center aligned

  // Button Text
  fill(255); // white text
  textSize(32);
  text("Start", width/2, height/2 + 40);
}

void updateBall() {
  // Move ball
  ballX += ballSpeedX;
  ballY += ballSpeedY;
  
  // Wall collisions
  if (ballX < ballSize/2 || ballX > width - ballSize/2) {
    ballSpeedX *= -1;
  }
  if (ballY < ballSize/2 || ballY > height - ballSize/2) {
    ballSpeedY *= -1;
  }
  
  // Button collision 
  float buttonX = width/2;
  float buttonY = height/2 + 40;
  float buttonW = 200;
  float buttonH = 80;
  
  // Calculate distance from ball to button center
  float closestX = constrain(ballX, buttonX - buttonW/2, buttonX + buttonW/2);
  float closestY = constrain(ballY, buttonY - buttonH/2, buttonY + buttonH/2);
  
  float distance = dist(ballX, ballY, closestX, closestY);
  
  // Collision detection
  if (distance < ballSize/2) {
    // Determine bounce direction
    if (abs(closestX - ballX) > abs(closestY - ballY)) {
      ballSpeedX *= -1; // Horizontal bounce
    } else {
      ballSpeedY *= -1; // Vertical bounce
    }
    
    // Slight reposition to prevent sticking
    ballX += ballSpeedX;
    ballY += ballSpeedY;
  }
}



void introClicks() {
  if (mode == INTRO) {
    float buttonX = width/2;
    float buttonY = height/2 + 40;
    float buttonW = 200;
    float buttonH = 80;
    
    // Improved hitbox using center alignment
    if (mouseX > buttonX - buttonW/2 && 
        mouseX < buttonX + buttonW/2 &&
        mouseY > buttonY - buttonH/2 && 
        mouseY < buttonY + buttonH/2) {
      mode = GAME;
    }
  }
}
