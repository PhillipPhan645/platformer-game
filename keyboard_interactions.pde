void keyPressed() {
  if (key == 'S' || key == 's') skey = true;
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'Q' || key == 'q') qkey = true;
  if (key == 'E' || key == 'e') ekey = true;
  if (key == ' ') spacekey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == UP) upkey = true;
  if (key == LEFT) leftkey = true;
  if (key == RIGHT) rightkey = true;
}

void keyReleased() {
  if (key == 'S' || key == 's') skey = false;
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'Q' || key == 'q') qkey = false;
  if (key == 'E' || key == 'e') ekey = false;
  if (key == ' ') spacekey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == UP) upkey = false;
  if (key == LEFT) leftkey = false;
  if (key == RIGHT) rightkey = false;
}
