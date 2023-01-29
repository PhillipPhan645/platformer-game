void intro() {
  introback.show();
  title();
  if (mouseReleased) mode = PLAY;
}




void title() {
  fill(white);
  textSize(50);

  //blink text
  counter = counter + 1;
  if (counter < 10) {
    fill(black);
    text("[ Press Start To Play ]", width/2, 500);
  }
  if (counter > 10) {
    fill(white);
    text("[ Press Start To Play ]", width/2, 500);
  }
  if (counter == 20) counter = 0;
}
