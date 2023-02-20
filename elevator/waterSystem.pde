void waterSystem(){
  if (door.doorPos() > 0.7 && building.floorPos() == -1 && water.waterHeight() > 0){
    water.move(-5);
  }
  
  if (door.doorPos() > 0 && building.floorPos() != -1 && water.waterHeight() < 1){
    water.move(20);
  }
  
  if (water.waterHeight() < 0.01){
    dead = true;
  }
  
  if (floor == 0 && water.waterHeight() < 0.9 && door.doorPos() > 0.5){
    building.addFire(false);
    stage = 5;
  }
  
  if (water.waterHeight() < 0.99){
    water.show();
    
  }
  
  
}
