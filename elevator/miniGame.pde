import processing.serial.*;
import cc.arduino.*;
//Arduino arduino;

class GameObject {
 
  boolean userHasJumped;
  boolean armed;
  boolean deltaArmed;
  float skipRopeAngle;
  float skipRopeAngleTemp;
  float speed;
  int threshold;
  int points;
  
  int modeButton;
  int triggerButton;
  int ledPin;
  int buttonPin;
  int[] debugColor;
  
  
  GameObject ( boolean tempUserHasJumped, boolean tempArmed, boolean tempDeltaArmed, float tempSkipRopeAngle, float tempSkipRopeAngleTemp, float tempSpeed, int tempThreshold, int tempPoints) {
    userHasJumped = tempUserHasJumped;
    armed = tempArmed;
    deltaArmed = tempDeltaArmed;
    skipRopeAngle = tempSkipRopeAngle;
    skipRopeAngleTemp = tempSkipRopeAngleTemp;
    speed = tempSpeed;
    threshold = tempThreshold;
    points = tempPoints;
    modeButton = 15;
    triggerButton = 14;
    ledPin = 16;
    buttonPin = 17;
    debugColor = new int[]{255,255,255};
    //arduino = new Arduino(this, Arduino.list()[6], 57600);
    
    shockInit();
  }
  
  void show() {
    push();
    
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    background(0);
    gamePlay();
    text(round(skipRopeAngle), width/2, height/2);
    text(speed, width/2, (height/2)-20);
    text(points, width/2, (height/2)-40);
    
    push();
    
    fill(debugColor[0],debugColor[1], debugColor[2]);
    rect(width/2, (height/2)-60, 20,20);
    
    pop();
    
    deltaArmed = armed;
    
    pop();
    
  }
  
  void gamePlay() 
{

  swingRope();
  showRope();

    if(arduino.digitalRead(buttonPin) == Arduino.LOW) 
    {
      userHasJumped = false;
      println("on ground");
      debugColor[0] = 255;
      debugColor[1] = 0;
      debugColor[2] = 0;
      arduino.digitalWrite(ledPin, Arduino.HIGH);
    }
      
    
    else 
    {
      userHasJumped = true;
      println("in air");
      debugColor[0] = 255;
      debugColor[1] = 255;
      debugColor[2] = 255;
      arduino.digitalWrite(ledPin, Arduino.LOW);
    }
    
  if(skipRopeAngle > 0 && skipRopeAngle < 180) {
   armed = true; 
  } else if (skipRopeAngle > 180) {
   armed = false;
  }
  
  if(skipRopeAngle > 170 && skipRopeAngle < 190 && userHasJumped == true && deltaArmed != armed) 
  {
    print("sucess");
    points += 1;
    speed *= 1.2;
  } 
  else 
  if (skipRopeAngle > 160 && skipRopeAngle < 200 && userHasJumped == false && deltaArmed != armed) 
  {
    print("failed");
    points -= 1;
  }
  
  if(points < 0) {
     print("get shocked");
     fire();
  } else {unfire();}
}
  
  void swingRope() {
    
   skipRopeAngleTemp += speed;
   skipRopeAngle = skipRopeAngle % 360;
    
  }
  void showRope() 
  {
   push();
    translate(width/2, height/2);
    noFill();
    strokeWeight(50);
    stroke(255,0,0);
    push();
    rotate(radians(85+180));
    arc(0, 0, 270, 270 , 0, radians(10), OPEN);
    pop();
  
    push();
     fill(255);
    strokeWeight(1);
    stroke(0);
    rotate(radians(skipRopeAngle));
    //circle(0, (height/3), 50);
    rect(0, height/3, 10, 50);

  pop();
  
 pop();
}

 void shockInit() {
   arduino.pinMode(modeButton, Arduino.OUTPUT);
  arduino.pinMode(triggerButton, Arduino.OUTPUT);
  arduino.pinMode(buttonPin, Arduino.INPUT);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  //Buttons on the remote are active LOW
  arduino.digitalWrite(modeButton,255); 
  arduino.digitalWrite(triggerButton, 255);
 }
 
 void fire() {
   arduino.digitalWrite(triggerButton, 0);
 }
 
 void unfire() {
    arduino.digitalWrite(triggerButton, 1); 
}
  
}
