float vx = 6;
float vy = 9;


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
  if (wkey) lefty -= 8;
  if (skey) lefty += 8;
  if (upkey) righty -= 8;
  if (downkey) righty += 8;

  // move ball
  ballx += vx;
  bally += vy;

  // wall bounce
  if (bally < balld / 2 || bally > height - balld / 2) {
    vy *= -1;
  }

  // paddle collision (left)
  float leftDist = dist(ballx, bally, leftx, lefty);
  if (leftDist < (balld / 2 + leftd / 2) && ballx < width / 2) {
    float offset = (bally - lefty) / (leftd / 2);
    float angle = offset * PI / 4;
    float speed = sqrt(vx * vx + vy * vy);
    vx = speed * cos(angle);
    vy = speed * sin(angle);

    balld = max(minBalld, balld - 3);
  }

  // paddle collision (right)
  float rightDist = dist(ballx, bally, rightx, righty);
  if (rightDist < (balld / 2 + rightd / 2) && ballx > width / 2) {
    float offset = (bally - righty) / (rightd / 2);
    float angle = offset * PI / 4;
    float speed = sqrt(vx * vx + vy * vy);
    vx = -speed * cos(angle);
    vy = speed * sin(angle);

    balld = max(minBalld, balld - 3);
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
  
  if (bally < balld / 2) {
  bally = balld / 2 + 1; // Nudge slightly away
  if (vy < 0) vy *= -1;
}

// Bottom wall
if (bally > height - balld / 2) {
  bally = height - balld / 2 - 1; // Nudge slightly away
  if (vy > 0) vy *= -1;
}
}


void resetBall() {
  ballx = width / 2;
  bally = height / 2;
  vx = random(6, 9) * (random(1) < 0.5 ? -1 : 1);
  vy = random(6, 9) * (random(1) < 0.5 ? -1 : 1);
  balld = originalBalld;  // Reset ball size
}

void gameClicks() {
  
}
