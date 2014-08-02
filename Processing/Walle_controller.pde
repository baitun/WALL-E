// Controll servo on arduino

import processing.serial.*;

//key codes
final int PAGE_UP=33;
final int PAGE_DOWN=34;
final int HOME=36;
final int END=35;

Serial myPort;
int angle=90; //initial angle

void setup(){
  size(640,480);
  printArray(Serial.list());
  String portName = Serial.list()[0];//change this to your port
  myPort = new Serial(this, portName, 9600);
  myPort.write(angle);
  textSize(64);
  textAlign(CENTER, CENTER);
}

void draw(){
  clear();
  fill(255);
  text(angle, 320, 240);
  fill(0,255,0);
  text("savinyurii.ru/DIY",320 ,32);
}

void keyPressed() {
  if(key==CODED) {
    switch(keyCode){
      case LEFT: angle--; break;
      case RIGHT: angle++; break;
      case UP: angle=90; break;
      case PAGE_UP: angle+=10; break;
      case PAGE_DOWN: angle-=10; break;
      case HOME: angle=0; break;
      case END: angle=180; break;
    }
    if(angle<0) angle=180;
    if(angle>180) angle=0;
     myPort.write(angle);
     delay(20);
  }
}
