//Pong!

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity varaibles
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball

void setup(){
  size(800,600);
  mode = GAME;
  
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gmaeover();
  } else {
    printin("mode error:" + mode);
  }
