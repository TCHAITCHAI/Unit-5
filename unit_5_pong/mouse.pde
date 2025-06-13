void mouseReleased() {
  
  if (mode == INTRO) {
    introClicks();
  } else if (mode == MODESELECT) {
    modeSelectClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }

}
