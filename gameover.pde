void gameOver() {
  background(black);
  lose();
  win();
  textSize(90);
  fill(black);


  if (mouseReleased) {
    reset();
    mode = INTRO;
    lives = 1;
  }
}

void lose() {
  if (lives <= 0) {
    lose.show();
  }
}

void win() {
  if (lives >= 1) {
    win.show();
  }
}
