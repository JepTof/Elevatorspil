public class Bunker{
  //Images
  PImage background;
  
  int backgroundWidth;
  
  float yPos = 0;
  
  
  public Bunker() {
    //Load images
    background = loadImage("images/concreteWall.jpg");
    
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
    
    push();
    
    rectMode(CENTER);
    
    rect(width/2, yPos + height/2, 400, 400);
    
    pop();
  }
  
  
}
