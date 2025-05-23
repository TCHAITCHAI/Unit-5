void game(){
  background(0);
  
  //draw paddles
  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);
  
  //move paddles
  if (wkey == true) lefty = lefty;
  
  //ball
  circle(ballx, bally, balld);
}

void gameClicks() {
  
}
