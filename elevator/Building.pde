public class Building {
  Bunker bunker;
  Aquarium aquarium;
  Exit exit;
  LivingRoom livingRoom;
  
  //Floor
  float floorNow = floor;
  float floorSpeed = 0.01;
  float floorNowRound;
  
  float bunkerFloor = 2;
  float aquariumFloor = 1;
  float exitFloor = 0;
  float livingRoomFloor = -1;
  
  public Building() {
    bunker = new Bunker();
    aquarium = new Aquarium();
    exit = new Exit();
    livingRoom = new LivingRoom();
  }
  
  boolean setNewFloor(float newFloor)  {
    
    //Move floor to new position
    if(floorNow < newFloor)  {
      floorNow += floorSpeed;
      
    }
    
    if(floorNow > newFloor)  {
      floorNow -= floorSpeed;
      
    }
    
    //Chech if we are on the wanted floor
    if (floorNowRound == newFloor)  {
      return(true);
      
    } else {
      return(false);
    }
    
  }
  
  void show() {
    
    floorNowRound = float(round(floorNow * 10))/10.0;
    
    livingRoom.setYPos(livingRoomFloor + floorNow);
    if(livingRoomFloor + floorNow < 1 && livingRoomFloor + floorNow > -1)  {
      livingRoom.show();
    }
    
    exit.setYPos(exitFloor + floorNow);
    if(exitFloor + floorNow < 1 && exitFloor + floorNow > -1)  {
      exit.show();
    }
    
    aquarium.setYPos(aquariumFloor + floorNow);
    if(aquariumFloor + floorNow < 1 && aquariumFloor + floorNow > -1)  {
      aquarium.show();
    }
    
    bunker.setYPos(bunkerFloor + floorNow);
    if(bunkerFloor + floorNow < 1 && bunkerFloor + floorNow > -1)  {
      bunker.show();
    }
    
  }
  
  float floorPos()  {
    return(floorNowRound);
  }
  
  void setSpeed(float newSpeed)  {
    floorSpeed = newSpeed;
  }
  
  void addFire(boolean addFire)  {
    exit.fireOn(addFire);
  }
  
  
}
