// Sweep


#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 0;    // variable to store the servo position 
 
void setup() 
{ 
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
  Serial.begin(9600);
} 
 
 
void loop() 
{ 
  if(Serial.available()>0){
    byte angel=Serial.read();
    Serial.println(angel);
    myservo.write(angel);
  }
  delay(1);
} 
