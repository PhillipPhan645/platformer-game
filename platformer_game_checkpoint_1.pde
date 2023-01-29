import fisica.*;
FWorld world;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

//mode framework
final int INTRO    = 0;
final int PLAY     = 1;
final int GAMEOVER = 2;
int mode;

//boolean variables
boolean mouseReleased;
boolean wasPressed;
boolean wkey, akey, skey, dkey, upkey, leftkey, downkey, rightkey, spacekey, qkey, ekey;
boolean jump;

//colors
color black = #000000;
color white = #FFFFFF;
color purple = #A020F0;
color blue = #0000FF;
color darkblue = #00008B;
color green = #00FF00;
color brown = #964B00;
color red = #FF0000;
color yellow = #FFFF00;
color pink = #FFC0CB;
color darkgreen = #286107;
color darkred = #570707;
color darkpurple = #301934;
color darkpink = #AA336A;
color pastelblue = #8288bd;
color darkyellow = #bfb637;
color grey = #808080;
color lightpurple = #c186eb;
color goombayellow= #fff200;
color wallred    = #690000;
color orange = #ff7b00;
color greythwomp = #4d4d4c;
color greenhammerbro = #184d32;
color brick = #450745;
color stonewall= #1a3828;
color bowserblue = #262691;


//int/float variables
int numberOfFrames;
int fram;
int counter;
int gridSize = 32;
float zoom = 1.5;
int lives = 3;


//Images
PImage[] lava;
PImage[] water;
PImage[] idle;
PImage[] up;
PImage[] run;
PImage[] action;
PImage[] goomba;
PImage[] hammerbro;
PImage sleepthowmp;
PImage awakethowmp;
PImage hammer;
PImage heart;
PImage bowser;
PImage chest;
PImage fireball;
Gif introback, lose, win;
PImage map;
PImage topgrass, stone, leftcornergrass, rightcornergrass, leftgrass, rightgrass, dirt, ice, slime, wood, woodandleaf, middleleaf, leftleaf, rightleaf, spike, bridge;


///setup---------------------------------
void setup() {
  size(800, 800);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
  Fisica.init(this);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

  loadImages();
  loadWorld(map);
  loadPlayer();
}

///draw---------------------------------
void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}

///jump detections---------------------------------
void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

//jump detections
boolean touch(FBox ground) {
  ArrayList<FContact> contactList = player.getContacts();
  int i = 0;
  while (i< contactList.size()) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground))
      return true;
    i++;
  }
  return false;
}

///functions---------------------------------
void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  //world.setGravity(0, 10000);
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = map.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c == green) {
        b.attachImage(topgrass);
        b.setFriction(4);
        b.setName("topgrass");
        world.add(b);
      } else if (c == purple) {
        b.attachImage(leftcornergrass);
        b.setFriction(4);
        b.setName("leftcornergrass");
        world.add(b);
      } else  if (c == yellow) {
        b.attachImage(leftgrass);
        b.setFriction(4);
        b.setName("leftgrass");
        world.add(b);
      } else if (c == pink) {
        b.attachImage(rightgrass);
        b.setFriction(4);
        b.setName("rightgrass");
        world.add(b);
      } else if (c == brown) {
        b.attachImage(dirt);
        b.setFriction(4);
        b.setName("dirt");
        world.add(b);
      } else if (c == darkblue) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      } else if (c == darkgreen) {
        b.attachImage(slime);
        b.setFriction(2);
        b.setRestitution(1);
        b.setName("slime");
        world.add(b);
      } else if (c == darkred) {
        b.attachImage(wood);
        b.setSensor(true);
        b.setFriction(4);
        b.setName("wood");
        world.add(b);
      } else  if (c == pastelblue) {
        b.attachImage(leftleaf);
        b.setFriction(4);
        b.setName("leftleaf");
        world.add(b);
      } else if (c == darkyellow) {
        b.attachImage(middleleaf);
        b.setFriction(4);
        b.setName("slime");
        world.add(b);
      } else if (c == darkpurple) {
        b.attachImage(woodandleaf);
        b.setFriction(4);
        b.setName("woodandleaf");
        world.add(b);
      } else if (c == darkpink) {
        b.attachImage(rightleaf);
        b.setFriction(4);
        b.setName("rightleaf");
        world.add(b);
      } else if (c == grey) {
        b.attachImage(spike);
        b.setFriction(4);
        b.setName("spike");
        world.add(b);
      } else if (c == lightpurple) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      } else if (c == orange) {
        FLava fl = new FLava(x*gridSize, y*gridSize);
        terrain.add(fl);
        world.add(fl);
      } else if (c == blue) {
        FWater fw = new FWater(x*gridSize, y*gridSize);
        terrain.add(fw);
        world.add(fw);
      } else if (c == wallred) {
        b.attachImage(dirt);
        b.setName("dirtwall");
        world.add(b);
      } else if (c == stonewall) {
        b.attachImage(stone);
        b.setName("stonewall");
        world.add(b);
      } else if (c == goombayellow) {
        FGoomba fg = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(fg);
        world.add(fg);
      } else if (c == greythwomp) {
        FThwomp ft = new FThwomp(x*gridSize-gridSize/2, y*gridSize+gridSize/2);
        enemies.add(ft);
        world.add(ft);
      } else if (c == greenhammerbro) {
        FHammerbro fh = new FHammerbro(x*gridSize, y*gridSize);
        enemies.add(fh);
        world.add(fh);
      } else if (c == brick) {
        b.attachImage(stone);
        b.setFriction(5);
        b.setName("brick");
        world.add(b);
      } else if (c== bowserblue) {
        FBowser fb = new FBowser(x*gridSize, y*gridSize);
        terrain.add(fb);
        world.add(fb);
      } else if (c == red) {
        b.attachImage(chest);
        b.setName("chest");
        world.add(b);
      }
    }
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void loadImages() {
  map = loadImage("platmap.png");
  topgrass = loadImage("topgrass.png");
  leftcornergrass = loadImage("leftcornergrass.png");
  rightcornergrass = loadImage("rightcornergrass.png");
  leftgrass = loadImage("leftgrass.png");
  rightgrass = loadImage("rightgrass.png");
  dirt = loadImage("dirt.png");
  dirt.resize(gridSize, gridSize);
  ice = loadImage("ice.png");
  ice.resize(32, 32);
  slime = loadImage("slime.png");
  slime.resize(32, 32);
  wood = loadImage("wood.png");
  woodandleaf = loadImage("woodandleaf.png");
  middleleaf = loadImage("middleleaf.png");
  leftleaf = loadImage("leftleaf.png");
  rightleaf = loadImage("rightleaf.png");
  spike = loadImage("spike.png");
  bridge = loadImage("bridge.png");
  lava();
  water();
  sleepthowmp = loadImage("sleepthowmp.png");
  sleepthowmp.resize(2*gridSize, 2*gridSize);
  awakethowmp = loadImage("awakethowmp.png");
  awakethowmp.resize(2*gridSize, 2*gridSize);
  hammer = loadImage("hammer.png");
  hammer.resize(gridSize, gridSize);
  stone = loadImage("brick.png");
  stone.resize(gridSize, gridSize);
  heart = loadImage("heart.png");
  heart.resize(gridSize, gridSize);
  introback = new Gif("introgif/frame_", "_delay-0.1s.gif", 40, 1, 0, 0, width, height);
  lose = new Gif("lose/frame_", "_delay-0.1s.gif", 30, 1, 0, 0, width, height);
  win = new Gif("win/frame_", "_delay-0.05s.gif", 12, 1, 0, 0, width, height);
  bowser = loadImage("bowser.png");
  bowser.resize(3*gridSize, 3*gridSize);
  chest = loadImage("chest.png");
  chest.resize(3*gridSize, 3*gridSize);
  fireball = loadImage("fireball.png");
  fireball.resize(3*gridSize, 2*gridSize);
  characters();
}

void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void lava() {
  numberOfFrames =6;
  lava = new PImage[numberOfFrames];

  int i = 0;
  while (i < numberOfFrames) {
    lava[i] = loadImage("lava"+i+".png");
    i++;
  }
}


void water() {
  fram =4;
  water = new PImage[fram];

  int i = 0;
  while (i < fram) {
    water[i] = loadImage("water"+i+".png");
    i++;
  }
}

void characters() {
  //player
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  up = new PImage[1];
  up[0] = loadImage("jump0.png");

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");

  action = idle;

  //goomba
  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  hammerbro = new PImage[2];
  hammerbro[0] = loadImage("hammerbro0.png");
  hammerbro[0].resize(gridSize, gridSize);
  hammerbro[1] = loadImage("hammerbro1.png");
  hammerbro[1].resize(gridSize, gridSize);
}

void reset() {
  Fisica.init(this);
  player.setPosition(50, 1450);

  loadWorld(map);
  loadPlayer();
  play();
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

  loadImages();
  loadWorld(map);
  loadPlayer();
}

void ouch() {
  player.setPosition(50, 1450);
  lives--;
}
