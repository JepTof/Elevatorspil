void buttonCheck() {

  if (buttons[3].hasBeenPressed() && livingRoomOn){
    //doorClose = true;
    waiting = true;
    
    floorWish = 1;
  }
  
  if (buttons[2].hasBeenPressed() && exitOn){
    //doorClose = true;
    waiting = true;
    
    floorWish = 0;
  }
  
  
  if (buttons[0].hasBeenPressed() && aquariumOn){
    //doorClose = true;
    waiting = true;
    
    floorWish = -1;
  }
  
}


//If keyboard is used instead of arduino
void keyboardButtons() {
  
  //If in aquarium and power is turned on
  if (stage == 0 && key == 's'){
    stage = 1;
    print("Power on");
  }
  
  //If in living room and power is turned off
  if (stage == 1 && key == 'd' && floor == 1){
    stage = 2;
    
    print("Power off");
    
    //Go to bunker
    //doorClose = true;
    waiting = true;
    floorWish = -2;
    building.setSpeed(0.5);
  }
  
  //If in aquarium and power is turned off
  if (stage == 1 && key == 'd' && floor == -1){
    stage = 0;
    print("Power off");
  }
  
  //If in bunker and power is turned on
  if (stage == 2 && key == 's' && floor == -2){
    stage = 3;
    print("Power on");
    building.setSpeed(0.01);
  }
  
  //If in bunker and power is turned off
  if (stage == 3 && key == 'd' && floor == -2){
    stage = 2;
    print("Power off");
  }
  
  //If in bunker and minigame is won
  if (stage == 3 && key == 'g' && floor == -2){
    stage = 4;
    print("Minigame won");
    
    building.addFire(true);
  }
  
  
  //Elevator buttons
  
  if (key == 'u' && livingRoomOn){
    //doorClose = true;
    waiting = true;
    
    floorWish = 1;
  }
  
  if (key == 'i' && exitOn){
    //doorClose = true;
    waiting = true;
    
    floorWish = 0;
  }
  
  
  if (key == 'o' && aquariumOn){
    //doorClose = true;
    waiting = true;
    
    floorWish = -1;
  }
  
}
