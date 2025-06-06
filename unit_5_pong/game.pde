float vx = 4;
float vy = 6;
float maxSpeed = 15;
color orange = #ED7B11;
color blue = #0066FF;
color red = #FF3333;


//entity varaibles
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float originalBalld = 80;  // matches initial size in setup()
float minBalld = 30;       // minimum allowed size

PFont arcade;

//scoring
int leftscore, rightscore, timer;

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
  
  lefty = constrain(lefty, leftd / 2, height - leftd / 2);
  righty = constrain(righty, rightd / 2, height - rightd / 2);

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
    
    // accelerate
    vx = speed * cos(angle)*1.05; 
    vy = speed * sin(angle)*1.05;

    balld = max(minBalld, balld - 3);
    limitSpeed();
  }

  // paddle collision (right)
  float rightDist = dist(ballx, bally, rightx, righty);
  if (rightDist < (balld / 2 + rightd / 2) && ballx > width / 2) {
    float offset = (bally - righty) / (rightd / 2);
    float angle = offset * PI / 4;
    float speed = sqrt(vx * vx + vy * vy);
    
    // accelerate
    vx = -speed * cos(angle)*1.05;
    vy = speed * sin(angle)*1.05;

    balld = max(minBalld, balld - 3);
    limitSpeed();
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

// reset at random places
void resetBall() {
  ballx = width / 2;
  bally = height / 2;
  vx = random(4, 6) * (random(1) < 0.5 ? -1 : 1);
  vy = random(4, 6) * (random(1) < 0.5 ? -1 : 1);
  balld = originalBalld;  // Reset ball size
}

// max speed
void limitSpeed() {
  float speed = sqrt(vx * vx + vy * vy);
  if (speed > maxSpeed) {
    float scale = maxSpeed / speed;
    vx *= scale;
    vy *= scale;
  }
}
void gameClicks(){
  
}
