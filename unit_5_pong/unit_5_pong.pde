//Pong!

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int MODESELECT = 5;
boolean wkey, skey, upkey, downkey;

void setup() {
  size(800, 600);
  frameRate(60);
  mode = INTRO;
  

  
  if (mode == INTRO) {
  ballX = random(width * 0.25, width * 0.75);
  ballY = random(height * 0.25, height * 0.75);
  }
  
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 100;

  rightx = width;
  righty = height/2;
  rightd = 100;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 80;

  //initialize keyboard variables
  wkey = skey = upkey = downkey = false;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == MODESELECT) {
    modeSelect();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("mode error:" + mode);
  }
}
