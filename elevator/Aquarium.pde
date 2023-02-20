public class Aquarium {
  //Images
  PImage background;
  PImage brokenGlass;
  
  
  
  float yPos = 0;
  
  public Aquarium() {
    //Load images
    background = loadImage("images/aquariumBackground.jpg");
    brokenGlass = loadImage("images/glassBroken3.png");
    
    //Resize image
    background.resize((height*15)/10, height);
  }
  
  void setYPos(float newYPos) {
    yPos = newYPos * height;
  }
  
  void show() {
    //Draw image
    image(background, 0, yPos);
    image(brokenGlass, width/2, yPos + height/2);
    
    //Sound
    if (underwaterSound.isPlaying() == false && door.doorPos() > 0.01)  {
      underwaterSound.play();
    }
    
    if (door.doorPos() < 0.01)  {
      underwaterSound.stop();
    }
  }
  
  
}
