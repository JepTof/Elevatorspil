public class LivingRoom {
  //Images
  PImage background;
  PImage bomb;
  
  int backgroundWidth;
  
  float yPos = 0;
  
  
  public LivingRoom() {
    //Load images
    background = loadImage("images/livingRoom.jpg");
    bomb = loadImage("images/bomb.png");
    
    backgroundWidth = (height*15)/10;
    
    //Resize image
    background.resize(backgroundWidth, height);
  }
  
  void setYPos(float newYPos) {
    yPos = newYPos * height;
  }
  
  void show() {
    //Draw image
    
    image(background, (width/2)-backgroundWidth/2, yPos);
    image(bomb, width/2 - 200, yPos + height*0.75);
    
    fill(255, 0, 0);
    
    textSize(20);
    text(bombTime, width/2 - 30, yPos + height*0.75 + 73);
  }
  
  
}
