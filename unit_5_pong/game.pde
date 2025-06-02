float vx = 2;
float vy = 3;

void game() {
  background(0);

  // center line
  strokeWeight(5);
  stroke(255);
  line(width / 2, 0, width / 2, height);

  // scoreboard
  textSize(50);
  fill(blue);
  text(leftscore, width / 4, 100);
  fill(red);
  text(rightscore, 3 * width / 4, 100);

  // draw paddles
  fill(blue);
  circle(leftx, lefty, leftd);
  fill(red);
  circle(rightx, righty, rightd);

  // move paddles
  if (wkey) lefty -= 5;
  if (skey) lefty += 5;
  if (upkey) righty -= 5;
  if (downkey) righty += 5;

  // move ball
  ballx += vx;
  bally += vy;

  // wall bounce (top/bottom)
  if (bally < balld / 2 || bally > height - balld / 2) {
    vy *= -1;
  }

  // paddle collision (left)
  float leftDist = dist(ballx, bally, leftx, lefty);
  if (leftDist < (balld / 2 + leftd / 2)) {
    if (ballx < width / 2) {
      vx *= -1;
      ballx = leftx + (balld / 2 + leftd / 2); // prevent sticking
    }
  }

  // paddle collision (right)
  float rightDist = dist(ballx, bally, rightx, righty);
  if (rightDist < (balld / 2 + rightd / 2)) {
    if (ballx > width / 2) {
      vx *= -1;
      ballx = rightx - (balld / 2 + rightd / 2); 
    }
  }

  // scoring
  if (ballx < 0) {
    rightscore++;
    resetBall();
  }
  if (ballx > width) {
    leftscore++;
    resetBall();
  }

  // draw ball
  fill(orange);
  circle(ballx, bally, balld);
}

void resetBall() {
  ballx = width / 2;
  bally = height / 2;
  vx = random(2, 4) * (random(1) < 0.5 ? -1 : 1);
  vy = random(2, 4) * (random(1) < 0.5 ? -1 : 1);
}

void gameClicks(){
  
}
