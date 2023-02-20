import processing.sound.*;

Door door;
Water water;
Building building;

int stage = 0;
float bombTime = 60;
boolean dead = false;

float floor = -1;
boolean doorClose = false;
boolean waiting = false;
float floorWish = floor;

//Allowed floors
boolean livingRoomOn = false;
boolean exitOn = false;
boolean aquariumOn = false;

void setup()  {
  size(1080, 1180);
  frameRate(25);
  
  //Create objects
  door = new Door();
  building = new Building();
  water = new Water();
  
  loadSounds();
  
  initButtons();
  
}


void draw()  {
  if (dead == false)  {
    background(0, 0, 0);
  
    //Show
    building.show();
    door.show();
  
    //Systems
    elevatorSystem();
    waterSystem();
    buttonCheck();
    stages();
    
  } else {
    background(100, 0, 0);
    
    fill(255, 255, 255);
    textSize(50);
    text("Game Over", width/2, height/2);
  }
}


void keyPressed()  {
  //If keyboard is used instead of arduino
  keyboardButtons();
}
