import processing.sound.*;

SoundFile file;

int x = 0;
int y = 0;
float speed = 12;
int count = -45;
int keys = UP;
int puntaje = 0;
PImage img;
boolean press = false;
int combo = 0;
String status = "";
boolean hit = false;
int y2= y;
int r = 0;
int g = 0;
int b = 0;
PImage Arriba;
PImage Derecha;
PImage Abajo;
PImage Izquierda;


void setup(){
  size(800, 700);
  Arriba = loadImage("Arriba_vacio.png");
  Derecha = loadImage("Derecha_vacio.png");
  Abajo = loadImage("Abajo_vacio.png");
  Izquierda = loadImage("Izquierda_vacio.png");
  file = new SoundFile(this, "In The Groove - Delirium.wav");
  file.play();

}
void draw(){
   keyReleased();
   background(0);
   image(Derecha,50,50,100,100);
   image(Abajo,150,50,100,100);
   image(Arriba,250,50,100,100);
   image(Izquierda,350,50,100,100);
   if (count == 46 || count == -45){
     count = 0;
     spawnRect(random(0,4));
   }
   move();
   textSize(20);
   stroke(255);
   text("Puntaje: " + puntaje,700,50);
   text("Combo: " + combo,700,100);
   fill(r,g,b);
   textSize(40);
   textAlign(CENTER);
   text(status,400,500);
}

void spawnRect(float i){
  if( i >= 3 && i <= 4){
    keys = LEFT;
    img = loadImage("Izquierda.png");
    y = 500;
    x = 50;
  }
  if( i >= 2 && i < 3){
     keys = DOWN;
     img = loadImage("Abajo.png");
     y = 500;
     x = 150;

  }
  if( i >= 0 && i < 1){
    keys = UP;
    img = loadImage("Arriba.png");
    y = 500;
    x = 250;
  }
  if( i >= 1 && i < 2){
    keys = RIGHT;
    img = loadImage("Derecha.png");
    y = 500;
    x = 350;
  }
}

void move(){
  if (keyPressed) {
    if (keyCode == keys && y < 35 && press == false) {
      puntaje += 100 * combo;
      combo++;
      press = true;
      hit = true;
      status = "Perfecto";
      y2 = y;
      r = 0;
      g = 255;
      b = 255;
    }
    if (keyCode == keys && y < 70 && y>= 35 && press == false) {
      puntaje += 50 * combo;
      combo++;
      press = true;
      hit = true;
      status = "Bien";
      y2 = y;
      r = 0;
      g = 255;
      b = 0;
    }
    if (keyCode == keys && y > 70 && press == false){
      combo = 1;
      status = "Mal";
      y2 = y;
      r = 255;
      g = 0;
      b = 0;
    }
    if (keyCode != keys && y > 70 && y < 450){
      combo = 1;
      status = "Mal";
      y2 = y;
      r = 255;
      g = 0;
      b = 0;
    }
  }
  if (hit != true && y == 0){
      combo = 1;
      status = "Mal";
      y2 = y;
      r = 255;
      g = 0;
      b = 0;
    }
  fill(255);
  image(img,x,y,100,100);
  y -= 1*speed;
  count++;
  if(x < 0){
    x = 540;
    hit = false;
  }
}
void keyReleased(){
  if (!keyPressed){
    press = false;
  }
}
