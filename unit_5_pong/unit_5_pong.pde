//Pong!

//mode framework
color orange = #ED7B11;
color blue = #0066FF;
color red = #FF3333;

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
PFont arcade;


//entity varaibles
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float originalBalld = 80;  // matches initial size in setup()
float minBalld = 30;       // minimum allowed size


boolean wkey, skey, upkey, downkey;

//scoring
int leftscore, rightscore, timer;


void setup() {
  size(800, 600);
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
