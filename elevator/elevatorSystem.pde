void elevatorSystem() {
  //Set to correct floor
  boolean onFloor = building.setNewFloor(floor);
  
  
  //If on correct floor, open door
  if (onFloor == true && waiting == false){
    door.set(1);
  }
  
  if (waiting == true){
    door.set(0);
  }
  
  if (door.doorPos() == 0){
    floor = floorWish;
    waiting = false;
    
  }
}
