public class Exit {
  //Images
  PImage background;
  PImage fire;
  
  int backgroundWidth;
  
  float yPos = 0;
  
  boolean fireOn = false;
  
  public Exit() {
    //Load images
    background = loadImage("images/exit2.png");
    fire = loadImage("images/exitFire.png");
    
    backgroundWidth = (height*15)/10;
    
    //Resize image
    background.resize(backgroundWidth, height);
    fire.resize(backgroundWidth, height);
  }
  
  void setYPos(float newYPos) {
    yPos = newYPos * height;
  }
  
  void show() {
    //Draw image
    image(background, (width/2)-backgroundWidth/2, yPos);
    
    if (fireOn == true){
      //Draw fire
      image(fire, (width/2)-backgroundWidth/2, yPos);
      
      //Sound
      if (fireSound.isPlaying() == false && door.doorPos() > 0.01){
        fireSound.play();
      }
    
      if (door.doorPos() < 0.01){
        fireSound.stop();
      }
      
    }
  }
  
  void fireOn(boolean on) {
    
    if (on == true){
      fireOn = true;
    } else {
      fireOn = false;
    }
    
    
    
  }
  
}
