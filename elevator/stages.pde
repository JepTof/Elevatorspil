void stages(){
  
  //Water part
  if (stage == 0){
    //Allowed floors
    livingRoomOn = false;
    exitOn = false;
    aquariumOn = false;
  }
  
  //Bomb part
  if (stage == 1){
    //Allowed floors
    livingRoomOn = true;
    exitOn = false;
    aquariumOn = true;
    
    bombTime -= 0.1;
    
    if (bombTime < 0 && dead == false){
      dead = true;
      explosionDeep.play();
    }
  }
  
  //Bunker part and Game part
  if (stage == 2 && stage == 3){
    //Allowed floors
    livingRoomOn = false;
    exitOn = false;
    aquariumOn = false;
    
    bombTime -= 0.1;
    
    if (bombTime < 0 && dead == false){
      explosionDeep.play();
    }
  }
  
  //Fire part
  if (stage == 4){
    //Allowed floors
    livingRoomOn = false;
    exitOn = true;
    aquariumOn = true;
  }
  
  //Won
  if (stage == 5){
    //Allowed floors
    livingRoomOn = false;
    exitOn = false;
    aquariumOn = false;
    
    //You won text
    fill(255, 255, 255);
    textSize(50);
    text("You Won!", width/2, height/2);
  }
  
}
